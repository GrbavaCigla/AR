// =====================================================================
// tb_LidarInterface.sv
//
// End-to-end testbench za CEO lidar interfejs, ne samo CalculateXY:
//   rx (serijska UART linija) -> UART_RX -> PacketParser
//        -> AngleGenerator (interpolacija 12 uglova)
//        -> CalculateXY (x12, preko MPX12 po point_index)
//        -> lidar_ready / lidar_data
//
// Timing UART bit-banger-a je izveden direktno iz UART_RX.v:
//   - BAUD_GENERATOR + CMP4(protiv 13)  -> baud_tick na svakih 14 clk
//   - bit_pos ide 0..159 (16 tick-ova po bitu, uzorkovanje na sredini)
//   => 1 UART bit = 16 * 14 = 224 clk ciklusa
//
// Format paketa je rekonstruisan iz byte_pos markera u PacketParser.v
// (razmak izmedju "*_end" signala):
//   header(1)=84, verlen(1)=44, speed(2), start_angle(2),
//   [point_dist(2), point_int(1)] x 12, end_angle(2), timestamp(2),
//   footer(1, sadrzaj se ne proverava) = 47 bajtova ukupno.
//
// NAPOMENA (bitno, procitaj pre pokretanja):
//   U PacketParser.v je "prev_byte" deklarisan kao [15:0], ali je
//   POGONJEN (driven) samo prev_byte[7:0] (REG8_LD_CL @ ~liniji 200,
//   I(rx_data)). prev_byte[15:8] nema NIJEDAN drajver u celom fajlu
//   (proverio sam grep-om). Svako 16-bitno polje (speed, start_angle,
//   end_angle, timestamp, point*_dist) latch-uje gornji bajt bas iz
//   prev_byte[15:8] -> u simulaciji ce ti gornji bajt svih tih polja
//   biti 'x' (nepoznato), sto se dalje provlaci kroz AngleGenerator i
//   CalculateXY. Ovaj testbench to eksplicitno detektuje i prijavljuje
//   (ne pada tiho, ispisuje upozorenje po tacki), umesto da samo
//   uporedjuje sa "ocekivanim" pikselima kao sto to radi tb_CalculateXY.
//   Ovo je odvojen bag od saturacije u CalculateXY.v o kojoj smo pricali.
// =====================================================================

