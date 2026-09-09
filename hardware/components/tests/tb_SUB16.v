`timescale 1ns / 1ps

module tb_SUB16;
    reg E_0;
    reg [15:0] A, B;
    wire E;
    wire [15:0] OUT;

    reg [15:0] expected_OUT;
    reg expected_E;
    integer errors = 0;

    SUB16 uut (
        .E_0(E_0),
        .A(A),
        .B(B),
        .E(E),
        .OUT(OUT)
    );

    task check_case(input [15:0] test_A, input [15:0] test_B, input test_E0);
        begin
            A = test_A; B = test_B; E_0 = test_E0;
            {expected_E, expected_OUT} = A - B - E_0;
            #10;
            if (OUT === expected_OUT && E === expected_E) begin
                $display("%0dns\t  %d   %d   %b    |     %d    %b   | OK", $time, A, B, E_0, OUT, E);
            end else begin
                errors = errors + 1;
                $display("%0dns\t  %d   %d   %b    |     %d    %b   | GRESKA! Ocekivano: %d %b", 
                         $time, A, B, E_0, OUT, E, expected_OUT, expected_E);
            end
        end
    endtask

    initial begin
        $display("\n=== POKRETANJE PROVERE ZA SUB16 (8 KARAKTERISTICNIH PRIMERA) ===");
        $display("Vreme\t ULAZI (A   B  E_0) | DOBIJENO (OUT   E) | STATUS");
        $display("-----------------------------------------------------------");

        check_case(16'd0,     16'd0,     1'b0); // Primer 1
        check_case(16'd10000, 16'd4000,  1'b0); // Primer 2
        check_case(16'd4000,  16'd10000, 1'b0); // Primer 3 (izaziva E=1)
        check_case(16'd32768, 16'd1,     1'b0); // Primer 4
        check_case(16'd0,     16'd1,     1'b1); // Primer 5
        check_case(16'd65535, 16'd65535, 1'b0); // Primer 6
        check_case(16'd65535, 16'd0,     1'b1); // Primer 7
        check_case(16'd0,     16'd65535, 1'b1); // Primer 8

        $display("-----------------------------------------------------------");
        if (errors == 0) $display("=== PROVERA ZAVRSENA: SVIH 8 PRIMERA SU USPESNO PROSLI (OK)! ===");
        else $display("=== PROVERA ZAVRSENA: Detektovano je %d gresaka! ===", errors);
        $display("===========================================================\n");
        $stop;
    end
endmodule