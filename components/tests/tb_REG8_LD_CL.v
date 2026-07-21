`timescale 1ns / 1ps

module tb_REG8_LD_CL;
    reg CL;
    reg clk;
    reg LD;
    reg [7:0] I;
    wire [7:0] A;

    reg [7:0] expected_A;
    integer errors = 0;

    REG8_LD_CL uut (
        .CL(CL),
        .clk(clk),
        .LD(LD),
        .I(I),
        .A(A)
    );

    always #5 clk = ~clk;

    task check_case(input test_CL, input test_LD, input [7:0] test_I, input [7:0] exp_A, input [255:0] desc);
        begin
            CL = test_CL; LD = test_LD; I = test_I; expected_A = exp_A;
            @(posedge clk);
            #1;
            if (A === expected_A) begin
                $display("%0dns\t CL=%b LD=%b I=%d | A=%d | OK  (%s)", $time, CL, LD, I, A, desc);
            end else begin
                errors = errors + 1;
                $display("%0dns\t CL=%b LD=%b I=%d | A=%d | GRESKA! Ocekivano: %d (%s)", 
                         $time, CL, LD, I, A, expected_A, desc);
            end
        end
    endtask

    initial begin
        clk = 0; CL = 0; LD = 0; I = 0;
        #12;

        $display("\n=== POKRETANJE PROVERE ZA REG8_LD_CL ===");
        $display("-----------------------------------------------------------");
        check_case(1'b1, 1'b0, 8'd255, 8'd0,   "Brisanje registra");
        check_case(1'b0, 1'b1, 8'd155, 8'd155, "Upis vrednosti 155");
        check_case(1'b0, 1'b0, 8'd0,   8'd155, "Cuvanje vrednosti");
        check_case(1'b1, 1'b1, 8'd88,  8'd88,  "Prioritet: LD prepisuje CL (upis 88)");
        check_case(1'b1, 1'b0, 8'd0,   8'd0,   "Brisanje kada nema LD-a");
        $display("-----------------------------------------------------------");
        
        if (errors == 0) $display("=== STATUS: REG8 RADI ISPRAVNO! ===");
        else $display("=== STATUS: Detektovano %d gresaka! ===", errors);
        $stop;
    end
endmodule