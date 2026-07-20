`timescale 1ns / 1ps

module tb_AND32;
    reg [31:0] IN;
    wire OUT;

    reg expected_OUT;
    integer errors = 0;

    AND32 uut (
        .IN(IN),
        .OUT(OUT)
    );

    task check_case(input [31:0] test_IN);
        begin
            IN = test_IN;
            expected_OUT = (IN === 32'hFFFF_FFFF) ? 1'b1 : 1'b0; // Ocekuje 1 samo ako su svi bitovi 1
            #10;
            if (OUT === expected_OUT) begin
                $display("%0dns\t  32'h%h    |      %b      | OK", $time, IN, OUT);
            end else begin
                errors = errors + 1;
                $display("%0dns\t  32'h%h    |      %b      | GRESKA! Ocekivano: %b", 
                         $time, IN, OUT, expected_OUT);
            end
        end
    endtask

    initial begin
        $display("\n=== POKRETANJE PROVERE ZA AND32 (8 KARAKTERISTICNIH PRIMERA) ===");
        $display("Vreme\t ULAZ (IN u HEX)      | DOBIJENO (OUT) | STATUS");
        $display("-----------------------------------------------------------");

        check_case(32'h0000_0000); // Primer 1: Sve nule (mora dati 0)
        check_case(32'hFFFF_FFFE); // Primer 2: Skoro svi bitovi 1 (mora dati 0)
        check_case(32'hFFFF_0000); // Primer 3: Gornja polovina 1 (mora dati 0)
        check_case(32'h0000_FFFF); // Primer 4: Donja polovina 1 (mora dati 0)
        check_case(32'h7FFF_FFFF); // Primer 5: Najvisi bit fali (mora dati 0)
        check_case(32'hFFFE_FFFF); // Primer 6: Jedan bit u sredini fali (mora dati 0)
        check_case(32'hFFFF_FFFF); // Primer 7: SVI bitovi su 1 (mora dati 1)
        check_case(32'h5555_5555); // Primer 8: Naizmenicni bitovi (mora dati 0)

        $display("-----------------------------------------------------------");
        if (errors == 0) $display("=== PROVERA ZAVRSENA: SVI PRIMERI SU USPESNO PROSLI (OK)! ===");
        else $display("=== PROVERA ZAVRSENA: Detektovano je %d gresaka! ===", errors);
        $display("===========================================================\n");
        $stop;
    end
endmodule