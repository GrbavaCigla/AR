`timescale 1ns / 1ps

module tb_REG16_LD_CL_INC_DEC_SL_SR;
    reg CL, clk, LD, INC, DEC, C0, E0, SL, IL, SR, IR;
    reg [15:0] I;
    wire E16, C16;
    wire [15:0] A;
    integer errors = 0;

    REG16_LD_CL_INC_DEC_SL_SR uut (
        .CL(CL), .clk(clk), .LD(LD), .INC(INC), .DEC(DEC),
        .C0(C0), .E0(E0), .SL(SL), .IL(IL), .SR(SR), .IR(IR),
        .I(I), .E16(E16), .C16(C16), .A(A)
    );

    always #5 clk = ~clk;

    task step_and_check(
        input t_LD, input t_CL, input t_INC, input t_DEC,
        input t_SL, input t_IL, input t_SR, input t_IR,
        input t_C0, input t_E0, input [15:0] t_I,
        input exp_C16, input exp_E16, input [15:0] exp_A,
        input [255:0] desc
    );
        begin
            LD = t_LD; CL = t_CL; INC = t_INC; DEC = t_DEC;
            SL = t_SL; IL = t_IL; SR = t_SR; IR = t_IR;
            C0 = t_C0; E0 = t_E0; I = t_I;

            #2; // Provera kombinatornog prenosa PRE takta
            if (C16 !== exp_C16 || E16 !== exp_E16) begin
                errors = errors + 1;
                $display("%0dns | ERR Prenos | Dobijeno: C16=%b E16=%b | Ocekivano: C16=%b E16=%b | %s", 
                         $time, C16, E16, exp_C16, exp_E16, desc);
            end

            @(posedge clk);
            #1; // Provera stanja registra POSLE takta

            if (A !== exp_A) begin
                errors = errors + 1;
                $display("%0dns | ERR Registar | Dobijeno: A=%h | Ocekivano: A=%h | %s", 
                         $time, A, exp_A, desc);
            end else begin
                $display("%0dns | OK  | A=%h C16=%b E16=%b | %s", $time, A, C16, E16, desc);
            end
        end
    endtask

    initial begin
        clk = 0; CL = 0; LD = 0; INC = 0; DEC = 0;
        SL = 0; IL = 0; SR = 0; IR = 0; C0 = 0; E0 = 0; I = 0;
        #12;

        $display("\n=== FULL TEST: REG16 (LD > CL > INC > DEC > SL > SR) ===");

        // OSNOVNE OPERACIJE (Load, Hold, Clear)
        step_and_check(1, 0, 0, 0, 0,0, 0,0, 0,0, 16'hA55A, 0, 0, 16'hA55A, "Load 16'hA55A");
        step_and_check(0, 0, 0, 0, 0,0, 0,0, 0,0, 16'h0000, 0, 0, 16'hA55A, "Hold 16'hA55A");
        step_and_check(0, 1, 0, 0, 0,0, 0,0, 0,0, 16'h0000, 0, 0, 16'h0000, "Clear -> 16'h0000");

        // SHIFT LEFT (SL)
        step_and_check(1, 0, 0, 0, 0,0, 0,0, 0,0, 16'h5555, 0, 0, 16'h5555, "Load 16'h5555");
        step_and_check(0, 0, 0, 0, 1,0, 0,0, 0,0, 16'h0000, 0, 0, 16'hAAAA, "Shift Left sa IL=0 (5555 -> AAAA)");
        //step_and_check(0, 0, 0, 0, 1,1, 0,0, 0,0, 16'h0000, 0, 0, 16'hAAAA, "Shift Left sa IL=1 (5555 -> AAAA sa prenosom izmedju bajtova)");
		  
		  // SHIFT RIGHT (SR)
        step_and_check(0, 0, 0, 0, 0,0, 1,1, 0,0, 16'h0000, 0, 0, 16'hD555, "Shift Right sa IR=1 (AAAA -> D555 sa prenosom izmedju bajtova)");

        // INC I OVERFLOW (C16)
        step_and_check(1, 0, 0, 0, 0,0, 0,0, 0,0, 16'hFFFF, 0, 0, 16'hFFFF, "Load 16'hFFFF");
        step_and_check(0, 0, 1, 0, 0,0, 0,0, 1,0, 16'h0000, 1, 0, 16'h0000, "INC: FFFF -> 0000 (C16=1 pre takta)");

        // DEC I UNDERFLOW (E16)
        step_and_check(0, 0, 0, 1, 0,0, 0,0, 0,1, 16'h0000, 0, 1, 16'hFFFF, "DEC: 0000 -> FFFF (E16=1 pre takta)");

        // TEST PRIORITETA
        step_and_check(1, 1, 1, 1, 1,1, 1,1, 1,1, 16'h3333, 0, 0, 16'h3333, "Prioritet: LD potiskuje SVE ostale za registar A");
        step_and_check(0, 1, 1, 1, 1,1, 1,1, 1,1, 16'h0000, 0, 0, 16'h0000, "Prioritet: CL potiskuje INC/DEC/SL/SR i blokira prenose (C16=0, E16=0)");
        step_and_check(0, 0, 1, 1, 1,1, 1,1, 1,0, 16'h0000, 0, 0, 16'h0001, "Prioritet: INC potiskuje DEC/SL/SR");
        step_and_check(0, 0, 0, 1, 1,1, 1,1, 0,1, 16'h0000, 0, 0, 16'h0000, "Prioritet: DEC potiskuje SL/SR");
        step_and_check(0, 0, 0, 0, 1,1, 1,0, 0,0, 16'h0000, 0, 0, 16'h0001, "Prioritet: SL potiskuje SR");

        if (errors == 0) $display("=== STATUS REG16: PASS! ===");
        else $display("=== STATUS REG16: FAIL (%0d gresaka) ===", errors);
        $stop;
    end
endmodule