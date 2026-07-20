`timescale 1ns / 1ps

module tb_CMP32;
    reg [31:0] A, B;
    wire G, E, L;

    reg expected_G, expected_E, expected_L;
    integer errors = 0;

    CMP32 uut (
        .A(A),
        .B(B),
        .G(G),
        .E(E),
        .L(L)
    );

    task check_case(input [31:0] test_A, input [31:0] test_B);
        begin
            A = test_A; B = test_B;
            
            if (A > B) begin
                expected_G = 1'b1; expected_E = 1'b0; expected_L = 1'b0;
            end else if (A < B) begin
                expected_G = 1'b0; expected_E = 1'b0; expected_L = 1'b1;
            end else begin
                expected_G = 1'b0; expected_E = 1'b1; expected_L = 1'b0;
            end

            #10;

            if (G === expected_G && E === expected_E && L === expected_L) begin
                $display("%0dns\t  %u   %u    |    %b %b %b    | OK", $time, A, B, G, E, L);
            end else begin
                errors = errors + 1;
                $display("%0dns\t  %u   %u    |    %b %b %b    | GRESKA! Ocekivano: G=%b E=%b L=%b", 
                         $time, A, B, G, E, L, expected_G, expected_E, expected_L);
            end
        end
    endtask

    initial begin
        $display("\n=== POKRETANJE PROVERE ZA CMP32 ===");
        $display("Vreme\t ULAZI (A   B)  | DOBIJENO (G E L) | STATUS");
        $display("-----------------------------------------------------------");

        check_case(32'd0,           32'd0);           // Jednakost nula
        check_case(32'd500000,      32'd200000);      // A vece od B
        check_case(32'd200000,      32'd500000);      // A manje od B
        check_case(32'h8000_0000,   32'h8000_0000);   // Jednakost na najvisem bitu
        check_case(32'hFFFF_FFFF,   32'd0);           // Max protiv min
        check_case(32'd0,           32'hFFFF_FFFF);   // Min protiv max
        check_case(32'hFFFF_FFFF,   32'hFFFF_FFFF);   // Maksimalna jednakost
        check_case(32'h0000_FFFF,   32'h0001_0000);   // Razlika na prelazu 16. bita

        $display("-----------------------------------------------------------");
        if (errors == 0) $display("=== PROVERA ZAVRSENA: SVI PRIMERI SU USPESNO PROSLI (OK)! ===");
        else $display("=== PROVERA ZAVRSENA: Detektovano je %d gresaka! ===", errors);
        $display("===========================================================\n");
        $stop;
    end
endmodule