`timescale 1ns/1ps

module tb_ALUDecoder();
    reg  [1:0] ALUOp;
    reg  [2:0] funct3;
    reg  [5:5] funct7;
    wire [3:0] ALUControl;

    reg test_passed;

    ALUDecoder uut (
        .ALUOp(ALUOp), .funct3(funct3), .funct7(funct7), .ALUControl(ALUControl)
    );

    initial begin
        test_passed = 1'b1;

        // ADD (R-type) -> ALUOp=01, funct3=000, funct7=0
        ALUOp = 2'b01; funct3 = 3'b000; funct7 = 1'b0; #10;
        if (ALUControl !== 4'b0000) begin $display("FAIL: ALUDec ADD"); test_passed = 0; end

        // SUB (R-type) -> ALUOp=01, funct3=000, funct7=1
        ALUOp = 2'b01; funct3 = 3'b000; funct7 = 1'b1; #10;
        if (ALUControl !== 4'b0001) begin $display("FAIL: ALUDec SUB"); test_passed = 0; end

        // SRL -> ALUOp=01, funct3=101, funct7=0
        ALUOp = 2'b01; funct3 = 3'b101; funct7 = 1'b0; #10;
        if (ALUControl !== 4'b0110) begin $display("FAIL: ALUDec SRL"); test_passed = 0; end

        if (test_passed)
            $display("=== ALUDECODER TEST PASSED ===");
        else
            $display("=== ALUDECODER TEST FAILED ===");

        $finish;
    end
endmodule