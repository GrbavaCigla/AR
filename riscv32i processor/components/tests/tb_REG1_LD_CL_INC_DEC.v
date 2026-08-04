`timescale 1ns / 1ps

module tb_REG1_LD_CL_INC_DEC;
    reg CL, clk, LD, INC, DEC, Ci, Ei, I;
    wire A, Ci_1, Ei_1;
    integer errors = 0;

    REG1_LD_CL_INC_DEC uut (
        .CL(CL), .clk(clk), .LD(LD), .I(I),
        .Ci(Ci), .Ei(Ei), .INC(INC), .DEC(DEC),
        .A(A), .Ci_1(Ci_1), .Ei_1(Ei_1)
    );

    always #5 clk = ~clk;

    task check_step(
        input t_LD, input t_CL, input t_INC, input t_DEC,
        input t_I, input t_Ci, input t_Ei,
        input exp_A, input exp_Ci1, input exp_Ei1,
        input [255:0] desc
    );
        begin
            // Postavljanje ulaza
            LD = t_LD; CL = t_CL; INC = t_INC; DEC = t_DEC;
            I = t_I; Ci = t_Ci; Ei = t_Ei;
            
            // Cekamo malo da se kombinatorne mreze Ci_1 i Ei_1 smire PRE kloka
            #2;
            
            // Ocitavamo kombinatorne izlaze pre kloka
            if (Ci_1 !== exp_Ci1 || Ei_1 !== exp_Ei1) begin
                errors = errors + 1;
                $display("%0dns | ERR Kombinatorika | Dobijeno: Ci_1=%b Ei_1=%b | Ocekivano: Ci_1=%b Ei_1=%b | %s", 
                         $time, Ci_1, Ei_1, exp_Ci1, exp_Ei1, desc);
            end

            // Okidamo klok za upis u flip-flop A
            @(posedge clk);
            #1;

            if (A === exp_A) begin
                $display("%0dns | OK  | A=%b Ci_1=%b Ei_1=%b | %s", $time, A, Ci_1, Ei_1, desc);
            end else begin
                errors = errors + 1;
                $display("%0dns | ERR Stanje A | Dobijeno: A=%b | Ocekivano: A=%b | %s", 
                         $time, A, exp_A, desc);
            end
        end
    endtask

    initial begin
        clk = 0; CL = 0; LD = 0; INC = 0; DEC = 0; Ci = 0; Ei = 0; I = 0;
        #12;

        $display("\n=== ISPRAVLJENI TEST ZA REG1 ===");
        
        check_step(1,0,0,0, 1, 0,0, 1, 0,0, "Load 1");
        check_step(0,0,0,0, 0, 0,0, 1, 0,0, "Hold 1");
        check_step(0,1,0,0, 0, 0,0, 0, 0,0, "Clear na 0");

        // INC sa A=0 i Ci=1 -> A postaje 1, nema prenosa (Ci_1=0)
        check_step(0,0,1,0, 0, 1,0, 1, 0,0, "INC sa Ci=1 (0->1)");
        // INC sa A=1 i Ci=1 -> A postaje 0, ima prenosa (Ci_1=1)
        check_step(0,0,1,0, 0, 1,0, 0, 1,0, "INC sa Ci=1 (1->0, Overflow Ci_1=1)");
        check_step(0,0,1,0, 0, 0,0, 0, 0,0, "INC sa Ci=0 (Stanje ostaje 0)");

        // DEC sa A=0 i Ei=1 -> A postaje 1, ima pozajmice (Ei_1=1)
        check_step(0,0,0,1, 0, 0,1, 1, 0,1, "DEC sa Ei=1 (0->1, Underflow Ei_1=1)");
        // DEC sa A=1 i Ei=1 -> A postaje 0, nema pozajmice (Ei_1=0)
        check_step(0,0,0,1, 0, 0,1, 0, 0,0, "DEC sa Ei=1 (1->0)");
        check_step(0,0,0,1, 0, 0,0, 0, 0,0, "DEC sa Ei=0 (Stanje ostaje 0)");

        // Prioriteti
        check_step(1,1,1,1, 1, 1,1, 1, 0,0, "Prioritet: LD protiv svih");
        check_step(0,1,1,1, 0, 1,1, 0, 0,0, "Prioritet: CL protiv INC/DEC");
        check_step(0,0,1,1, 0, 1,1, 1, 0,0, "Prioritet: INC protiv DEC (0+1=1)");

        if (errors == 0) $display("=== STATUS REG1: PASS! ===");
        else $display("=== STATUS REG1: FAIL (%0d gresaka) ===", errors);
        $stop;
    end
endmodule