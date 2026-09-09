`timescale 1ns / 1ps

module tb_ADD32;
    reg C_0;
    reg [31:0] A, B;
    wire C;
    wire [31:0] OUT;

    reg [31:0] expected_OUT;
    reg expected_C;
    integer errors = 0;

    ADD32 uut (
        .C_0(C_0),
        .A(A),
        .B(B),
        .C(C),
        .OUT(OUT)
    );

    task check_case(input [31:0] test_A, input [31:0] test_B, input test_C0);
        begin
            A = test_A; B = test_B; C_0 = test_C0;
            {expected_C, expected_OUT} = A + B + C_0;
            #10;
            if (OUT === expected_OUT && C === expected_C) begin
                $display("%0dns\t  %u   %u   %b    |     %u    %b   | OK", $time, A, B, C_0, OUT, C);
            end else begin
                errors = errors + 1;
                $display("%0dns\t  %u   %u   %b    |     %u    %b   | GRESKA! Ocekivano: %u %b", 
                         $time, A, B, C_0, OUT, C, expected_OUT, expected_C);
            end
        end
    endtask

    initial begin
        $display("\n=== POKRETANJE PROVERE ZA ADD32 (8 KARAKTERISTICNIH PRIMERA) ===");
        $display("Vreme\t ULAZI (A   B  C_0) | DOBIJENO (OUT   C) | STATUS");
        $display("-----------------------------------------------------------");

        check_case(32'd0,           32'd0,           1'b0); // Primer 1
        check_case(32'd1000000,     32'd2500000,     1'b0); // Primer 2
        check_case(32'hFFFF_0000,   32'h0000_FFFF,   1'b0); // Primer 3
        check_case(32'hFFFF_FFFF,   32'd1,           1'b0); // Primer 4 (izaziva Cout=1)
        check_case(32'd0,           32'd0,           1'b1); // Primer 5
        check_case(32'h7FFF_FFFF,   32'h8000_0000,   1'b0); // Primer 6
        check_case(32'hFFFF_FFFF,   32'd0,           1'b1); // Primer 7
        check_case(32'hFFFF_FFFF,   32'hFFFF_FFFF,   1'b1); // Primer 8

        $display("-----------------------------------------------------------");
        if (errors == 0) $display("=== PROVERA ZAVRSENA: SVIH 8 PRIMERA SU USPESNO PROSLI (OK)! ===");
        else $display("=== PROVERA ZAVRSENA: Detektovano je %d gresaka! ===", errors);
        $display("===========================================================\n");
        $stop;
    end
endmodule