`timescale 1ns / 1ps

module tb_REG8_LD_CL_INC_DEC;
    reg CL, clk, LD, INC, DEC, C0, E0;
    reg [7:0] I;
    wire E8, C8;
    wire [7:0] A;
    integer errors = 0;

    REG8_LD_CL_INC_DEC uut (
        .CL(CL), .clk(clk), .LD(LD), .INC(INC), .DEC(DEC),
        .C0(C0), .E0(E0), .I(I), .E8(E8), .C8(C8), .A(A)
    );

    always #5 clk = ~clk;

    task check_step(
        input t_LD, input t_CL, input t_INC, input t_DEC,
        input t_C0, input t_E0, input [7:0] t_I,
        input [7:0] exp_A, input exp_C8, input exp_E8,
        input [255:0] desc
    );
        begin
            LD = t_LD; CL = t_CL; INC = t_INC; DEC = t_DEC;
            C0 = t_C0; E0 = t_E0; I = t_I;
            
            @(posedge clk);
            #1; // M Mala pauza da se stabilizuju izlazi posle takta

            if (A === exp_A && C8 === exp_C8 && E8 === exp_E8) begin
                $display("%0dns | OK  | A=%h C8=%b E8=%b | %s", $time, A, C8, E8, desc);
            end else begin
                errors = errors + 1;
                $display("%0dns | ERR | Dobijeno: A=%h C8=%b E8=%b | Ocekivano: A=%h C8=%b E8=%b | %s", 
                         $time, A, C8, E8, exp_A, exp_C8, exp_E8, desc);
            end
        end
    endtask

    initial begin
        clk = 0; CL = 0; LD = 0; INC = 0; DEC = 0; C0 = 0; E0 = 0; I = 0;
        #12;

        $display("\n=== FULL TEST: REG8 ===");

        // Upis i brisanje
        check_step(1,0,0,0, 0,0, 8'h5A, 8'h5A, 0,0, "Load 8'h5A");
        check_step(0,0,0,0, 0,0, 8'h00, 8'h5A, 0,0, "Hold 8'h5A");
        check_step(0,1,0,0, 0,0, 8'h00, 8'h00, 0,0, "Clear 8'h00");

        // Sekvencijalni Inkrement i Overflow
        check_step(1,0,0,0, 0,0, 8'hFD, 8'hFD, 0,0, "Load 8'hFD");
        check_step(0,0,1,0, 1,0, 8'h00, 8'hFE, 0,0, "INC 1: FD -> FE");
        check_step(0,0,1,0, 1,0, 8'h00, 8'hFF, 1,0, "INC 2: FE -> FF (Na FF i INC=1 nastaje C8=1)");
        check_step(0,0,1,0, 1,0, 8'h00, 8'h00, 0,0, "INC 3: FF -> 00 (Prelazak u 0, C8 pada na 0)");
        check_step(0,0,1,0, 1,0, 8'h00, 8'h01, 0,0, "INC 4: 00 -> 01");

        // Sekvencijalni Dekrement i Underflow
        check_step(0,0,0,1, 0,1, 8'h00, 8'h00, 0,1, "DEC 1: 01 -> 00 (Na 00 i DEC=1 nastaje E8=1)");
        check_step(0,0,0,1, 0,1, 8'h00, 8'hFF, 0,0, "DEC 2: 00 -> FF (Prelazak u FF, E8 pada na 0)");
        check_step(0,0,0,1, 0,1, 8'h00, 8'hFE, 0,0, "DEC 3: FF -> FE");

        // Inhibit test (INC/DEC sa C0/E0 = 0)
        check_step(0,0,1,0, 0,0, 8'h00, 8'hFE, 0,0, "INC kad je C0=0 (Bez promene)");
        check_step(0,0,0,1, 0,0, 8'h00, 8'hFE, 0,0, "DEC kad je E0=0 (Bez promene)");

        // Prioriteti
        check_step(1,1,1,1, 1,1, 8'h33, 8'h33, 0,0, "LD najvisi prioritet");
        check_step(0,1,1,1, 1,1, 8'h00, 8'h00, 0,0, "CL potiskuje INC/DEC");

        if (errors == 0) $display("=== STATUS REG8: PASS! ===");
        else $display("=== STATUS REG8: FAIL (%0d gresaka) ===", errors);
        $stop;
    end
endmodule