`timescale 1ns / 1ps

module tb_DMPX2_32BIT;
    reg E, S;
    reg [31:0] I;
    wire [31:0] O0, O1;

    reg [31:0] expected_O0, expected_O1;
    integer errors = 0;

    // Instanciranje modula sa ispravnim nazivima portova (.D0 i .D1)
    DMPX2_32BIT uut (
        .E(E),
        .S(S),
        .I(I),
        .D0(O0),
        .D1(O1)
    );

    // Zadatak za proveru pojedinačnih test slučajeva
    task check_case(
        input test_E,
        input test_S,
        input [31:0] test_I
    );
        begin
            E = test_E;
            S = test_S;
            I = test_I;

            if (!E) begin
                expected_O0 = 32'h0000_0000;
                expected_O1 = 32'h0000_0000;
            end else if (S == 1'b0) begin
                expected_O0 = I;
                expected_O1 = 32'h0000_0000;
            end else begin
                expected_O0 = 32'h0000_0000;
                expected_O1 = I;
            end

            #10;

            if (O0 === expected_O0 && O1 === expected_O1) begin
                $display("%0dns\t E=%b S=%b | I=%h | O0=%h O1=%h | OK", 
                         $time, E, S, I, O0, O1);
            end else begin
                errors = errors + 1;
                $display("%0dns\t E=%b S=%b | I=%h | O0=%h O1=%h | GRESKA! Ocekivano: O0=%h O1=%h", 
                         $time, E, S, I, O0, O1, expected_O0, expected_O1);
            end
        end
    endtask

    initial begin
        $display("\n=== POKRETANJE PROVERE ZA DMPX2_32BIT ===");
        $display("Vreme\t ULAZI (E S) | ULAZ (I)   | DOBIJENO (O0 O1)                     | STATUS");
        $display("-----------------------------------------------------------------------------------");

        // 1. Testovi kada je E = 0 (Izlazi moraju biti 0)
        check_case(1'b0, 1'b0, 32'hFFFF_FFFF);
        check_case(1'b0, 1'b1, 32'h1234_5678);

        // 2. Testovi za prosleđivanje na O0 (E = 1, S = 0)
        check_case(1'b1, 1'b0, 32'hAAAA_AAAA);
        check_case(1'b1, 1'b0, 32'h1234_5678);

        // 3. Testovi za prosleđivanje na O1 (E = 1, S = 1)
        check_case(1'b1, 1'b1, 32'h5555_5555);
        check_case(1'b1, 1'b1, 32'h9ABC_DEF0);

        $display("-----------------------------------------------------------------------------------");
        if (errors == 0) 
            $display("=== PROVERA ZAVRSENA: SVI PRIMERI SU USPESNO PROSLI (OK)! ===");
        else 
            $display("=== PROVERA ZAVRSENA: Detektovano je %d gresaka! ===", errors);
        $display("================================================================-------------------\n");
        
        $stop;
    end
endmodule