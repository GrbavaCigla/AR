`timescale 1ns / 1ps

module tb_ADD16;
    reg C_0;
    reg [15:0] A, B;
    wire C;
    wire [15:0] OUT;

    reg [15:0] expected_OUT;
    reg expected_C;
    integer errors = 0;

    ADD16 uut (
        .C_0(C_0),
        .A(A),
        .B(B),
        .C(C),
        .OUT(OUT)
    );

    task check_case(input [15:0] test_A, input [15:0] test_B, input test_C0);
        begin
            A = test_A; B = test_B; C_0 = test_C0;
            {expected_C, expected_OUT} = A + B + C_0;
            #10;
            if (OUT === expected_OUT && C === expected_C) begin
                $display("%0dns\t  %d   %d   %b    |     %d    %b   | OK", $time, A, B, C_0, OUT, C);
            end else begin
                errors = errors + 1;
                $display("%0dns\t  %d   %d   %b    |     %d    %b   | GRESKA! Ocekivano: %d %b", 
                         $time, A, B, C_0, OUT, C, expected_OUT, expected_C);
            end
        end
    endtask

    initial begin
        $display("\n=== POKRETANJE PROVERE ZA ADD16 (8 KARAKTERISTICNIH PRIMERA) ===");
        $display("Vreme\t ULAZI (A   B  C_0) | DOBIJENO (OUT   C) | STATUS");
        $display("-----------------------------------------------------------");

        check_case(16'd0,     16'd0,     1'b0); // Primer 1
        check_case(16'd5000,  16'd4000,  1'b0); // Primer 2
        check_case(16'd40000, 16'd30000, 1'b0); // Primer 3 (izaziva Cout=1)
        check_case(16'd65535, 16'd0,     1'b0); // Primer 4
        check_case(16'd65535, 16'd0,     1'b1); // Primer 5
        check_case(16'd32767, 16'd32768, 1'b0); // Primer 6
        check_case(16'd1,      16'd1,      1'b1); // Primer 7
        check_case(16'd65535, 16'd65535, 1'b1); // Primer 8

        $display("-----------------------------------------------------------");
        if (errors == 0) $display("=== PROVERA ZAVRSENA: SVIH 8 PRIMERA SU USPESNO PROSLI (OK)! ===");
        else $display("=== PROVERA ZAVRSENA: Detektovano je %d gresaka! ===", errors);
        $display("===========================================================\n");
        $stop;
    end
endmodule