`timescale 1ns / 1ps

module tb_ADD2;
    reg C_0;
    reg [1:0] A, B;
    wire C;
    wire [1:0] OUT;

    // Očekivane vrednosti za automatsku proveru
    reg [1:0] expected_OUT;
    reg expected_C;

    // Povezivanje tvog ADD2 modula
    ADD2 uut (
        .C_0(C_0),
        .A(A),
        .B(B),
        .C(C),
        .OUT(OUT)
    );

    initial begin
        // Ispis zaglavlja u konzoli
        $display("\n=== POKRETANJE AUTOMATSKE PROVERE ZA ADD2 ===");
        $display("Vreme\t ULAZI (A  B  C_0) | DOBIJENO (OUT  C) | STATUS");
        $display("---------------------------------------------------------");

        // Prolazimo kroz sve 32 kombinacije (od 0 do 31)
        begin: test_loop
            integer i;
            for (i = 0; i < 32; i = i + 1) begin
                // Mapiramo bite broja 'i' na ulaze sabirača
                A   = i[4:3]; // Viši bitovi idu na A
                B   = i[2:1]; // Srednji bitovi idu na B
                C_0 = i[0];   // Najniži bit ide na C_0
                
                // Računamo šta sabirač matematički mora da vrati
                // A + B + C_0 daje rezultat od najviše 3 bita (npr. 3 + 3 + 1 = 7, što je 3'b111)
                // Najviši bit (indeks 2) je prenos (expected_C), a donja dva bita su expected_OUT
                {expected_C, expected_OUT} = A + B + C_0;
                
                // Pauza od 10ns za stabilizaciju signala
                #10;
                
                // Automatska provera
                if (OUT === expected_OUT && C === expected_C) begin
                    $display("%0dns\t   %d  %d   %b    |     %d    %b   | OK", $time, A, B, C_0, OUT, C);
                end else begin
                    $display("%0dns\t   %d  %d   %b    |     %d    %b   | GRESKA! Očekivano: OUT=%d C=%b", 
                             $time, A, B, C_0, OUT, C, expected_OUT, expected_C);
                end
            end
        end

        $display("---------------------------------------------------------");
        $display("=== PROVERA ZAVRŠENA ===\n");
        $stop;
    end
endmodule