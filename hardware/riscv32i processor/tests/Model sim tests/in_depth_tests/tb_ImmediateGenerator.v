`timescale 1ns/1ps

module tb_ImmediateGenerator();
    reg  [2:0]  IMM_SRC;
    reg  [31:0] INSTRUCTION;
    wire [31:0] IMM_OUT;

    reg test_passed;

    ImmediateGenerator uut (
        .IMM_SRC(IMM_SRC), .INSTRUCTION(INSTRUCTION), .IMM_OUT(IMM_OUT)
    );

    initial begin
        test_passed = 1'b1;

        // I-type (IMM_SRC = 100 ili 4) - npr addi x1, x0, -1
        INSTRUCTION = 32'hFFF00093; IMM_SRC = 3'd4; #10;
        if (IMM_OUT !== 32'hFFFFFFFF) begin $display("FAIL: I-Type Imm"); test_passed = 0; end

        // U-type (IMM_SRC = 001 ili 1) - npr lui x1, 0x12345
        INSTRUCTION = 32'h123450B7; IMM_SRC = 3'd1; #10;
        if (IMM_OUT !== 32'h12345000) begin $display("FAIL: U-Type Imm"); test_passed = 0; end

        if (test_passed)
            $display("=== IMMEDIATEGENERATOR TEST PASSED ===");
        else
            $display("=== IMMEDIATEGENERATOR TEST FAILED ===");

        $finish;
    end
endmodule