`timescale 1ns/1ps

module tb_LidarInterface;

    localparam CLK_PERIOD      = 10;                // ns (isto kao tb_CalculateXY)
    localparam TICKS_PER_BAUD  = 14;                // BAUD_GENERATOR: tick na q==13
    localparam SAMPLES_PER_BIT = 16;                // bit_pos korak izmedju d0,d1,...
    localparam CLKS_PER_BIT    = TICKS_PER_BAUD * SAMPLES_PER_BIT; // = 224

    reg         clk;
    reg         rst_n;
    reg         rx;
    wire        lidar_ready;
    wire [31:0] lidar_data;

    integer point_count;
    integer x_warn_count;
    integer errors;

    LidarInterface dut (
        .clk         (clk),
        .rst_n       (rst_n),
        .rx          (rx),
        .lidar_ready (lidar_ready),
        .lidar_data  (lidar_data)
    );

    initial clk = 1'b0;
    always #(CLK_PERIOD/2) clk = ~clk;

    // -----------------------------------------------------------------
    // UART bit-banger: 1 start bit (0) + 8 podatkovnih bita (LSB prvo)
    // + 1 stop bit (1), tacno 224 clk po bitu
    // -----------------------------------------------------------------
    task automatic send_byte(input [7:0] b);
        integer i;
        begin
            rx = 1'b0;                                  // start bit
            repeat (CLKS_PER_BIT) @(posedge clk);
            for (i = 0; i < 8; i = i + 1) begin
                rx = b[i];
                repeat (CLKS_PER_BIT) @(posedge clk);
            end
            rx = 1'b1;                                   // stop bit
            repeat (CLKS_PER_BIT) @(posedge clk);
        end
    endtask

    task automatic send_u16(input [15:0] v);
        begin
            send_byte(v[15:8]);
            send_byte(v[7:0]);
        end
    endtask

    // -----------------------------------------------------------------
    // Slaganje i slanje kompletnog paketa (47 bajtova)
    // -----------------------------------------------------------------
    task automatic send_packet(
            input [15:0] speed_v,
            input [15:0] start_angle_v,
            input [15:0] end_angle_v,
            input [15:0] timestamp_v,
            input        bad_header,
            input        bad_verlen
        );
        integer i;
        reg [15:0] p_dist [0:11];
        reg [7:0]  inten[0:11];
        begin
            for (i = 0; i < 12; i = i + 1) begin
                p_dist[i] = 400 + i * 150;   // proizvoljne validne distance (<= 2300mm)
                inten[i] = 100 + i;
            end

            send_byte(bad_header ? 8'd200 : 8'd84);   // header
            send_byte(bad_verlen ? 8'd0   : 8'd44);   // verlen
            send_u16(speed_v);
            send_u16(start_angle_v);
            for (i = 0; i < 12; i = i + 1) begin
                send_u16(p_dist[i]);
                send_byte(inten[i]);
            end
            send_u16(end_angle_v);
            send_u16(timestamp_v);
            send_byte(8'h00);                       // footer/checksum, sadrzaj se ne proverava
        end
    endtask

    // -----------------------------------------------------------------
    // Monitor: lidar_ready se drzi visoko onoliko ciklusa koliko busy
    // traje (pixel_valid = kasnjeni busy), pa se x_pixel/y_pixel u tom
    // prozoru menjaju svakog takta prateci point_index -> zato brojimo
    // NA SVAKOM taktu dok je lidar_ready==1, ne samo na ivici.
    // -----------------------------------------------------------------
    always @(posedge clk) begin
        if (lidar_ready) begin
            point_count = point_count + 1;
            if (^lidar_data === 1'bx) begin
                x_warn_count = x_warn_count + 1;
                $display("  [UPOZORENJE] lidar_data ima X bitove (%b) -> tacka #%0d nepouzdana (verovatno prev_byte[15:8] bag)",
                         lidar_data, point_count);
            end else begin
                $display("  tacka #%0d  lidar_data=0x%08h  x_pixel=%0d  y_pixel=%0d",
                         point_count, lidar_data, lidar_data[19:10], lidar_data[9:0]);
            end
        end
    end

    task automatic run_and_check(input integer expected_points, input string label);
        begin
            @(negedge clk);
            point_count   = 0;
            x_warn_count  = 0;
        end
    endtask

    initial begin
        errors      = 0;
        point_count = 0;
        x_warn_count = 0;
        rx    = 1'b1;     // idle linija (mark)
        rst_n = 1'b0;
        repeat (5) @(posedge clk);
        rst_n = 1'b1;
        repeat (5) @(posedge clk);

        $display("========================================================================");
        $display(" tb_LidarInterface - end-to-end test (UART -> parser -> anglegen -> XY)");
        $display("========================================================================");

        // ---- Test 1: validan paket, ocekuje se 12 tacaka ----
        $display("\n-- Test 1: validan paket (header=84, verlen=44) --");
        @(negedge clk); point_count = 0; x_warn_count = 0;
        send_packet(16'd500, 16'd0, 16'd9900, 16'd1234, 1'b0, 1'b0);
        repeat (3000) @(posedge clk);
        if (point_count == 12)
            $display("  OK: 12 lidar_ready ciklusa dobijeno");
        else begin
            $display("  GRESKA: ocekivano 12, dobijeno %0d", point_count);
            errors = errors + 1;
        end
        if (x_warn_count > 0)
            $display("  INFO: %0d/%0d tacaka je imalo X bitove (videti napomenu na vrhu fajla o prev_byte[15:8])", x_warn_count, point_count);

        // ---- Test 2: pogresan header - paket se NE SME parsirati ----
        $display("\n-- Test 2: pogresan header bajt (200 umesto 84) --");
        @(negedge clk); point_count = 0; x_warn_count = 0;
        send_packet(16'd500, 16'd0, 16'd9900, 16'd1234, 1'b1, 1'b0);
        repeat (3000) @(posedge clk);
        if (point_count == 0)
            $display("  OK: paket bez validnog headera je ignorisan");
        else begin
            $display("  GRESKA: parser je ipak proizveo %0d tacaka bez validnog headera!", point_count);
            errors = errors + 1;
        end

        // ---- Test 3: pogresan verlen - paket mora biti odbacen ----
        $display("\n-- Test 3: pogresan verlen bajt (0 umesto 44) --");
        @(negedge clk); point_count = 0; x_warn_count = 0;
        send_packet(16'd500, 16'd0, 16'd9900, 16'd1234, 1'b0, 1'b1);
        repeat (3000) @(posedge clk);
        if (point_count == 0)
            $display("  OK: paket sa pogresnim verlen bajtom je odbacen");
        else begin
            $display("  GRESKA: parser je ipak proizveo %0d tacaka sa pogresnim verlen bajtom!", point_count);
            errors = errors + 1;
        end

        // ---- Test 4: dva uzastopna validna paketa (oporavak/ack) ----
        $display("\n-- Test 4: dva uzastopna validna paketa --");
        @(negedge clk); point_count = 0; x_warn_count = 0;
        send_packet(16'd300, 16'd18000, 16'd27000, 16'd1, 1'b0, 1'b0);
        repeat (3000) @(posedge clk);
        if (point_count != 12) begin
            $display("  GRESKA: prvi paket u Testu 4 nije dao 12 tacaka (dobijeno %0d)", point_count);
            errors = errors + 1;
        end
        @(negedge clk); point_count = 0; x_warn_count = 0;
        send_packet(16'd300, 16'd27000, 16'd35900, 16'd2, 1'b0, 1'b0);
        repeat (3000) @(posedge clk);
        if (point_count == 12)
            $display("  OK: drugi paket odmah posle prvog takodje daje 12 tacaka (ack/busy se ispravno resetuju)");
        else begin
            $display("  GRESKA: drugi uzastopni paket nije dao 12 tacaka (dobijeno %0d)", point_count);
            errors = errors + 1;
        end

        $display("\n========================================================================");
        $display(" Rezultat: %0d greske", errors);
        $display("========================================================================");
        $finish;
    end

endmodule