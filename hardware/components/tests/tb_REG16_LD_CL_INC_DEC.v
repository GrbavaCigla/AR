`timescale 1ns / 1ps

module tb_REG16_LD_CL_INC_DEC;
    reg CL, clk, LD, INC, DEC, C0, E0;
    reg [15:0] I;
    wire C16, E16;
    wire [15:0] A;
    integer errors = 0;

    REG16_LD_CL_INC_DEC uut (
        .CL(CL), .clk(clk), .LD(LD), .INC(INC), .DEC(DEC),
        .C0(C0), .E0(E0), .I(I), .C16(C16), .E16(E16), .A(A)
    );

    always #5 clk = ~clk;

    // Funkcija koja postavlja ulaze, proverava prenos PRE takta, pa proverava registar POSLE takta
    task step_and_check(
        input t_LD, input t_CL, input t_INC, input t_DEC,
        input t_C0, input t_E0, input [15:0] t_I,
        input exp_C16_before_clk, input exp_E16_before_clk,
        input [15:0] exp_A_after_clk,
        input [255:0] desc
    );
        begin
            // 1. Postavi ulazne signale
            LD = t_LD; CL = t_CL; INC = t_INC; DEC = t_DEC;
            C0 = t_C0; E0 = t_E0; I = t_I;

            // 2. Proveri kombinatorne prenose PRE taktne ivice
            #2;
            if (C16 !== exp_C16_before_clk || E16 !== exp_E16_before_clk) begin
                errors = errors + 1;
                $display("%0dns | ERR Prenos | Dobijeno: C16=%b E16=%b | Ocekivano: C16=%b E16=%b | %s", 
                         $time, C16, E16, exp_C16_before_clk, exp_E16_before_clk, desc);
            end

            // 3. Dočekaj taktnu ivicu
            @(posedge clk);
            #1;

            // 4. Proveri stanje registra POSLE taktne ivice
            if (A !== exp_A_after_clk) begin
                errors = errors + 1;
                $display("%0dns | ERR Registar | Dobijeno: A=%h | Ocekivano: A=%h | %s", 
                         $time, A, exp_A_after_clk, desc);
            end else begin
                $display("%0dns | OK  | A=%h C16=%b E16=%b | %s", $time, A, C16, E16, desc);
            end
        end
    endtask

    initial begin
        clk = 0; CL = 0; LD = 0; INC = 0; DEC = 0; C0 = 0; E0 = 0; I = 0;
        #12;

        $display("\n=== REAL TEST: REG16 ===");

        // Upis, cuvanje i brisanje
        step_and_check(1,0,0,0, 0,0, 16'hA5A5, 0,0, 16'hA5A5, "Load 16'hA5A5");
        step_and_check(0,0,0,0, 0,0, 16'h0000, 0,0, 16'hA5A5, "Hold 16'hA5A5");
        step_and_check(0,1,0,0, 0,0, 16'h0000, 0,0, 16'h0000, "Clear");

        // Inkrement preko 8-bitne granice
        step_and_check(1,0,0,0, 0,0, 16'h00FF, 0,0, 16'h00FF, "Load 16'h00FF");
        step_and_check(0,0,1,0, 1,0, 16'h0000, 0,0, 16'h0100, "INC preko bajta: 00FF -> 0100");

        // Overflow prenos (FFFF + INC=1 generise C16=1 pre takta, pa prelazi na 0000)
        step_and_check(1,0,0,0, 0,0, 16'hFFFF, 0,0, 16'hFFFF, "Load 16'hFFFF");
        step_and_check(0,0,1,0, 1,0, 16'h0000, 1,0, 16'h0000, "Overflow: C16=1 tokom FFFF+INC, prelaz u 0000");
        step_and_check(0,0,1,0, 1,0, 16'h0000, 0,0, 16'h0001, "Sledeci INC: 0000 -> 0001");

        // Underflow pozajmica (0000 + DEC=1 generise E16=1 pre takta, pa prelazi na FFFF)
        step_and_check(0,1,0,0, 0,0, 16'h0000, 0,0, 16'h0000, "Clear na 0000");
        step_and_check(0,0,0,1, 0,1, 16'h0000, 0,1, 16'hFFFF, "Underflow: E16=1 tokom 0000+DEC, prelaz u FFFF");
        step_and_check(0,0,0,1, 0,1, 16'h0000, 0,0, 16'hFFFE, "Sledeci DEC: FFFF -> FFFE");

        // Prioriteti
        step_and_check(1,1,1,1, 1,1, 16'h1234, 0,0, 16'h1234, "Prioritet: LD najvisi");
        step_and_check(0,1,1,1, 1,1, 16'h0000, 0,0, 16'h0000, "Prioritet: CL potiskuje INC/DEC");

        if (errors == 0) $display("=== STATUS REG16: PASS! ===");
        else $display("=== STATUS REG16: FAIL (%0d gresaka) ===", errors);
        $stop;
    end
endmodule