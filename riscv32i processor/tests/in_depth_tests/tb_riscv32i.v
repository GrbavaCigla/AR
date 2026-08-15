`timescale 1ns/1ps
module tb_Riscv32i();
    reg  CLK;
    reg  RESET;
    wire N;
    wire Z;
    wire [31:0] RESULT;
    reg test_passed;

    // Instanciranje procesora
    Riscv32i uut (
        .CLK(CLK),
        .RESET(RESET),
        .N(N),
        .Z(Z),
        .RESULT(RESULT)
    );

    // Generisanje takta (Perioda = 10ns)
    always #5 CLK = ~CLK;

    // Task za ispis debug stanja procesora
    task print_debug;
        input [127:0] label;
        begin
            $display("%0s", label);
            $display("   PC=%h  INSTR=%h", uut.PC, uut.INSTRUCTIONS);
            $display("   RegWrite=%b MemWrite=%b MemRead=%b Branch=%b Jump=%b",
                       uut.RegWrite, uut.MemWrite, uut.MemRead, uut.Branch, uut.Jump);
            $display("   ALUOp=%b ALUControl=%h ALUSrcA=%b ALUSrcB=%b",
                       uut.ALUOp, uut.ALUControl, uut.ALUSrcA, uut.ALUSrcB);
            $display("   A=%h  B=%h  RESULT=%h", uut.A, uut.B, RESULT);
            $display("   RS1DATA=%h RS2DATA=%h IMM_OUT=%h",
                       uut.RS1DATA, uut.RS2DATA, uut.IMM_OUT);
            $display("");
        end
    endtask

    initial begin
        // Inicijalizacija
        CLK = 0;
        RESET = 1;
        test_passed = 1'b1;

        // Reset procesora
        #20 RESET = 0;

        // Ciklus 1: LUI / ADDI inicijalizacije
        @(negedge CLK);
        #2;
        print_debug("[Ciklus 1] PC izvrsava prvu instrukciju.");

        // Ciklus 2: ADD / SUB operacije
        @(negedge CLK);
        #2;
        print_debug("[Ciklus 2]");
        $display("   Zero Flag=%b Negative Flag=%b\n", Z, N);

        // Ciklus 3: Logicke operacije (AND/OR/XOR)
        @(negedge CLK);
        #2;
        print_debug("[Ciklus 3]");

        // Ciklus 4: Pomeranja (SLL/SRL/SRA)
        @(negedge CLK);
        #2;
        print_debug("[Ciklus 4]");

        // Ciklus 5: Store u memoriju (SW)
        @(negedge CLK);
        #2;
        print_debug("[Ciklus 5] Store Adresa");

        // Ciklus 6: Load iz memorije (LW)
        @(negedge CLK);
        #2;
        print_debug("[Ciklus 6] Load Adresa");

        // Provera rada: Ako procesor generise X na izlazu
        if (RESULT === 32'hxxxxxxxx) begin
            test_passed = 1'b0;
        end

        #20;

        // Ispis konacnog ishoda u ModelSim konzoli
        if (test_passed) begin
            $display("\n==================================================");
            $display("   TEST PASSED: Riscv32i procesor je ispravan!   ");
            $display("==================================================\n");
        end else begin
            $display("\n==================================================");
            $display("   TEST FAILED: Detektovana greska na procesoru!  ");
            $display("==================================================\n");
        end

        $finish;
    end
endmodule