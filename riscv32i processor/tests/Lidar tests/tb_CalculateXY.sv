// =====================================================================
// tb_CalculateXY.sv
//
// Testbench za CalculateXY modul (lidar polar -> pixel koordinate).
//
// Kodiranje ulaza (po specifikaciji):
//   - distance  : u milimetrima, max 2300 (2.3 m)
//   - angle     : ugao * 100 (npr. 1 stepen = 100, 12 stepeni = 1200)
//
// Pipeline latencija DUT-a je 1 takt (ROM_SIN ima registrovan izlaz,
// distance prolazi kroz REG16_LD_CL registar), zato se posle
// postavljanja ulaza ceka jedna uzlazna ivica clk-a pre citanja
// x_pixel / y_pixel.
//
// Za svaki test vektor ispisuje se HW rezultat (x_pixel, y_pixel) i,
// radi sanity-checka, priblizna ocekivana vrednost racunata u realnoj
// (floating point) aritmetici po istoj geometriji koju implementira
// hardver:
//    x_pixel = 320 + round(distance * cos(angle) / 16)
//    y_pixel = 240 - round(distance * sin(angle) / 16)
// (centar platna 320x240, rezolucija 16 mm/pixel - ova dva broja
// dolaze direktno iz konstanti u CalculateXY.v: 320, 240 i x_lidar[12:4]
// odnosno y_lidar[12:4], tj. deljenje sa 16).
//
// Zbog kvantizacije sinusne tabele (64 koraka na 90 stepeni, tj. korak
// od ~1.406 stepeni) i fixed-point zaokruzivanja, ocekuje se odstupanje
// od par piksela u odnosu na "idealnu" float vrednost - to NIJE bug,
// vec normalna HW kvantizaciona greska, zato se poredi sa tolerancijom.
// =====================================================================

`timescale 1ns/1ps

module tb_CalculateXY;

    localparam real PI = 3.14159265358979323846;

    // tolerancija za sanity-check (u pikselima)
    localparam integer TOL = 4;

    reg         clk;
    reg  [15:0] angle;      // ugao * 100 (0 .. 35999)
    reg  [15:0] distance;   // mm (0 .. 2300)
    wire [15:0] x_pixel;
    wire [15:0] y_pixel;

    integer pass_count;
    integer fail_count;

    // ---------------------------------------------------------------
    // DUT
    // ---------------------------------------------------------------
    CalculateXY dut (
        .clk      (clk),
        .angle    (angle),
        .distance (distance),
        .x_pixel  (x_pixel),
        .y_pixel  (y_pixel)
    );

    // ---------------------------------------------------------------
    // Clock: 10 ns perioda (100 MHz), samo za potrebe simulacije
    // ---------------------------------------------------------------
    initial clk = 1'b0;
    always #5 clk = ~clk;

    // ---------------------------------------------------------------
    // Task: primeni jedan (angle100, distance_mm) vektor, sacekaj
    // pipeline latenciju i odstampaj/proveri rezultat
    // ---------------------------------------------------------------
    task automatic run_vector(input integer angle100, input integer distance_mm);
        real angle_deg, angle_rad;
        real x_mm, y_mm;
        integer exp_x, exp_y;
        integer dx, dy;
        begin
            // postavi ulaze malo posle negedge, da ima pun setup do
            // sledeceg posedge-a
            @(negedge clk);
            angle    = angle100[15:0];
            distance = distance_mm[15:0];

            // pipeline latencija DUT-a = 1 takt (registrovan ROM izlaz
            // + registrovana kasna distanca)
            @(posedge clk);
            #2; // pusti kombinacionu logiku iza registara da se slegne

            // ---- referentni (float) model ----
            angle_deg = angle100 / 100.0;
            angle_rad = angle_deg * PI / 180.0;
            x_mm = distance_mm * $cos(angle_rad);
            y_mm = distance_mm * $sin(angle_rad);
            exp_x = 320 + $rtoi(x_mm / 16.0 + (x_mm >= 0 ? 0.5 : -0.5));
            exp_y = 240 - $rtoi(y_mm / 16.0 + (y_mm >= 0 ? 0.5 : -0.5));

            dx = $signed(x_pixel) - exp_x;
            dy = $signed(y_pixel) - exp_y;
            if (dx < 0) dx = -dx;
            if (dy < 0) dy = -dy;

            $display("angle=%7.2f deg  distance=%5d mm  ->  x_pixel=%0d  y_pixel=%0d   (ocekivano ~[%0d,%0d], |dx|=%0d |dy|=%0d)%s",
                      angle_deg, distance_mm, $signed(x_pixel), $signed(y_pixel),
                      exp_x, exp_y, dx, dy,
                      (dx <= TOL && dy <= TOL) ? "  [OK]" : "  [PROVERI]");

            if (dx <= TOL && dy <= TOL)
                pass_count = pass_count + 1;
            else
                fail_count = fail_count + 1;
        end
    endtask

    // ---------------------------------------------------------------
    // Test vektori
    // ---------------------------------------------------------------
    initial begin
        pass_count = 0;
        fail_count = 0;
        angle    = 16'd0;
        distance = 16'd0;

        // par ciklova da se sve resetuje na pocetne vrednosti
        @(posedge clk);
        @(posedge clk);

        $display("========================================================================");
        $display(" LIDAR CalculateXY test - polar (angle*100, distance[mm]) -> pixel (x,y)");
        $display("========================================================================");

        // Karakteristicni uglovi (0, 90, 180, 270 stepeni) na max distanci
        run_vector(0,     2300);   //   0 stepeni, max distanca
        run_vector(9000,  2300);   //  90 stepeni
        run_vector(18000, 2300);   // 180 stepeni
        run_vector(27000, 2300);   // 270 stepeni

        // Primer iz teksta zahteva: 1 stepen = 100, 12 stepeni = 1200
        run_vector(100,   1000);   //   1 stepen,  1 m
        run_vector(1200,  1500);   //  12 stepeni, 1.5 m

        // Uglovi po kvadrantima, razne distance
        run_vector(4500,  2000);   //  45 stepeni
        run_vector(13500, 1800);   // 135 stepeni
        run_vector(22500, 900);    // 225 stepeni
        run_vector(31500, 700);    // 315 stepeni

        // Granicni slucajevi
        run_vector(0,     0);      // nulta distanca
        run_vector(35999, 2300);   // skoro pun krug, max distanca
        run_vector(17999, 2300);   // tik ispod 180 stepeni
        run_vector(100,   2300);   // 1 stepen, max distanca

        $display("========================================================================");
        $display(" Rezultat: %0d OK / %0d za proveru (od %0d vektora, tolerancija=%0d px)",
                   pass_count, fail_count, pass_count + fail_count, TOL);
        $display("========================================================================");

        $finish;
    end

endmodule
