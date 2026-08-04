`timescale 1ns / 1ps

module tb_CMP8;
    reg [7:0] A, B;
    wire G, E, L;

    reg expected_G, expected_E, expected_L;
    integer errors = 0;

    // Povezivanje tvog azuriranog CMP8 modula
    CMP8 uut (
        .A(A),
        .B(B),
        .G(G),
        .E(E),
        .L(L)
    );

    task check_case(input [7:0] test_A, input [7:0] test_B);
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
                $display("%0dns\t  %d   %d    |    %b %b %b    | OK", $time, A, B, G, E, L);
            end else begin
                errors = errors + 1;
                $display("%0dns\t  %d   %d    |    %b %b %b    | GRESKA! Ocekivano: G=%b E=%b L=%b", 
                         $time, A, B, G, E, L, expected_G, expected_E, expected_L);
            end
        end
    endtask

    initial begin
        $display("\n=== POKRETANJE PROVERE ZA CMP8 (8 PRIMERA) ===");
        $display("Vreme\t ULAZI (A   B)  | DOBIJENO (G E L) | STATUS");
        $display("-----------------------------------------------------------");

        check_case(8'd0,   8'd0);   // Jednakost nula
        check_case(8'd50,  8'd20);  // A vece od B
        check_case(8'd20,  8'd50);  // A manje od B
        check_case(8'd128, 8'd128); // Jednakost srednjih vrednosti
        check_case(8'd255, 8'd0);   // Max vrednost protiv min vrednosti
        check_case(8'd0,   8'd255); // Min vrednost protiv max vrednosti
        check_case(8'd255, 8'd255); // Jednakost maksimalnih vrednosti
        check_case(8'd127, 8'd128); // Razlika za samo jedan najznacajniji bit

        $display("-----------------------------------------------------------");
        if (errors == 0) $display("=== PROVERA ZAVRSENA: SVI PRIMERI SU USPESNO PROSLI (OK)! ===");
        else $display("=== PROVERA ZAVRSENA: Detektovano je %d gresaka! ===", errors);
        $display("===========================================================\n");
        $stop;
    end
endmodule