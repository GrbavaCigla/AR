`timescale 1ns / 1ps

module tb_MPX2_32BIT;
    reg E, S;
    reg [31:0] I0, I1;
    wire [31:0] D;

    reg [31:0] expected_D;
    integer errors = 0;

    // Instanciranje modula pod testom (UUT)
    MPX2_32BIT uut (
        .E(E),
        .S(S),
        .I0(I0),
        .I1(I1),
        .D(D)
    );

    // Zadatak za proveru pojedinačnih test slučajeva
    task check_case(
        input test_E,
        input test_S,
        input [31:0] test_I0,
        input [31:0] test_I1
    );
        begin
            E = test_E;
            S = test_S;
            I0 = test_I0;
            I1 = test_I1;

            if (!E) begin
                expected_D = 32'h0000_0000;
            end else if (S == 1'b0) begin
                expected_D = I0;
            end else begin
                expected_D = I1;
            end

            #10;

            if (D === expected_D) begin
                $display("%0dns\t E=%b S=%b | I0=%h I1=%h | D=%h | OK", 
                         $time, E, S, I0, I1, D);
            end else begin
                errors = errors + 1;
                $display("%0dns\t E=%b S=%b | I0=%h I1=%h | D=%h | GRESKA! Ocekivano: D=%h", 
                         $time, E, S, I0, I1, D, expected_D);
            end
        end
    endtask

    initial begin
        $display("\n=== POKRETANJE PROVERE ZA MPX2_32BIT ===");
        $display("Vreme\t ULAZI (E S) | ULAZI (I0 I1)        | DOBIJENO (D) | STATUS");
        $display("-------------------------------------------------------------------------");

        // 1. Testovi kada je Enable isključen (E = 0)
        check_case(1'b0, 1'b0, 32'h1234_5678, 32'h8765_4321);
        check_case(1'b0, 1'b1, 32'h1234_5678, 32'h8765_4321);

        // 2. Testovi za izbor ulaza I0 (E = 1, S = 0)
        check_case(1'b1, 1'b0, 32'hAAAA_AAAA, 32'h5555_5555);
        check_case(1'b1, 1'b0, 32'hFFFF_FFFF, 32'h0000_0000);
        check_case(1'b1, 1'b0, 32'h1234_5678, 32'h9ABC_DEF0);

        // 3. Testovi za izbor ulaza I1 (E = 1, S = 1)
        check_case(1'b1, 1'b1, 32'hAAAA_AAAA, 32'h5555_5555);
        check_case(1'b1, 1'b1, 32'h0000_0000, 32'hFFFF_FFFF);
        check_case(1'b1, 1'b1, 32'h1234_5678, 32'h9ABC_DEF0);

        $display("-------------------------------------------------------------------------");
        if (errors == 0) 
            $display("=== PROVERA ZAVRSENA: SVI PRIMERI SU USPESNO PROSLI (OK)! ===");
        else 
            $display("=== PROVERA ZAVRSENA: Detektovano je %d gresaka! ===", errors);
        $display("=========================================================================\n");
        
        $stop;
    end
endmodule