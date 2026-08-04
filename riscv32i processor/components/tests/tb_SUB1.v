`timescale 1ns / 1ps

module tb_SUB1;
    reg A, B, E_0;
    wire OUT, E;

    // Ocekivane vrednosti za automatsku proveru
    reg expected_OUT;
    reg expected_E;

    // Povezivanje tvog SUB1 modula
    SUB1 uut (
        .A(A),
        .B(B),
        .E_0(E_0),
        .OUT(OUT),
        .E(E)
    );

    initial begin
        // Ispis zaglavlja u konzoli
        $display("\n=== POKRETANJE AUTOMATSKE PROVERE ZA SUB1 ===");
        $display("Vreme\t ULAZI (A B E_0) | DOBIJENO (OUT E) | STATUS");
        $display("-------------------------------------------------------");

        // Prolazimo kroz sve 8 kombinacije (od 000 do 111) pomoću petlje
        begin: test_loop
            integer i;
            for (i = 0; i < 8; i = i + 1) begin
                A   = i[2];
                B   = i[1];
                E_0 = i[0];
                
                // Izracunavamo sta bi oduzimac morao da vrati
                // A - B - E_0 daje rezultat u opsegu od -2 do 1
                // U binarnom sistemu: {expected_E, expected_OUT} = A - B - E_0;
                {expected_E, expected_OUT} = A - B - E_0;
                
                // Cekamo 10ns da se signal stabilizuje u kolu
                #10;
                
                // Automatska provera rezultata
                if (OUT === expected_OUT && E === expected_E) begin
                    $display("%0dns\t   %b   %b   %b    |    %b    %b   | OK", $time, A, B, E_0, OUT, E);
                end else begin
                    $display("%0dns\t   %b   %b   %b    |    %b    %b   | GRESKA! Ocekivano: OUT=%b E=%b", 
                             $time, A, B, E_0, OUT, E, expected_OUT, expected_E);
                end
            end
        end

        $display("-------------------------------------------------------");
        $display("=== PROVERA ZAVRSENA ===\n");
        $stop;
    end
endmodule