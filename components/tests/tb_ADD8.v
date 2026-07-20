`timescale 1ns / 1ps

module tb_ADD8;
    reg C_0;
    reg [7:0] A, B;
    wire C;
    wire [7:0] OUT;

    reg [7:0] expected_OUT;
    reg expected_C;
    integer errors = 0;

    ADD8 uut (
        .C_0(C_0),
        .A(A),
        .B(B),
        .C(C),
        .OUT(OUT)
    );

    // Pomocni zadatak za proveru
    task check_case(input [7:0] test_A, input [7:0] test_B, input test_C0);
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
        $display("\n=== POKRETANJE PROVERE ZA ADD8 (8 KARAKTERISTICNIH PRIMERA) ===");
        $display("Vreme\t ULAZI (A   B  C_0) | DOBIJENO (OUT   C) | STATUS");
        $display("-----------------------------------------------------------");

        check_case(8'd0,   8'd0,   1'b0); // Primer 1: Sve nule
        check_case(8'd15,  8'd10,  1'b0); // Primer 2: Obicno sabiranje bez prenosa
        check_case(8'd200, 8'd50,  1'b0); // Primer 3: Sabiranje blizu granice
        check_case(8'd250, 8'd10,  1'b0); // Primer 4: Sabiranje sa prenosom na kraju (Cout=1)
        check_case(8'd0,   8'd0,   1'b1); // Primer 5: Samo C_0 aktivan
        check_case(8'd127, 8'd128, 1'b0); // Primer 6: Prelaz na polovini registra
        check_case(8'd255, 8'd0,   1'b1); // Primer 7: Maksimalna vrednost + C_0
        check_case(8'd255, 8'd255, 1'b1); // Primer 8: Sve maksimalno

        $display("-----------------------------------------------------------");
        if (errors == 0) $display("=== PROVERA ZAVRSENA: SVIH 8 PRIMERA SU USPESNO PROSLI (OK)! ===");
        else $display("=== PROVERA ZAVRSENA: Detektovano je %d gresaka! ===", errors);
        $display("===========================================================\n");
        $stop;
    end
endmodule