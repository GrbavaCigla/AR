`timescale 1ns / 1ps

module tb_REG32_LD_CL_INC_DEC;
    reg CL, clk, LD, INC, DEC, C0, E0;
    reg [31:0] I;
    wire C32, E32;
    wire [31:0] A;
    integer errors = 0;

    REG32_LD_CL_INC_DEC uut (
        .CL(CL), .clk(clk), .LD(LD), .INC(INC), .DEC(DEC),
        .C0(C0), .E0(E0), .I(I), .C32(C32), .E32(E32), .A(A)
    );

    always #5 clk = ~clk;

    task step_and_check(
        input t_LD, input t_CL, input t_INC, input t_DEC,
        input t_C0, input t_E0, input [31:0] t_I,
        input exp_C32_before_clk, input exp_E32_before_clk,
        input [31:0] exp_A_after_clk,
        input [255:0] desc
    );
        begin
            // 1. Postavi ulazne signale
            LD = t_LD; CL = t_CL; INC = t_INC; DEC = t_DEC;
            C0 = t_C0; E0 = t_E0; I = t_I;

            // 2. Proveri kombinatorne prenose PRE taktne ivice
            #2;
            if (C32 !== exp_C32_before_clk || E32 !== exp_E32_before_clk) begin
                errors = errors + 1;
                $display("%0dns | ERR Prenos | Dobijeno: C32=%b E32=%b | Ocekivano: C32=%b E32=%b | %s", 
                         $time, C32, E32, exp_C32_before_clk, exp_E32_before_clk, desc);
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
                $display("%0dns | OK  | A=%h C32=%b E32=%b | %s", $time, A, C32, E32, desc);
            end
        end
    endtask

    initial begin
        clk = 0; CL = 0; LD = 0; INC = 0; DEC = 0; C0 = 0; E0 = 0; I = 0;
        #12;

        $display("\n=== REAL TEST: REG32 ===");

        // Upis, cuvanje i brisanje
        step_and_check(1,0,0,0, 0,0, 32'h12345678, 0,0, 32'h12345678, "Load 32'h12345678");
        step_and_check(0,0,0,0, 0,0, 32'h00000000, 0,0, 32'h12345678, "Hold");
        step_and_check(0,1,0,0, 0,0, 32'h00000000, 0,0, 32'h00000000, "Clear");

        // Inkrement preko 16-bitne granice
        step_and_check(1,0,0,0, 0,0, 32'h0000FFFF, 0,0, 32'h0000FFFF, "Load 32'h0000FFFF");
        step_and_check(0,0,1,0, 1,0, 32'h00000000, 0,0, 32'h00010000, "INC preko sredine: 0000FFFF -> 00010000");

        // Overflow prenos (FFFFFFFF + INC=1 generise C32=1 pre takta, pa prelazi na 00000000)
        step_and_check(1,0,0,0, 0,0, 32'hFFFFFFFF, 0,0, 32'hFFFFFFFF, "Load 32'hFFFFFFFF");
        step_and_check(0,0,1,0, 1,0, 32'h00000000, 1,0, 32'h00000000, "Overflow: C32=1 tokom FFFFFFFF+INC, prelaz u 00000000");
        step_and_check(0,0,1,0, 1,0, 32'h00000000, 0,0, 32'h00000001, "Sledeci INC: 0 -> 1");

        // Underflow pozajmica (00000000 + DEC=1 generise E32=1 pre takta, pa prelazi na FFFFFFFF)
        step_and_check(0,1,0,0, 0,0, 32'h00000000, 0,0, 32'h00000000, "Clear na 00000000");
        step_and_check(0,0,0,1, 0,1, 32'h00000000, 0,1, 32'hFFFFFFFF, "Underflow: E32=1 tokom 00000000+DEC, prelaz u FFFFFFFF");

        // Prioriteti
        step_and_check(1,1,1,1, 1,1, 32'hAAAA5555, 0,0, 32'hAAAA5555, "Prioritet: LD najvisi");
        step_and_check(0,1,1,1, 1,1, 32'h00000000, 0,0, 32'h00000000, "Prioritet: CL potiskuje INC/DEC");

        if (errors == 0) $display("=== STATUS REG32: PASS! ===");
        else $display("=== STATUS REG32: FAIL (%0d gresaka) ===", errors);
        $stop;
    end
endmodule