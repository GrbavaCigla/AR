`timescale 1ns / 1ps

module tb_SUB8;
    reg E_0;
    reg [7:0] A, B;
    wire E;
    wire [7:0] OUT;

    reg [7:0] expected_OUT;
    reg expected_E;
    integer errors = 0;

    SUB8 uut (
        .E_0(E_0),
        .A(A),
        .B(B),
        .E(E),
        .OUT(OUT)
    );

    task check_case(input [7:0] test_A, input [7:0] test_B, input test_E0);
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
        $display("\n=== POKRETANJE PROVERE ZA SUB8 (8 KARAKTERISTICNIH PRIMERA) ===");
        $display("Vreme\t ULAZI (A   B  E_0) | DOBIJENO (OUT   E) | STATUS");
        $display("-----------------------------------------------------------");

        check_case(8'd0,   8'd0,   1'b0); // Primer 1: Sve nule
        check_case(8'd50,  8'd20,  1'b0); // Primer 2: Obicno oduzimanje bez pozajmice
        check_case(8'd20,  8'd50,  1'b0); // Primer 3: Oduzimanje koje izaziva pozajmicu na kraju (E=1)
        check_case(8'd0,   8'd0,   1'b1); // Primer 4: Samo E_0 aktivno (oduzimanje od nule)
        check_case(8'd128, 8'd1,   1'b0); // Primer 5: Pozajmica koja prolazi kroz nize bitove
        check_case(8'd255, 8'd255, 1'b0); // Primer 6: Oduzimanje istih maksimalnih vrednosti
        check_case(8'd255, 8'd0,   1'b1); // Primer 7: Maksimalna vrednost minus pozajmica
        check_case(8'd0,   8'd255, 1'b1); // Primer 8: Nula minus maksimalna vrednost i E_0

        $display("-----------------------------------------------------------");
        if (errors == 0) $display("=== PROVERA ZAVRSENA: SVIH 8 PRIMERA SU USPESNO PROSLI (OK)! ===");
        else $display("=== PROVERA ZAVRSENA: Detektovano je %d gresaka! ===", errors);
        $display("===========================================================\n");
        $stop;
    end
endmodule