`timescale 1ns / 1ps

module tb_REG8_LD_CL_INC_DEC_SL_SR;
    reg CL, clk, LD, INC, DEC, C0, E0, SL, IL, SR, IR;
    reg [7:0] I;
    wire E8, C8;
    wire [7:0] A;
    integer errors = 0;

    REG8_LD_CL_INC_DEC_SL_SR uut (
        .CL(CL), .clk(clk), .LD(LD), .INC(INC), .DEC(DEC),
        .C0(C0), .E0(E0), .SL(SL), .IL(IL), .SR(SR), .IR(IR),
        .I(I), .E8(E8), .C8(C8), .A(A)
    );

    always #5 clk = ~clk;

    task step_and_check(
        input t_LD, input t_CL, input t_INC, input t_DEC,
        input t_SL, input t_IL, input t_SR, input t_IR,
        input t_C0, input t_E0, input [7:0] t_I,
        input exp_C8, input exp_E8, input [7:0] exp_A,
        input [255:0] desc
    );
        begin
            LD = t_LD; CL = t_CL; INC = t_INC; DEC = t_DEC;
            SL = t_SL; IL = t_IL; SR = t_SR; IR = t_IR;
            C0 = t_C0; E0 = t_E0; I = t_I;

            #2; // Provera kombinatornog prenosa PRE takta
            if (C8 !== exp_C8 || E8 !== exp_E8) begin
                errors = errors + 1;
                $display("%0dns | ERR Prenos | Dobijeno: C8=%b E8=%b | Ocekivano: C8=%b E8=%b | %s", 
                         $time, C8, E8, exp_C8, exp_E8, desc);
            end

            @(posedge clk);
            #1; // Provera stanja registra POSLE takta

            if (A !== exp_A) begin
                errors = errors + 1;
                $display("%0dns | ERR Registar | Dobijeno: A=%h | Ocekivano: A=%h | %s", 
                         $time, A, exp_A, desc);
            end else begin
                $display("%0dns | OK  | A=%h C8=%b E8=%b | %s", $time, A, C8, E8, desc);
            end
        end
    endtask

    initial begin
        clk = 0; CL = 0; LD = 0; INC = 0; DEC = 0;
        SL = 0; IL = 0; SR = 0; IR = 0; C0 = 0; E0 = 0; I = 0;
        #12;

        $display("\n=== FULL TEST: REG8 (LD > CL > INC > DEC > SL > SR) ===");

        // OSNOVNE OPERACIJE (Load, Hold, Clear)
        step_and_check(1, 0, 0, 0, 0,0, 0,0, 0,0, 8'hA5, 0, 0, 8'hA5, "Load 8'hA5");
        step_and_check(0, 0, 0, 0, 0,0, 0,0, 0,0, 8'h00, 0, 0, 8'hA5, "Hold 8'hA5");
        step_and_check(0, 1, 0, 0, 0,0, 0,0, 0,0, 8'h00, 0, 0, 8'h00, "Clear -> 8'h00");

        // SHIFT LEFT (SL)
        step_and_check(1, 0, 0, 0, 0,0, 0,0, 0,0, 8'h55, 0, 0, 8'h55, "Load 8'h55 (01010101)");
        step_and_check(0, 0, 0, 0, 1,1, 0,0, 0,0, 8'h00, 0, 0, 8'hAB, "Shift Left sa IL=1 (55 -> AB)");

        // SHIFT RIGHT (SR)
        step_and_check(0, 0, 0, 0, 0,0, 1,1, 0,0, 8'h00, 0, 0, 8'hD5, "Shift Right sa IR=1 (AB -> D5)");

        // INC I OVERFLOW (C8)
        step_and_check(1, 0, 0, 0, 0,0, 0,0, 0,0, 8'hFF, 0, 0, 8'hFF, "Load 8'hFF");
        step_and_check(0, 0, 1, 0, 0,0, 0,0, 1,0, 8'h00, 1, 0, 8'h00, "INC: FF -> 00 (C8=1 pre takta)");

        // DEC I UNDERFLOW (E8)
        step_and_check(0, 0, 0, 1, 0,0, 0,0, 0,1, 8'h00, 0, 1, 8'hFF, "DEC: 00 -> FF (E8=1 pre takta)");

        // TEST PRIORITETA
        step_and_check(1, 1, 1, 1, 1,1, 1,1, 1,1, 8'h33, 0, 0, 8'h33, "Prioritet: LD potiskuje SVE ostale za registar A");
        step_and_check(0, 1, 1, 1, 1,1, 1,1, 1,1, 8'h00, 0, 0, 8'h00, "Prioritet: CL potiskuje INC/DEC/SL/SR i blokira prenose (C8=0, E8=0)");
        step_and_check(0, 0, 1, 1, 1,1, 1,1, 1,0, 8'h00, 0, 0, 8'h01, "Prioritet: INC potiskuje DEC/SL/SR");
        step_and_check(0, 0, 0, 1, 1,1, 1,1, 0,1, 8'h00, 0, 0, 8'h00, "Prioritet: DEC potiskuje SL/SR");
        step_and_check(0, 0, 0, 0, 1,1, 1,0, 0,0, 8'h00, 0, 0, 8'h01, "Prioritet: SL potiskuje SR");

        if (errors == 0) $display("=== STATUS REG8: PASS! ===");
        else $display("=== STATUS REG8: FAIL (%0d gresaka) ===", errors);
        $stop;
    end
endmodule