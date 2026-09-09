`timescale 1ns / 1ps

module tb_SUB2;
    reg E_0;
    reg [1:0] A, B;
    wire E;
    wire [1:0] OUT;

    reg [1:0] expected_OUT;
    reg expected_E;

    SUB2 uut (
        .E_0(E_0),
        .A(A),
        .B(B),
        .E(E),
        .OUT(OUT)
    );

    initial begin
        $display("\n=== POKRETANJE AUTOMATSKE PROVERE ZA SUB2 ===");
        $display("Vreme\t ULAZI (A  B  E_0) | DOBIJENO (OUT  E) | STATUS");
        $display("---------------------------------------------------------");

        begin: test_loop
            integer i;
            for (i = 0; i < 32; i = i + 1) begin
                A   = i[4:3];
                B   = i[2:1];
                E_0 = i[0];
                
                // Racunamo matematicki ispravan rezultat oduzimanja
                {expected_E, expected_OUT} = A - B - E_0;
                
                #10;
                
                if (OUT === expected_OUT && E === expected_E) begin
                    $display("%0dns\t   %d  %d   %b    |     %d    %b   | OK", $time, A, B, E_0, OUT, E);
                end else begin
                    $display("%0dns\t   %d  %d   %b    |     %d    %b   | GRESKA! Ocekivano: OUT=%d E=%b", 
                             $time, A, B, E_0, OUT, E, expected_OUT, expected_E);
                end
            end
        end

        $display("---------------------------------------------------------");
        $display("=== PROVERA ZAVRSENA ===\n");
        $stop;
    end
endmodule