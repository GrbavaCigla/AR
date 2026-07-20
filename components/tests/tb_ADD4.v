`timescale 1ns / 1ps

module tb_ADD4;
    reg C_0;
    reg [3:0] A, B;
    wire C;
    wire [3:0] OUT;

    // Očekivane vrednosti
    reg [3:0] expected_OUT;
    reg expected_C;
    
    // Brojač grešaka
    integer errors = 0;

    // Povezivanje ADD4 modula
    ADD4 uut (
        .C_0(C_0),
        .A(A),
        .B(B),
        .C(C),
        .OUT(OUT)
    );

    initial begin
        $display("\n=== POKRETANJE PAMETNE PROVERE ZA ADD4 ===");
        $display("Prikaz ključnih testnih situacija:");
        $display("Vreme\t ULAZI (A   B  C_0) | DOBIJENO (OUT   C) | STATUS");
        $display("-----------------------------------------------------------");

        // Prolaz kroz svih 512 kombinacija pomoću petlje
        begin: test_loop
            integer i;
            for (i = 0; i < 512; i = i + 1) begin
                // Razdvajanje bitova broja 'i' na ulaze
                A   = i[8:5];
                B   = i[4:1];
                C_0 = i[0];

                // Izračunavanje tačnog rezultata
                {expected_C, expected_OUT} = A + B + C_0;

                // Čekamo stabilizaciju
                #10;

                // Provera tačnosti
                if (OUT !== expected_OUT || C !== expected_C) begin
                    errors = errors + 1;
                    $display("%0dns\t  %d   %d   %b    |     %d    %b   | GRESKA! Očekivano: %d %b", 
                             $time, A, B, C_0, OUT, C, expected_OUT, expected_C);
                end
                
                // Ispisujemo u konzolu samo nekoliko najzanimljivijih slučajeva radi preglednosti
                else if (i == 0 || i == 9 || i == 270 || i == 511) begin
                    $display("%0dns\t  %d   %d   %b    |     %d    %b   | OK (Karakterističan slučaj)", 
                             $time, A, B, C_0, OUT, C);
                end
            end
        end

        // Finalni izveštaj na kraju testbenča
        $display("-----------------------------------------------------------");
        if (errors == 0) begin
            $display("=== PROVERA ZAVRŠENA: SVE 512 KOMBINACIJE SU USPEŠNO PROŠLE (OK)! ===");
        end else begin
            $display("=== PROVERA ZAVRŠENA: Detektovano je ukupno %d grešaka! ===", errors);
        end
        $display("===========================================================\n");
        $stop;
    end
endmodule