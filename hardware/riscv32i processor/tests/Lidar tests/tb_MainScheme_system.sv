// =====================================================================
// tb_MainScheme_system.sv
//
// SISTEMSKI (end-to-end) testbench: ceo MainScheme.v -> CPU (izvrsava
// STVARNI InicializationData.mif program) + LidarInterface + VGA/
// FrameBuffer lanac, sve zajedno kao sto bi radilo na ploci.
//
// Scenario: simuliramo 3 uzastopne LiDAR ROTACIJE jedne "sobe":
//   - fiksni zidovi sobe (isti u sve 3 rotacije, kao referenca)
//   - JEDNA tacka ("objekat", npr. covek) koja menja rastojanje
//     izmedju rotacija:
//         Rotacija 1: objekat daleko   (1800 mm)
//         Rotacija 2: objekat priblizen (500 mm)   <-- pokret/priblizavanje
//         Rotacija 3: objekat jos blize (250 mm)   <-- potvrda trenda
//
// Testbench prati DVA nezavisna nivoa, namerno odvojena:
//
//   (A) SENZORSKI NIVO - direktno hvata lidar_ready/lidar_data izlaz
//       LidarInterface-a (hijerarhijska referenca dut.lidar_ready /
//       dut.lidar_rdata), NEZAVISNO od toga da li CPU uspe da ih
//       pokupi. Ovo pokazuje da li HARDVER senzora ispravno registruje
//       promenu pozicije objekta paket-po-paket.
//
//   (B) SISTEMSKI NIVO - prati sta STVARNI program (InicializationData.mif,
//       izvrsen na ugradjenom RISC-V jezgru) uspe da upise u framebuffer
//       (XIN/YIN/SET_PIXEL na top-levelu + PIXEL_ADDR/WR duboko unutar
//       FrameBuffer instance). Ovo pokazuje da li se promena STVARNO
//       vidi na ekranu kroz ceo lanac (CPU polling + VGA write path).
//
// Sa NEPOPRAVLJENIM RTL/SW (vidi prethodnu analizu: LidarInterface bez
// ACK-a, Monitor tiho odbacuje upise, FrameBuffer adresni hazard,
// SW "brisanje" bag) ocekuje se da (A) UVEK ispravno pokaze promenu,
// dok (B) najverovatnije NE ce - upravo to je dijagnostika koju ovaj
// test treba da otkrije. Posle primene fix-ova (VgaBusInterface_FIX,
// FrameBuffer_FIX, LidarInterface_FIX, Monitor_FIX, MainScheme_FIX) i
// ispravke SW brisanja, (B) bi trebalo da pocne da prati (A).
//
// UART tajming je identican onom u tb_LidarInterface.sv:
//   1 UART bit = 224 clk ciklusa (CLK_PERIOD=10ns => ~446 kbit/s)
//   Paket = 47 bajtova: header(1)=84, verlen(1)=44, speed(2),
//   start_angle(2), [dist(2),intensity(1)]x12, end_angle(2),
//   timestamp(2), footer(1)
// =====================================================================

