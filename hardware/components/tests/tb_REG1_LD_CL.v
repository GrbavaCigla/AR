`timescale 1ns / 1ps

module tb_REG1_LD_CL;
    reg CL;
    reg clk;
    reg LD;
    reg I;
    wire A;

    reg expected_A;
    integer errors = 0;

    // Povezivanje tvog originalnog modula
    REG1_LD_CL uut (
        .CL(CL),
        .clk(clk),
        .LD(LD),
        .I(I),
        .A(A)
    );

    // Generisanje takta (period 10ns)
    always #5 clk = ~clk;

    task check_case(input test_CL, input test_LD, input test_I, input exp_A, input [255:0] desc);
        begin
            CL = test_CL; LD = test_LD; I = test_I; expected_A = exp_A;
            
            // Ceka se uzlazna ivica takta + malo kasnjenje za stabilizaciju izlaza
            @(posedge clk);
            #1;

            if (A === expected_A) begin
                $display("%0dns\t CL=%b LD=%b I=%b | A=%b | OK  (%s)", $time, CL, LD, I, A, desc);
            end else begin
                errors = errors + 1;
                $display("%0dns\t CL=%b LD=%b I=%b | A=%b | GRESKA! Ocekivano: %b (%s)", 
                         $time, CL, LD, I, A, expected_A, desc);
            end
        end
    endtask

    initial begin
        clk = 0;
        CL = 0;
        LD = 0;
        I = 0;

        // Ceka se stabilizacija na pocetku
        #12;

        $display("\n=== POKRETANJE PROVERE ZA REG1_LD_CL (Prioritet: LD) ===");
        $display("Vreme\t ULAZI        | IZLAZ | STATUS");
        $display("-----------------------------------------------------------");

        // 1. Aktivno brisanje kada nema Load-a
        check_case(1'b1, 1'b0, 1'b1, 1'b0, "Clear aktivan, LD neaktivan");

        // 2. Upis jedinice (LD=1, CL=0)
        check_case(1'b0, 1'b1, 1'b1, 1'b1, "Upis vrednosti 1");

        // 3. Cuvaj stanje (LD=0, CL=0) -> mora ostati 1
        check_case(1'b0, 1'b0, 1'b0, 1'b1, "Cuvanje vrednosti 1");

        // 4. Test prioriteta: Aktivirani i CL i LD, ulaz I=1. 
        // Posto LD ima prioritet, registar mora da UPSE 1, a ne da se obrise!
        check_case(1'b1, 1'b1, 1'b1, 1'b1, "Prioritet: LD=1 i I=1 prepisuju CL=1");

        // 5. Test prioriteta sa nulom: Aktivirani i CL i LD, ulaz I=0.
        // LD ponovo ima prioritet i upisuje 0.
        check_case(1'b0, 1'b1, 1'b0, 1'b0, "Upis vrednosti 0 preko LD");

        // 6. Pokusaj brisanja dok je LD=1 i I=1 -> Izlaz mora postati 1
        check_case(1'b1, 1'b1, 1'b1, 1'b1, "Prioritet: LD ponovo pobedjuje Clear");

        // 7. Cuvaj stanje (LD=0, CL=0)
        check_case(1'b0, 1'b0, 1'b0, 1'b1, "Cuvanje vrednosti");

        $display("-----------------------------------------------------------");
        if (errors == 0) $display("=== PROVERA ZAVRSENA: REGISTAR RADI ISPRAVNO (OK)! ===");
        else $display("=== PROVERA ZAVRSENA: Detektovano je %d gresaka! ===", errors);
        $display("===========================================================\n");
        $stop;
    end
endmodule