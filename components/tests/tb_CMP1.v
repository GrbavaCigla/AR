`timescale 1ns / 1ps

module tb_CMP1;
    reg A, B;
    reg Gi_1, Ei_1, Li_1;
    wire G, E, L;

    // Ocekivane vrednosti
    reg expected_G, expected_E, expected_L;

    // Povezivanje modula
    CMP1 uut (
        .A(A),
        .B(B),
        .Gi_1(Gi_1),
        .Ei_1(Ei_1),
        .Li_1(Li_1),
        .G(G),
        .E(E),
        .L(L)
    );

    initial begin
        $display("\n=== POKRETANJE AUTOMATSKE PROVERE ZA CMP1 ===");
        $display("Vreme\t ULAZI (A B | G_1 E_1 L_1) | DOBIJENO (G E L) | STATUS");
        $display("-----------------------------------------------------------------");

        begin: test_loop
            integer i;
            for (i = 0; i < 32; i = i + 1) begin
                // Razbijanje broja i na ulazne signale
                A    = i[4];
                B    = i[3];
                Gi_1 = i[2];
                Ei_1 = i[1];
                Li_1 = i[0];

                // Matematicka logika komparatora
                if (A > B) begin
                    expected_G = 1'b1; expected_E = 1'b0; expected_L = 1'b0;
                end else if (A < B) begin
                    expected_G = 1'b0; expected_E = 1'b0; expected_L = 1'b1;
                end else begin // Ako su A i B jednaki, prepisuje se prethodno stanje
                    expected_G = Gi_1; expected_E = Ei_1; expected_L = Li_1;
                end

                #10;

                if (G === expected_G && E === expected_E && L === expected_L) begin
                    $display("%0dns\t   %b %b |   %b   %b   %b   |    %b %b %b    | OK", 
                             $time, A, B, Gi_1, Ei_1, Li_1, G, E, L);
                end else begin
                    $display("%0dns\t   %b %b |   %b   %b   %b   |    %b %b %b    | GRESKA! Ocekivano: G=%b E=%b L=%b", 
                             $time, A, B, Gi_1, Ei_1, Li_1, G, E, L, expected_G, expected_E, expected_L);
                end
            end
        end

        $display("-----------------------------------------------------------------");
        $display("=== PROVERA ZAVRSENA ===\n");
        $stop;
    end
endmodule