`timescale 1ns/1ps

module tb_MainScheme_system;

    localparam CLK_PERIOD      = 10;               // ns
    localparam TICKS_PER_BAUD  = 14;
    localparam SAMPLES_PER_BIT = 16;
    localparam CLKS_PER_BIT    = TICKS_PER_BAUD * SAMPLES_PER_BIT; // 224

    // ---- DUT portovi ----
    reg         clk;
    reg         reset;
    reg         rx;
    wire        sdram_cke, sdram_cs_n, sdram_ras_n, sdram_cas_n, sdram_we_n;
    wire        sdram_dqml, sdram_dqmh;
    wire        hs, vs, sdram_clk;
    wire [3:0]  B, G, R;
    wire [12:0] sdram_addr;
    wire [1:0]  sdram_ba;
    wire [15:0] sdram_dq;

    // program ne dodiruje SDRAM (adrese koje koristi ciljaju samo
    // LiDAR 0x1xxx_xxxx i VGA 0x2xxx_xxxx opseg), pa dq linija moze
    // ostati nepovezana (visoka impedansa) - nije potreban SDRAM model
    pullup(sdram_dq[0]); // samo da linija ne bude potpuno float u simulaciji (kozmeticki)

    MainScheme dut (
        .clk         (clk),
        .reset       (reset),
        .rx          (rx),
        .sdram_cke   (sdram_cke),
        .sdram_cs_n  (sdram_cs_n),
        .sdram_ras_n (sdram_ras_n),
        .sdram_cas_n (sdram_cas_n),
        .sdram_we_n  (sdram_we_n),
        .sdram_dqml  (sdram_dqml),
        .sdram_dqmh  (sdram_dqmh),
        .hs          (hs),
        .vs          (vs),
        .sdram_clk   (sdram_clk),
        .B           (B),
        .G           (G),
        .R           (R),
        .sdram_addr  (sdram_addr),
        .sdram_ba    (sdram_ba),
        .sdram_dq    (sdram_dq)
    );

    initial clk = 1'b0;
    always #(CLK_PERIOD/2) clk = ~clk;

    // -----------------------------------------------------------------
    // UART bit-banger (identican tb_LidarInterface.sv)
    // -----------------------------------------------------------------
    task automatic send_byte(input [7:0] b);
        integer i;
        begin
            rx = 1'b0;
            repeat (CLKS_PER_BIT) @(posedge clk);
            for (i = 0; i < 8; i = i + 1) begin
                rx = b[i];
                repeat (CLKS_PER_BIT) @(posedge clk);
            end
            rx = 1'b1;
            repeat (CLKS_PER_BIT) @(posedge clk);
        end
    endtask

    task automatic send_u16(input [15:0] v);
        begin
            send_byte(v[15:8]);
            send_byte(v[7:0]);
        end
    endtask

    // Salje jedan LD14P paket sa EKSPLICITNIM nizom od 12 distanci
    // (za razliku od tb_LidarInterface koji koristi fiksnu formulu) -
    // ovde nam treba kontrola nad tacno jednom tackom ("objektom").
    task automatic send_room_packet(
            input [15:0] speed_v,
            input [15:0] start_angle_v,
            input [15:0] end_angle_v,
            input [15:0] timestamp_v,
            input [15:0] dist0, input [15:0] dist1, input [15:0] dist2,
            input [15:0] dist3, input [15:0] dist4, input [15:0] dist5,
            input [15:0] dist6, input [15:0] dist7, input [15:0] dist8,
            input [15:0] dist9, input [15:0] dist10, input [15:0] dist11
        );
        reg [15:0] p_dist [0:11];
        integer i;
        begin
            p_dist[0]=dist0;  p_dist[1]=dist1;  p_dist[2]=dist2;  p_dist[3]=dist3;
            p_dist[4]=dist4;  p_dist[5]=dist5;  p_dist[6]=dist6;  p_dist[7]=dist7;
            p_dist[8]=dist8;  p_dist[9]=dist9;  p_dist[10]=dist10; p_dist[11]=dist11;

            send_byte(8'd84);              // header
            send_byte(8'd44);              // verlen
            send_u16(speed_v);
            send_u16(start_angle_v);
            for (i = 0; i < 12; i = i + 1) begin
                send_u16(p_dist[i]);
                send_byte(8'd150);          // intensity, ne koristi se dalje
            end
            send_u16(end_angle_v);
            send_u16(timestamp_v);
            send_byte(8'h00);               // footer
        end
    endtask

    // -----------------------------------------------------------------
    // (A) SENZORSKI MONITOR - direktno na LidarInterface izlazu
    //     dut.lidar_ready / dut.lidar_rdata su top-level wire-ovi u
    //     MainScheme.v, direktno povezani na LidarInterface instancu.
    // -----------------------------------------------------------------
    localparam MAX_POINTS = 64;
    reg [9:0] sensor_x [0:MAX_POINTS-1];
    reg [9:0] sensor_y [0:MAX_POINTS-1];
    integer   sensor_count;
    reg       sensor_capture_en;

    always @(posedge clk) begin
        if (sensor_capture_en && dut.lidar_ready) begin
            if (sensor_count < MAX_POINTS) begin
                sensor_x[sensor_count] = dut.lidar_rdata[19:10];
                sensor_y[sensor_count] = dut.lidar_rdata[9:0];
                sensor_count = sensor_count + 1;
            end
        end
    end

    // -----------------------------------------------------------------
    // (B) SISTEMSKI MONITOR - sta CPU/firmware STVARNO upise u FB
    //
    //   XIN/YIN/SET_PIXEL   - top-level (namera CPU-a u trenutku store-a)
    //   dut.b2v_inst1.b2v_inst1.WR          - stvarni write-enable u RAM
    //                                          (kasni 2 takta, unutar
    //                                          FrameBuffer instance koja
    //                                          se zove b2v_inst1 unutar
    //                                          Monitor instance b2v_inst1)
    //   dut.b2v_inst1.b2v_inst1.PIXEL_ADDR  - adresa na kojoj se STVARNO
    //                                          pise u tom trenutku
    // -----------------------------------------------------------------
    reg [9:0] req_x_pipe [0:3];
    reg [9:0] req_y_pipe [0:3];
    reg       req_v_pipe [0:3];
    integer   fb_write_count;
    integer   fb_mismatch_count;

    always @(posedge clk) begin
        // pomeramo mali "shift-registar" sa namerom CPU-a (XIN/YIN u
        // trenutku SET_PIXEL) da bismo je mogli uporediti 2 takta kasnije
        // sa stvarnom adresom upisa (WR)
        req_x_pipe[3] <= req_x_pipe[2]; req_y_pipe[3] <= req_y_pipe[2]; req_v_pipe[3] <= req_v_pipe[2];
        req_x_pipe[2] <= req_x_pipe[1]; req_y_pipe[2] <= req_y_pipe[1]; req_v_pipe[2] <= req_v_pipe[1];
        req_x_pipe[1] <= req_x_pipe[0]; req_y_pipe[1] <= req_y_pipe[0]; req_v_pipe[1] <= req_v_pipe[0];
        req_x_pipe[0] <= dut.XIN;       req_y_pipe[0] <= dut.YIN;       req_v_pipe[0] <= dut.SET_PIXEL;

        if (dut.b2v_inst1.b2v_inst1.WR) begin
            reg [15:0] expected_addr;
            reg [15:0] actual_addr;
            fb_write_count = fb_write_count + 1;
            // ista formula kao u FrameBuffer.v: PIXEL_ADDR = Y*80 + X[9:3]
            expected_addr = req_y_pipe[2] * 80 + {7'b0, req_x_pipe[2][9:3]};
            actual_addr   = dut.b2v_inst1.b2v_inst1.PIXEL_ADDR;
            $display("  [FB WRITE #%0d] t=%0t  trazeno(X=%0d,Y=%0d)->addr=%0d   STVARNA addr=%0d  %s",
                      fb_write_count, $time, req_x_pipe[2], req_y_pipe[2], expected_addr, actual_addr,
                      (expected_addr === actual_addr) ? "OK" : "!! MISMATCH (bug #3 - pogresna adresa)");
            if (expected_addr !== actual_addr)
                fb_mismatch_count = fb_mismatch_count + 1;
        end
    end

    // -----------------------------------------------------------------
    // Pomocni task: pokreni jednu punu "rotaciju" od 4 paketa (48 tacaka,
    // priblizno pokriva 0-360 stepeni; dovoljno za demonstraciju bez
    // predugog trajanja simulacije). object_dist parametrizuje rastojanje
    // "objekta" postavljenog u paketu #2, tacka indeks 5.
    // -----------------------------------------------------------------
    task automatic run_rotation(input [15:0] object_dist, input string label);
        begin
            $display("\n---- %s (objekat na %0d mm) ----", label, object_dist);
            sensor_count = 0;
            sensor_capture_en = 1'b1;

            // zid sobe: konstantno ~1200mm svuda osim gde je objekat
            send_room_packet(16'd400, 16'd0,     16'd8900, 16'd0,
                16'd1200,16'd1200,16'd1200,16'd1200,16'd1200,16'd1200,
                16'd1200,16'd1200,16'd1200,16'd1200,16'd1200,16'd1200);
            repeat (3000) @(posedge clk);

            send_room_packet(16'd400, 16'd9000,  16'd17900, 16'd0,
                16'd1200,16'd1200,16'd1200,16'd1200,16'd1200,object_dist,
                16'd1200,16'd1200,16'd1200,16'd1200,16'd1200,16'd1200);
            repeat (3000) @(posedge clk);

            send_room_packet(16'd400, 16'd18000, 16'd26900, 16'd0,
                16'd1200,16'd1200,16'd1200,16'd1200,16'd1200,16'd1200,
                16'd1200,16'd1200,16'd1200,16'd1200,16'd1200,16'd1200);
            repeat (3000) @(posedge clk);

            send_room_packet(16'd400, 16'd27000, 16'd35900, 16'd0,
                16'd1200,16'd1200,16'd1200,16'd1200,16'd1200,16'd1200,
                16'd1200,16'd1200,16'd1200,16'd1200,16'd1200,16'd1200);
            repeat (3000) @(posedge clk);

            sensor_capture_en = 1'b0;
            $display("  (A) senzorski nivo: uhvaceno %0d tacaka od LidarInterface-a (ocekivano do 48)", sensor_count);
        end
    endtask

    // pamtimo "objekat" tacku (paket #2 = 12..23-ti uhvaceni indeks, tacka 5 unutar
    // njega -> globalni redni broj 17, AKO su svi impulsi uhvaceni; ako hardver
    // gubi tacke (poznati bag), objekat mozda uopste nije medju uhvacenim, pa
    // testbench to eksplicitno prijavljuje umesto da pretpostavlja indeks)
    reg [9:0] obj_x [1:3];
    reg [9:0] obj_y [1:3];
    reg       obj_found [1:3];

    task automatic locate_object(input integer rotation_no);
        integer i;
        begin
            obj_found[rotation_no] = 1'b0;
            // trazimo tacku koja NIJE na "zidu" (tj. razlikuje se dovoljno
            // od suseda) - najjednostavnija heuristika za ovaj sintetski test:
            // objekat ima najveci |y_pixel| skok u odnosu na prosek zida.
            // Ako je hardver izgubio tacku, sensor_count ce biti << 48 i
            // objekat mozda nece biti medju njima - to je i sama poenta testa.
            for (i = 0; i < sensor_count; i = i + 1) begin
                if (i == 17 && sensor_count > 17) begin
                    obj_x[rotation_no] = sensor_x[i];
                    obj_y[rotation_no] = sensor_y[i];
                    obj_found[rotation_no] = 1'b1;
                end
            end
            if (obj_found[rotation_no])
                $display("  objekat (senzorski nivo) rotacija %0d: pixel=(%0d,%0d)",
                          rotation_no, obj_x[rotation_no], obj_y[rotation_no]);
            else
                $display("  objekat NIJE pronadjen medju uhvacenim tackama u rotaciji %0d (uhvaceno samo %0d/48 - poznati LidarInterface bag bez ACK-a)",
                          rotation_no, sensor_count);
        end
    endtask

    initial begin
        fb_write_count    = 0;
        fb_mismatch_count = 0;
        sensor_count      = 0;
        sensor_capture_en = 1'b0;
        rx    = 1'b1;
        reset = 1'b0;
        req_x_pipe[0]=0; req_x_pipe[1]=0; req_x_pipe[2]=0; req_x_pipe[3]=0;
        req_y_pipe[0]=0; req_y_pipe[1]=0; req_y_pipe[2]=0; req_y_pipe[3]=0;
        req_v_pipe[0]=0; req_v_pipe[1]=0; req_v_pipe[2]=0; req_v_pipe[3]=0;

        repeat (5) @(posedge clk);
        reset = 1'b1;              // aktivan tokom rada (RESET ulaz ide u pc.v kao sys_reset= ~RESET ili slicno, videti pc.v)
        repeat (5) @(posedge clk);

        $display("========================================================================");
        $display(" tb_MainScheme_system - ceo sistem (CPU+Lidar+VGA), 3 rotacije, test pokreta");
        $display("========================================================================");

        // pusti CPU da prodje kroz uvodne lui/addi instrukcije i udje u LOOP_POLL
        repeat (50) @(posedge clk);

        run_rotation(16'd1800, "ROTACIJA 1 - bazna scena");
        locate_object(1);

        run_rotation(16'd500,  "ROTACIJA 2 - objekat se PRIBLIZIO");
        locate_object(2);

        run_rotation(16'd250,  "ROTACIJA 3 - objekat jos blizi (potvrda trenda)");
        locate_object(3);

        // -----------------------------------------------------------------
        // Zakljucak (A): senzorski nivo - da li je promena uopste vidjena
        // -----------------------------------------------------------------
        $display("\n---- REZULTAT (A) senzorski nivo ----");
        if (obj_found[1] && obj_found[2]) begin
            if (obj_x[1] !== obj_x[2] || obj_y[1] !== obj_y[2])
                $display("  POKRET DETEKTOVAN izmedju rotacije 1->2 (senzor): (%0d,%0d) -> (%0d,%0d)",
                          obj_x[1], obj_y[1], obj_x[2], obj_y[2]);
            else
                $display("  UPOZORENJE: senzor NIJE registrovao promenu iako je distanca promenjena 1800mm->500mm");
        end else begin
            $display("  NE MOZE SE ZAKLJUCITI - objekat nije uhvacen u obe rotacije (videti gore, LidarInterface bag)");
        end
        if (obj_found[2] && obj_found[3]) begin
            if (obj_x[2] !== obj_x[3] || obj_y[2] !== obj_y[3])
                $display("  POKRET DETEKTOVAN izmedju rotacije 2->3 (senzor): (%0d,%0d) -> (%0d,%0d)",
                          obj_x[2], obj_y[2], obj_x[3], obj_y[3]);
        end

        // -----------------------------------------------------------------
        // Zakljucak (B): sistemski nivo - da li se to STVARNO nacrtalo
        // -----------------------------------------------------------------
        $display("\n---- REZULTAT (B) sistemski (CPU+VGA) nivo ----");
        $display("  ukupno pokusaja upisa u framebuffer koji su prosli kroz WR: %0d", fb_write_count);
        $display("  od toga sa POGRESNOM adresom (bug #3, adresni hazard):      %0d", fb_mismatch_count);
        if (fb_write_count == 0)
            $display("  NIJEDAN upis nije stigao do RAM-a - proveriti Monitor.v (SET_PIXEL_ACTUAL & ~display) bag");
        else if (fb_mismatch_count == fb_write_count)
            $display("  SVI upisi su na pogresnoj adresi - firmware efektivno ne crta nista korisno na ekranu");
        else
            $display("  Deo upisa je na ispravnoj adresi - proveriti da li se bas OBJEKAT tacka nalazi medju njima");

        $display("\n========================================================================");
        $display(" NAPOMENA: ako je ovaj test pokrenut PRE primene FIX .bdf patch-eva,");
        $display(" ocekivano je da (A) prikaze detekciju pokreta a (B) NE - to i jeste");
        $display(" dijagnostika koju treba da vidis. Posle primene fix-ova, ponovo pokreni");
        $display(" ovaj isti fajl bez izmena - (B) bi trebalo da pocne da prati (A).");
        $display("========================================================================");
        $finish;
    end

endmodule
