`timescale 1ns/1ps

module tb_ControlWord();
    reg  [6:0] opcode;
    wire RegWrite, MemWrite, MemRead, Branch, Jump, ALUSrcB, ALUSrcA;
    wire [1:0] ALUOp, MemToReg;
    wire [2:0] immSrc;

    reg test_passed;

    ControlWord uut (
        .opcode(opcode), .RegWrite(RegWrite), .MemWrite(MemWrite),
        .MemRead(MemRead), .Branch(Branch), .Jump(Jump),
        .ALUSrcB(ALUSrcB), .ALUSrcA(ALUSrcA), .ALUOp(ALUOp),
        .immSrc(immSrc), .MemToReg(MemToReg)
    );

    initial begin
        test_passed = 1'b1;

        // R-Type (0110011)
        opcode = 7'b0110011; #10;
        if (!RegWrite || MemWrite || ALUSrcB) begin $display("FAIL: R-Type Control"); test_passed = 0; end

        // I-Type (0010011)
        opcode = 7'b0010011; #10;
        if (!RegWrite || !ALUSrcB) begin $display("FAIL: I-Type Control"); test_passed = 0; end

        // LW (0000011)
        opcode = 7'b0000011; #10;
        if (!RegWrite || !MemRead || MemToReg !== 2'b01) begin $display("FAIL: LW Control"); test_passed = 0; end

        // SW (0010011)
        opcode = 7'b0100011; #10;
        if (!MemWrite || RegWrite) begin $display("FAIL: SW Control"); test_passed = 0; end

        if (test_passed)
            $display("=== CONTROLWORD TEST PASSED ===");
        else
            $display("=== CONTROLWORD TEST FAILED ===");

        $finish;
    end
endmodule