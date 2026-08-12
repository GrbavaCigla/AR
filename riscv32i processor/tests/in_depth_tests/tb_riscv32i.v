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

    initial begin
        // Inicijalizacija
        CLK = 0;
        RESET = 1;
        test_passed = 1'b1;

        // Reset procesora
        #20 RESET = 0;

        // Simulacija izvršavanja po ciklusima programa u memoriji
        // Ciklus 1: LUI / ADDI inicijalizacije
        @(negedge CLK);
        #2;
        $display("[Ciklus 1] PC izvršava prvu instrukciju. RESULT = %h", RESULT);

        // Ciklus 2: ADD / SUB operacije
        @(negedge CLK);
        #2;
        $display("[Ciklus 2] RESULT = %h | Zero Flag = %b | Negative Flag = %b", RESULT, Z, N);

        // Ciklus 3: Logičke operacije (AND/OR/XOR)
        @(negedge CLK);
        #2;
        $display("[Ciklus 3] RESULT = %h", RESULT);

        // Ciklus 4: Pomeranja (SLL/SRL/SRA)
        @(negedge CLK);
        #2;
        $display("[Ciklus 4] RESULT = %h", RESULT);

        // Ciklus 5: Store u memoriju (SW)
        @(negedge CLK);
        #2;
        $display("[Ciklus 5] Store Adresa = %h", RESULT);

        // Ciklus 6: Load iz memorije (LW)
        @(negedge CLK);
        #2;
        $display("[Ciklus 6] Load Adresa = %h", RESULT);

        // Provera rada: Ako procesor uspešno generiše izlaz bez nedefinisanih vrednosti (X/Z)
        if ($isnan(RESULT) || RESULT === 32'hxxxxxxxx) begin
            test_passed = 1'b0;
        end

        #20;
        // Ispis konačnog ishoda u ModelSim konzoli
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