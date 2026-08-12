`timescale 1ns/1ps

module tb_REGFILE();
    reg        CLK, RESET, REGWRITE;
    reg  [4:0] RD, RS1, RS2;
    reg  [31:0] WRITEDATA;
    wire [31:0] RS1DATA, RS2DATA;

    reg test_passed;

    REGFILE uut (
        .CLK(CLK), .RESET(RESET), .REGWRITE(REGWRITE),
        .RD(RD), .RS1(RS1), .RS2(RS2),
        .WRITEDATA(WRITEDATA), .RS1DATA(RS1DATA), .RS2DATA(RS2DATA)
    );

    always #5 CLK = ~CLK;

    initial begin
        CLK = 0; RESET = 1; REGWRITE = 0; RD = 0; RS1 = 0; RS2 = 0; WRITEDATA = 0;
        test_passed = 1'b1;
        #15 RESET = 0;

        // Upis u X1
        @(negedge CLK); REGWRITE = 1; RD = 5'd1; WRITEDATA = 32'hDEADBEEF;
        @(negedge CLK); REGWRITE = 0; RS1 = 5'd1;
        #2; if (RS1DATA !== 32'hDEADBEEF) begin $display("FAIL: Upis/Citanje X1"); test_passed = 0; end

        // Pokusaj upisa u X0 (mora ostati 0)
        @(negedge CLK); REGWRITE = 1; RD = 5'd0; WRITEDATA = 32'hCAFEBABE;
        @(negedge CLK); REGWRITE = 0; RS1 = 5'd0;
        #2; if (RS1DATA !== 32'h00000000) begin $display("FAIL: X0 nije ostao 0!"); test_passed = 0; end

        // Paralelno citanje X1 i X2
        @(negedge CLK); REGWRITE = 1; RD = 5'd2; WRITEDATA = 32'h12345678;
        @(negedge CLK); REGWRITE = 0; RS1 = 5'd1; RS2 = 5'd2;
        #2; if (RS1DATA !== 32'hDEADBEEF || RS2DATA !== 32'h12345678) begin $display("FAIL: Paralelno citanje"); test_passed = 0; end

        if (test_passed)
            $display("=== REGFILE TEST PASSED ===");
        else
            $display("=== REGFILE TEST FAILED ===");

        $finish;
    end
endmodule