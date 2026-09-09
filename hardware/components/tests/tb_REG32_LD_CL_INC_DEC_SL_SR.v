`timescale 1ns / 1ps

module tb_REG32_LD_CL_INC_DEC_SL_SR;
    reg CL, clk, LD, INC, DEC, C0, E0, SL, IL, SR, IR;
    reg [31:0] I;
    wire E32, C32;
    wire [31:0] A;
    integer errors = 0;

    REG32_LD_CL_INC_DEC_SL_SR uut (
        .CL(CL), .clk(clk), .LD(LD), .INC(INC), .DEC(DEC),
        .C0(C0), .E0(E0), .SL(SL), .IL(IL), .SR(SR), .IR(IR),
        .I(I), .E32(E32), .C32(C32), .A(A)
    );

    always #5 clk = ~clk;

    task step_and_check(
        input t_LD, input t_CL, input t_INC, input t_DEC,
        input t_SL, input t_IL, input t_SR, input t_IR,
        input t_C0, input t_E0, input [31:0] t_I,
        input exp_C32, input exp_E32, input [31:0] exp_A,
        input [255:0] desc
    );
        begin
            LD = t_LD; CL = t_CL; INC = t_INC; DEC = t_DEC;
            SL = t_SL; IL = t_IL; SR = t_SR; IR = t_IR;
            C0 = t_C0; E0 = t_E0; I = t_I;

            #2; // Provera kombinatornog prenosa PRE takta
            if (C32 !== exp_C32 || E32 !== exp_E32) begin
                errors = errors + 1;
                $display("%0dns | ERR Prenos | Dobijeno: C32=%b E32=%b | Ocekivano: C32=%b E32=%b | %s", 
                         $time, C32, E32, exp_C32, exp_E32, desc);
            end

            @(posedge clk);
            #1; // Provera stanja registra POSLE takta

            if (A !== exp_A) begin
                errors = errors + 1;
                $display("%0dns | ERR Registar | Dobijeno: A=%h | Ocekivano: A=%h | %s", 
                         $time, A, exp_A, desc);
            end else begin
                $display("%0dns | OK  | A=%h C32=%b E32=%b | %s", $time, A, C32, E32, desc);
            end
        end
    endtask

    initial begin
        clk = 0; CL = 0; LD = 0; INC = 0; DEC = 0;
        SL = 0; IL = 0; SR = 0; IR = 0; C0 = 0; E0 = 0; I = 0;
        #12;

        $display("\n=== FULL TEST: REG32 (LD > CL > INC > DEC > SL > SR) ===");

        // OSNOVNE OPERACIJE (Load, Hold, Clear)
        step_and_check(1, 0, 0, 0, 0,0, 0,0, 0,0, 32'hA55AA55A, 0, 0, 32'hA55AA55A, "Load 32'hA55AA55A");
        step_and_check(0, 0, 0, 0, 0,0, 0,0, 0,0, 32'h00000000, 0, 0, 32'hA55AA55A, "Hold 32'hA55AA55A");
        step_and_check(0, 1, 0, 0, 0,0, 0,0, 0,0, 32'h00000000, 0, 0, 32'h00000000, "Clear -> 32'h00000000");

        // SHIFT LEFT (SL)
        step_and_check(1, 0, 0, 0, 0,0, 0,0, 0,0, 32'h55555555, 0, 0, 32'h55555555, "Load 32'h55555555");
		  step_and_check(0, 0, 0, 0, 1,0, 0,0, 0,0, 32'h00000000, 0, 0, 32'hAAAAAAAA, "Shift Left sa IL=0 (55555555 -> AAAAAAAA)");
        //step_and_check(0, 0, 0, 0, 1,1, 0,0, 0,0, 32'h00000000, 0, 0, 32'hAAAAAAAA, "Shift Left sa IL=1 (55555555 -> AAAAAAAA)");

        // SHIFT RIGHT (SR)
        step_and_check(0, 0, 0, 0, 0,0, 1,1, 0,0, 32'h00000000, 0, 0, 32'hD5555555, "Shift Right sa IR=1 (AAAAAAAA -> D5555555)");

        // INC I OVERFLOW (C32)
        step_and_check(1, 0, 0, 0, 0,0, 0,0, 0,0, 32'hFFFFFFFF, 0, 0, 32'hFFFFFFFF, "Load 32'hFFFFFFFF");
        step_and_check(0, 0, 1, 0, 0,0, 0,0, 1,0, 32'h00000000, 1, 0, 32'h00000000, "INC: FFFFFFFF -> 00000000 (C32=1 pre takta)");

        // DEC I UNDERFLOW (E32)
        step_and_check(0, 0, 0, 1, 0,0, 0,0, 0,1, 32'h00000000, 0, 1, 32'hFFFFFFFF, "DEC: 00000000 -> FFFFFFFF (E32=1 pre takta)");

        // TEST PRIORITETA
        step_and_check(1, 1, 1, 1, 1,1, 1,1, 1,1, 32'h33333333, 0, 0, 32'h33333333, "Prioritet: LD potiskuje SVE ostale za registar A");
        step_and_check(0, 1, 1, 1, 1,1, 1,1, 1,1, 32'h00000000, 0, 0, 32'h00000000, "Prioritet: CL potiskuje INC/DEC/SL/SR i blokira prenose (C32=0, E32=0)");
        step_and_check(0, 0, 1, 1, 1,1, 1,1, 1,0, 32'h00000000, 0, 0, 32'h00000001, "Prioritet: INC potiskuje DEC/SL/SR");
        step_and_check(0, 0, 0, 1, 1,1, 1,1, 0,1, 32'h00000000, 0, 0, 32'h00000000, "Prioritet: DEC potiskuje SL/SR");
        step_and_check(0, 0, 0, 0, 1,1, 1,0, 0,0, 32'h00000000, 0, 0, 32'h00000001, "Prioritet: SL potiskuje SR");

        if (errors == 0) $display("=== STATUS REG32: PASS! ===");
        else $display("=== STATUS REG32: FAIL (%0d gresaka) ===", errors);
        $stop;
    end
endmodule