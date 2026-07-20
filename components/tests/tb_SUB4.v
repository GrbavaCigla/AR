`timescale 1ns / 1ps

module tb_SUB4;
    reg E_0;
    reg [3:0] A, B;
    wire E;
    wire [3:0] OUT;

    reg [3:0] expected_OUT;
    reg expected_E;
    integer errors = 0;

    SUB4 uut (
        .E_0(E_0),
        .A(A),
        .B(B),
        .E(E),
        .OUT(OUT)
    );

    initial begin
        $display("\n=== POKRETANJE PAMETNE PROVERE ZA SUB4 ===");
        $display("Prikaz kljucnih testnih situacija (8 primera):");
        $display("Vreme\t ULAZI (A   B  E_0) | DOBIJENO (OUT   E) | STATUS");
        $display("-----------------------------------------------------------");

        begin: test_loop
            integer i;
            for (i = 0; i < 512; i = i + 1) begin
                A   = i[8:5];
                B   = i[4:1];
                E_0 = i[0];

                {expected_E, expected_OUT} = A - B - E_0;

                #10;

                if (OUT !== expected_OUT || E !== expected_E) begin
                    errors = errors + 1;
                    $display("%0dns\t  %d   %d   %b    |     %d    %b   | GRESKA! Ocekivano: %d %b", 
                             $time, A, B, E_0, OUT, E, expected_OUT, expected_E);
                end
                
                // Selektivni ispis tacno 8 specificnih primera radi preglednosti
                else if (i == 0   || i == 1   || i == 18  || i == 37  || 
                         i == 130 || i == 256 || i == 500 || i == 511) begin
                    $display("%0dns\t  %d   %d   %b    |     %d    %b   | OK (Karakteristicen slucaj)", 
                             $time, A, B, E_0, OUT, E);
                end
            end
        end

        $display("-----------------------------------------------------------");
        if (errors == 0) begin
            $display("=== PROVERA ZAVRSENA: SVE 512 KOMBINACIJE SU USPESNO PROSLI (OK)! ===");
        end else begin
            $display("=== PROVERA ZAVRSENA: Detektovano je ukupno %d gresaka! ===", errors);
        end
        $display("===========================================================\n");
        $stop;
    end
endmodule