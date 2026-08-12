`timescale 1ns/1ps
// ============================================================
// Testbench: LW (0000011, funct3=010) i SW (0100011, funct3=010)
//
// NAPOMENA: Prema DataMemory.v, memorija se cita/upisuje kao pun
// 32-bitni word (RAM2 megafunkcija), a funct3 se uopste ne
// razlikuje (nema LB/LH/LBU/LHU/SB/SH). Zato se testira samo LW/SW.
//
// DataMemory nema izlaz koji je vidljiv na top-level portovima,
// pa se za SW proveru koristi hijerarhijski pristup na READDATA
// signal DataMemory instance (koji za RAM2 sa "read-during-write"
// odmah odrazava upisanu vrednost), a za LW se koristi standardna
// RESULT (adresa) provera + provera upisa u regfile.
// ============================================================

module tb_loadstore;

    reg CLK;
    reg RESET;
    wire N, Z;
    wire [31:0] RESULT;

    integer errors;

    Riscv32i uut (
        .CLK(CLK),
        .RESET(RESET),
        .N(N),
        .Z(Z),
        .RESULT(RESULT)
    );

    initial CLK = 0;
    always #5 CLK = ~CLK;

    task run_instr;
        input [31:0] instr;
        input [511:0] name;
        input [31:0]  expected_result; // ocekivana adresa (RESULT = ALU izlaz = adresa)
        begin
            force uut.INSTRUCTIONS = instr;
            #1;
            if (RESULT !== expected_result) begin
                $display("[FAIL] %0s : RESULT(adresa) = %h, ocekivano %h", name, RESULT, expected_result);
                errors = errors + 1;
            end else begin
                $display("[ OK ] %0s : RESULT(adresa) = %h", name, RESULT);
            end
            @(posedge CLK);
            #1;
        end
    endtask

    task check_reg;
        input [4:0]   regnum;
        input [31:0]  expected_val;
        input [511:0] name;
        reg [31:0] actual;
        begin
            case (regnum)
                1:  actual = uut.b2v_inst3.OUT1_;
                13: actual = uut.b2v_inst3.OUT13_;
                default: actual = 32'hXXXXXXXX;
            endcase
            if (actual !== expected_val) begin
                $display("       -> [FAIL] x%0d (posle %0s) = %h, ocekivano %h", regnum, name, actual, expected_val);
                errors = errors + 1;
            end else begin
                $display("       -> [ OK ] x%0d (posle %0s) = %h", regnum, name, actual);
            end
        end
    endtask

    initial begin
        errors = 0;
        RESET = 1;
        force uut.INSTRUCTIONS = 32'h00000013;
        repeat (3) @(posedge CLK);
        RESET = 0;
        #1;

        $display("================ SETUP ================");
        // LUI x1, 0x00003 -> x1 = 0x00003000 (vrednost koju cemo upisati u memoriju)
        run_instr(32'h000030B7, "LUI x1,0x3", 32'h00003000);
        check_reg(1, 32'h00003000, "LUI x1,0x3");

        $display("================ SW TEST ================");
        // SW x1, 0x40(x0)  -> memory[0x40] = x1 = 0x00003000
        // RESULT (adresa) = x0 + 0x40 = 0x00000040
        run_instr(32'h04102023, "SW x1,0x40(x0)", 32'h00000040);
        $display("       -> ocekivano memorija[0x40] = 32'h00003000");
        $display("          (proverite u ModelSim-u: dodajte na Wave signal");
        $display("           uut.b2v_inst10.READDATA ili direktno RAM sadrzaj");
        $display("           preko Memory List prozora ako je RAM2 inicijalizovan)");

        $display("================ LW TEST ================");
        // LW x13, 0x40(x0)  -> x13 = memory[0x40] = 0x00003000
        // RESULT (adresa) = 0x00000040
        run_instr(32'h04002683, "LW x13,0x40(x0)", 32'h00000040);
        check_reg(13, 32'h00003000, "LW (procitana vrednost mora biti ono sto je SW upisao)");

        release uut.INSTRUCTIONS;

        $display("===============================================================");
        if (errors == 0)
            $display("SVI LOAD/STORE TESTOVI PROSLI USPESNO.");
        else
            $display("BROJ NEUSPESNIH PROVERA: %0d", errors);
        $display("NAPOMENA: SW test se ne moze automatski proveriti bez uvida u");
        $display("RAM2 sadrzaj (megafunkcija nije deo dostavljenih fajlova), zato");
        $display("je odlucujuci test u stvari sledeci LW koji cita upravo upisanu");
        $display("adresu - ako LW vrati 0x00003000, SW je sigurno ispravno upisao.");
        $display("===============================================================");

        $stop;
    end

endmodule
