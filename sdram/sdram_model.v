`timescale 1ns/1ps
// =====================================================================
// Behavioral SDR SDRAM model - pin-level (JEDEC standard command truth
// table), parametrizovan za organizaciju ISSI IS42S16320D (BA[1:0] +
// ROW[12:0] + COL[9:0] = 25-bit interna adresa, 16-bit DQ).
//
// Ovo NIJE vlasnicki ISSI model - implementira samo javni, standardni
// SDR SDRAM komandni protokol (CS#/RAS#/CAS#/WE#), dovoljno za
// funkcionalnu verifikaciju CPU<->SDRAM magistrale.
//
// Podrazumevano: CAS Latency = 3, Burst Length = 1 (bez burst-a),
// sto odgovara Mode Register vrednosti (0x030) koju sdram_controller
// upisuje pri inicijalizaciji.
// =====================================================================

module sdram_model #(
    parameter CAS_LATENCY = 3,
    parameter VERBOSE     = 0     // 1 = ispisuje svaku primljenu komandu
)(
    input  wire        sdram_clk,
    input  wire        sdram_cke,
    input  wire        sdram_cs_n,
    input  wire        sdram_ras_n,
    input  wire        sdram_cas_n,
    input  wire        sdram_we_n,
    input  wire        sdram_dqml,
    input  wire        sdram_dqmh,
    input  wire [12:0] sdram_addr,
    input  wire [1:0]  sdram_ba,
    inout  wire [15:0] sdram_dq
);

    // -----------------------------------------------------------------
    // Memorija: 4 banke x 8192 redova x 1024 kolona x 16 bita = 512Mbit
    // -----------------------------------------------------------------
    reg [15:0] mem [0:(1<<25)-1];

    // Otvoreni red po banci (upisuje se na ACTIVE komandu)
    reg [12:0] open_row [0:3];

    // -----------------------------------------------------------------
    // Dekodiranje komande - standardni SDR SDRAM CS#/RAS#/CAS#/WE# kod
    // -----------------------------------------------------------------
    wire selected   = ~sdram_cs_n;
    wire cmd_active = selected & ~sdram_ras_n &  sdram_cas_n &  sdram_we_n;
    wire cmd_read   = selected &  sdram_ras_n & ~sdram_cas_n &  sdram_we_n;
    wire cmd_write  = selected &  sdram_ras_n & ~sdram_cas_n & ~sdram_we_n;
    wire cmd_pre    = selected & ~sdram_ras_n &  sdram_cas_n & ~sdram_we_n;
    wire cmd_ref    = selected & ~sdram_ras_n & ~sdram_cas_n &  sdram_we_n;
    wire cmd_mrs    = selected & ~sdram_ras_n & ~sdram_cas_n & ~sdram_we_n;

    wire [24:0] col_addr = {sdram_ba, open_row[sdram_ba], sdram_addr[9:0]};

    // -----------------------------------------------------------------
    // WRITE - podaci se hvataju u istom taktu kad i WRITE komanda
    // (SDR write latency = 0), sa DQM byte-mask kontrolom.
    // -----------------------------------------------------------------
    always @(posedge sdram_clk) begin
        if (cmd_active) begin
            open_row[sdram_ba] <= sdram_addr;
            if (VERBOSE) $display("[SDRAM %0t] ACTIVE  ba=%0d row=%0h", $time, sdram_ba, sdram_addr);
        end
        else if (cmd_write) begin
            if (!sdram_dqml) mem[col_addr][7:0]  <= sdram_dq[7:0];
            if (!sdram_dqmh) mem[col_addr][15:8] <= sdram_dq[15:8];
            if (VERBOSE) $display("[SDRAM %0t] WRITE   addr=%0h data=%h", $time, col_addr, sdram_dq);
        end
        else if (cmd_read) begin
            if (VERBOSE) $display("[SDRAM %0t] READ    addr=%0h -> %h", $time, col_addr, mem[col_addr]);
        end
        else if (cmd_pre && VERBOSE) $display("[SDRAM %0t] PRECHARGE", $time);
        else if (cmd_ref && VERBOSE) $display("[SDRAM %0t] AUTO REFRESH", $time);
        else if (cmd_mrs && VERBOSE) $display("[SDRAM %0t] LOAD MODE REGISTER = %h", $time, {sdram_ba, sdram_addr});
    end

    // -----------------------------------------------------------------
    // READ pipeline - CAS_LATENCY taktova kasnjenja pre nego sto se
    // podatak pojavi na DQ busu (burst length = 1: drzi se 1 takt).
    // -----------------------------------------------------------------
    reg [15:0] pipe_data  [0:CAS_LATENCY-1];
    reg        pipe_valid [0:CAS_LATENCY-1];
    integer k;

    always @(posedge sdram_clk) begin
        for (k = CAS_LATENCY-1; k > 0; k = k - 1) begin
            pipe_data[k]  <= pipe_data[k-1];
            pipe_valid[k] <= pipe_valid[k-1];
        end
        pipe_data[0]  <= mem[col_addr];
        pipe_valid[0] <= cmd_read;
    end

    assign sdram_dq = pipe_valid[CAS_LATENCY-1] ? pipe_data[CAS_LATENCY-1] : 16'bz;

endmodule
