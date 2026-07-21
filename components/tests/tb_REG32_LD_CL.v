`timescale 1ns / 1ps

module tb_REG32_LD_CL;
    reg CL;
    reg clk;
    reg LD;
    reg [31:0] I;
    wire [31:0] A;

    reg [31:0] expected_A;
    integer errors = 0;

    REG32_LD_CL uut (
        .CL(CL),
        .clk(clk),
        .LD(LD),
        .I(I),
        .A(A)
    );

    always #5 clk = ~clk;

    task check_case(input test_CL, input test_LD, input [31:0] test_I, input [31:0] exp_A, input [255:0] desc);
        begin
            CL = test_CL; LD = test_LD; I = test_I; expected_A = exp_A;
            @(posedge clk);
            #1;
            if (A === expected_A) begin
                $display("%0dns\t CL=%b LD=%b I=%u | A=%u | OK  (%s)", $time, CL, LD, I, A, desc);
            end else begin
                errors = errors + 1;
                $display("%0dns\t CL=%b LD=%b I=%u | A=%u | GRESKA! Ocekivano: %u (%s)", 
                         $time, CL, LD, I, A, expected_A, desc);
            end
        end
    endtask

    initial begin
        clk = 0; CL = 0; LD = 0; I = 0;
        #12;

        $display("\n=== POKRETANJE PROVERE ZA REG32_LD_CL ===");
        $display("-----------------------------------------------------------");
        check_case(1'b1, 1'b0, 32'd0,           32'd0,           "Brisanje registra");
        check_case(1'b0, 1'b1, 32'd3000000000,  32'd3000000000,  "Upis velike vrednosti");
        check_case(1'b0, 1'b0, 32'd0,           32'd3000000000,  "Cuvanje vrednosti");
        check_case(1'b1, 1'b1, 32'hFFFF_FFFF,   32'hFFFF_FFFF,   "Prioritet: LD prepisuje CL (upis sve 1)");
        check_case(1'b1, 1'b0, 32'd0,           32'd0,           "Brisanje");
        $display("-----------------------------------------------------------");
        
        if (errors == 0) $display("=== STATUS: REG32 RADI ISPRAVNO! ===");
        else $display("=== STATUS: Detektovano %d gresaka! ===", errors);
        $stop;
    end
endmodule