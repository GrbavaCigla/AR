`timescale 1ns / 1ps

module tb_ADD1;
    reg A, B, C_0;
    wire C, OUT;

    // Ocekivane vrednosti za automatsku proveru
    reg expected_OUT;
    reg expected_C;

    // Povezivanje tvog popravljenog modula
    ADD1 uut (
        .A(A),
        .B(B),
        .C_0(C_0),
        .C(C),
        .OUT(OUT)
    );

    initial begin
        // Ispis zaglavlja u konzoli
        $display("\n=== POKRETANJE AUTOMATSKE PROVERE ZA ADD1 ===");
        $display("Vreme\t ULAZI (A B C_0) | DOBIJENO (OUT C) | STATUS");
        $display("-------------------------------------------------------");

        // Prolazimo kroz sve kombinacije (od 000 do 111) pomoću petlje
        // Koristimo celobrojnu promenljivu za lakše generisanje kombinacija
        begin: test_loop
            integer i;
            for (i = 0; i < 8; i = i + 1) begin
                // Razdvajamo bite broja 'i' na pojedinacne ulaze
                A   = i[2];
                B   = i[1];
                C_0 = i[0];
                
                // Izracunavamo sta bi TAČNO sabirac morao da vrati za ove ulaze
                {expected_C, expected_OUT} = A + B + C_0;
                
                // Cekamo 10ns da se signal stabilizuje u kolu
                #10;
                
                // Automatska provera rezultata
                if (OUT === expected_OUT && C === expected_C) begin
                    $display("%0dns\t   %b   %b   %b    |    %b    %b   | OK", $time, A, B, C_0, OUT, C);
                end else begin
                    $display("%0dns\t   %b   %b   %b    |    %b    %b   | GRESKA! Ocekivano: OUT=%b C=%b", 
                             $time, A, B, C_0, OUT, C, expected_OUT, expected_C);
                end
            end
        end

        $display("-------------------------------------------------------");
        $display("=== PROVERA ZAVRSENA ===\n");
        $stop;
    end
endmodule