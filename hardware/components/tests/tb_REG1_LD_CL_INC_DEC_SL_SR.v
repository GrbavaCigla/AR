`timescale 1ns / 1ps

module tb_REG1_LD_CL_INC_DEC_SL_SR;
    reg LD, I, CL, INC, Ci, SL, IL, SR, IR, clk, Ei, DEC;
    wire A, Ci_1, Ei_1;
    integer errors = 0;

    REG1_LD_CL_INC_DEC_SL_SR uut (
        .LD(LD), .I(I), .CL(CL), .INC(INC), .Ci(Ci),
        .SL(SL), .IL(IL), .SR(SR), .IR(IR), .clk(clk),
        .Ei(Ei), .DEC(DEC), .A(A), .Ci_1(Ci_1), .Ei_1(Ei_1)
    );

    always #5 clk = ~clk;

    task step_and_check(
        input t_LD, input t_I, input t_CL, input t_INC, input t_Ci,
        input t_DEC, input t_Ei, input t_SL, input t_IL, input t_SR, input t_IR,
        input exp_Ci_1, input exp_Ei_1, input exp_A,
        input [255:0] desc
    );
        begin
            LD = t_LD; I = t_I; CL = t_CL; INC = t_INC; Ci = t_Ci;
            DEC = t_DEC; Ei = t_Ei; SL = t_SL; IL = t_IL; SR = t_SR; IR = t_IR;

            #2; // Provera kombinatornog prenosa PRE takta
            if (Ci_1 !== exp_Ci_1 || Ei_1 !== exp_Ei_1) begin
                errors = errors + 1;
                $display("%0dns | ERR Prenos | Dobijeno: Ci_1=%b Ei_1=%b | Ocekivano: Ci_1=%b Ei_1=%b | %s", 
                         $time, Ci_1, Ei_1, exp_Ci_1, exp_Ei_1, desc);
            end

            @(posedge clk);
            #1; // Provera stanja registra POSLE takta

            if (A !== exp_A) begin
                errors = errors + 1;
                $display("%0dns | ERR Registar | Dobijeno: A=%b | Ocekivano: A=%b | %s", 
                         $time, A, exp_A, desc);
            end else begin
                $display("%0dns | OK  | A=%b Ci_1=%b Ei_1=%b | %s", $time, A, Ci_1, Ei_1, desc);
            end
        end
    endtask

    initial begin
        clk = 0; LD = 0; I = 0; CL = 0; INC = 0; Ci = 0;
        DEC = 0; Ei = 0; SL = 0; IL = 0; SR = 0; IR = 0;
        #12;

        $display("\n=== FULL TEST: REG1 (LD > CL > INC > DEC > SL > SR) ===");

        // OSNOVNE OPERACIJE
        step_and_check(1, 1, 0, 0,0, 0,0, 0,0, 0,0,  0, 0, 1, "LD 1");
        step_and_check(0, 0, 1, 0,0, 0,0, 0,0, 0,0,  0, 0, 0, "CL (Clear -> 0)");
        
        // SHIFT LEFT i SHIFT RIGHT
        step_and_check(0, 0, 0, 0,0, 0,0, 1,1, 0,0,  0, 0, 1, "SL sa IL=1");
        step_and_check(0, 0, 0, 0,0, 0,0, 0,0, 1,0,  0, 0, 0, "SR sa IR=0");

        // INC i OVERFLOW
        step_and_check(1, 1, 0, 0,0, 0,0, 0,0, 0,0,  0, 0, 1, "LD 1 pre INC testiranja");
        step_and_check(0, 0, 0, 1,1, 0,0, 0,0, 0,0,  1, 0, 0, "INC: 1 + Ci=1 -> A=0, Ci_1=1");

        // DEC i UNDERFLOW
        step_and_check(0, 0, 0, 0,0, 1,1, 0,0, 0,0,  0, 1, 1, "DEC: 0 - Ei=1 -> A=1, Ei_1=1");

        // TEST PRIORITETA
        step_and_check(1, 1, 1, 1,1, 1,1, 1,1, 1,1,  0, 0, 1, "Prioritet: LD nadvladava SVE za upis u A");
        step_and_check(0, 1, 1, 1,1, 1,1, 1,1, 1,1,  0, 0, 0, "Prioritet: CL potiskuje INC/DEC/SL/SR i blokira prenos (Ci_1=0)");
        
        // SL potiskuje SR
        step_and_check(0, 0, 0, 0,0, 0,0, 1,1, 1,0,  0, 0, 1, "Prioritet: SL (IL=1) potiskuje SR (IR=0)");

        if (errors == 0) $display("=== STATUS REG1: PASS! ===");
        else $display("=== STATUS REG1: FAIL (%0d gresaka) ===", errors);
        $stop;
    end
endmodule