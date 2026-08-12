`timescale 1ns/1ps

module tb_ALU();
    reg  [31:0] A, B;
    reg  [3:0]  ALUControl;
    wire        Z, N;
    wire [31:0] RESULT;

    reg test_passed;

    ALU uut (
        .A(A),
        .ALUControl(ALUControl),
        .B(B),
        .Z(Z),
        .N(N),
        .RESULT(RESULT)
    );

    initial begin
        test_passed = 1'b1;
        
        // 1. ADD (0000)
        A = 32'd15; B = 32'd10; ALUControl = 4'b0000; #10;
        if (RESULT !== 32'd25 || Z !== 0) begin $display("FAIL: ADD"); test_passed = 0; end

        // 2. SUB (0001)
        A = 32'd15; B = 32'd10; ALUControl = 4'b0001; #10;
        if (RESULT !== 32'd5 || Z !== 0) begin $display("FAIL: SUB"); test_passed = 0; end

        // 3. AND (0010)
        A = 32'hFF00FF00; B = 32'hF0F0F0F0; ALUControl = 4'b0010; #10;
        if (RESULT !== 32'hF000F000) begin $display("FAIL: AND"); test_passed = 0; end

        // 4. OR (0011)
        A = 32'hFF00FF00; B = 32'hF0F0F0F0; ALUControl = 4'b0011; #10;
        if (RESULT !== 32'hFFF0FF00) begin $display("FAIL: OR"); test_passed = 0; end

        // 5. XOR (0100)
        A = 32'hA5A5A5A5; B = 32'hFFFFFFFF; ALUControl = 4'b0100; #10;
        if (RESULT !== 32'h5A5A5A5A) begin $display("FAIL: XOR"); test_passed = 0; end

        // 6. SLL (0101)
        A = 32'h00000001; B = 32'd4; ALUControl = 4'b0101; #10;
        if (RESULT !== 32'h00000010) begin $display("FAIL: SLL"); test_passed = 0; end

        // 7. SRL (0110)
        A = 32'h80000000; B = 32'd4; ALUControl = 4'b0110; #10;
        if (RESULT !== 32'h08000000) begin $display("FAIL: SRL"); test_passed = 0; end

        // 8. SRA (0111)
        A = 32'h80000000; B = 32'd4; ALUControl = 4'b0111; #10;
        if (RESULT !== 32'hF8000000) begin $display("FAIL: SRA"); test_passed = 0; end

        // 9. SLT (1000)
        A = -32'd10; B = 32'd5; ALUControl = 4'b1000; #10;
        if (RESULT !== 32'd1) begin $display("FAIL: SLT"); test_passed = 0; end

        // 10. SLTU (1001)
        A = 32'd5; B = 32'd10; ALUControl = 4'b1001; #10;
        if (RESULT !== 32'd1) begin $display("FAIL: SLTU"); test_passed = 0; end

        // Prikaz konačnog rezultata
        if (test_passed)
            $display("=== ALU TEST PASSED ===");
        else
            $display("=== ALU TEST FAILED ===");
            
        $finish;
    end
endmodule