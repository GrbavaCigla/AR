`timescale 1ns/1ps
// ============================================================
// Testbench: R-tip instrukcije (opcode 0110011)
// ADD, SUB, AND, OR, XOR, SLT, SLTU, SLL, SRL, SRA
//
// Tehnika testiranja:
//   Umesto da program upisujemo u ROM (InstructionMemory), direktno
//   "forsiramo" (force) signal INSTRUCTIONS unutar top-level modula
//   Riscv32i na zeljenu vrednost instrukcije, taman pre ivice takta.
//   Time PC/ROM postaju nebitni za test - testiramo isklјucivo
//   datapath (RegFile + ALU + ALUDecoder + ControlWord).
//
// Provera rezultata:
//   - RESULT/N/Z se citaju odmah (kombinaciona logika ALU-a)
//   - upis u registarski fajl se proverava HIJERARHIJSKI, direktno
//     na interne wire-ove REGFILE modula (OUT0_..OUT31_), jer top
//     modul Riscv32i ne izvodi registre kao izlaze.
// ============================================================

module tb_rtype;

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

    // takt 10ns period
    initial CLK = 0;
    always #5 CLK = ~CLK;

    // ----------------------------------------------------------
    // task: primeni jednu instrukciju (force), sacekaj ivicu takta
    // (upis u regfile se desava na posedge CLK), zatim proveri
    // RESULT (odmah) i ocekivanu vrednost odredisnog registra
    // (posle ivice, hijerarhijski)
    // ----------------------------------------------------------
    task run_instr;
        input [31:0] instr;
        input [511:0] name;
        input [31:0]  expected_result; // ocekivana kombinaciona vrednost RESULT
        begin
            force uut.INSTRUCTIONS = instr;
            #1; // sacekaj da se ALU/kontrola smire
            if (RESULT !== expected_result) begin
                $display("[FAIL] %0s : RESULT = %h, ocekivano %h", name, RESULT, expected_result);
                errors = errors + 1;
            end else begin
                $display("[ OK ] %0s : RESULT = %h", name, RESULT);
            end
            @(posedge CLK);
            #1; // sacekaj da se upis u regfile zavrsi
        end
    endtask

    task check_reg;
        input [4:0]   regnum;
        input [31:0]  expected_val;
        input [511:0] name;
        reg [31:0] actual;
        begin
            case (regnum)
                0:  actual = uut.b2v_inst3.OUT0_;
                1:  actual = uut.b2v_inst3.OUT1_;
                2:  actual = uut.b2v_inst3.OUT2_;
                3:  actual = uut.b2v_inst3.OUT3_;
                4:  actual = uut.b2v_inst3.OUT4_;
                5:  actual = uut.b2v_inst3.OUT5_;
                6:  actual = uut.b2v_inst3.OUT6_;
                10: actual = uut.b2v_inst3.OUT10_;
                11: actual = uut.b2v_inst3.OUT11_;
                12: actual = uut.b2v_inst3.OUT12_;
                13: actual = uut.b2v_inst3.OUT13_;
                14: actual = uut.b2v_inst3.OUT14_;
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
        force uut.INSTRUCTIONS = 32'h00000013; // NOP (ADDI x0,x0,0) tokom reseta
        repeat (3) @(posedge CLK);
        RESET = 0;
        #1;

        $display("================ SETUP (priprema registara) ================");
        // LUI x1, 0x00003  -> x1 = 0x00003000
        run_instr(32'h000030B7, "LUI x1,0x3", 32'h00003000);
        check_reg(1, 32'h00003000, "LUI x1,0x3");

        // LUI x2, 0x00001  -> x2 = 0x00001000
        run_instr(32'h00001137, "LUI x2,0x1", 32'h00001000);
        check_reg(2, 32'h00001000, "LUI x2,0x1");

        // ADDI x6, x0, 13  -> x6 = 13  (koristi se kao pomeraj za SLL/SRL/SRA)
        run_instr(32'h00D00313, "ADDI x6,x0,13", 32'd13);
        check_reg(6, 32'd13, "ADDI x6,x0,13");

        $display("================ R-TIP TESTOVI (x1=0x3000, x2=0x1000, x6=13) ================");

        // ADD x3, x1, x2  -> 0x4000
        run_instr(32'h002081B3, "ADD x3,x1,x2", 32'h00004000);
        check_reg(3, 32'h00004000, "ADD");

        // SUB x3, x1, x2  -> 0x2000
        run_instr(32'h402081B3, "SUB x3,x1,x2", 32'h00002000);
        check_reg(3, 32'h00002000, "SUB");

        // AND x3, x1, x2  -> 0x1000
        run_instr(32'h0020F1B3, "AND x3,x1,x2", 32'h00001000);
        check_reg(3, 32'h00001000, "AND");

        // OR x3, x1, x2   -> 0x3000
        run_instr(32'h0020E1B3, "OR x3,x1,x2", 32'h00003000);
        check_reg(3, 32'h00003000, "OR");

        // XOR x3, x1, x2  -> 0x2000
        run_instr(32'h0020C1B3, "XOR x3,x1,x2", 32'h00002000);
        check_reg(3, 32'h00002000, "XOR");

        // SLT x3, x1, x2  (12288 < 4096 ? ne) -> 0
        run_instr(32'h0020A1B3, "SLT x3,x1,x2", 32'h00000000);
        check_reg(3, 32'h00000000, "SLT (pozitivno<pozitivno, false)");

        // SLTU x3, x1, x2 -> 0
        run_instr(32'h0020B1B3, "SLTU x3,x1,x2", 32'h00000000);
        check_reg(3, 32'h00000000, "SLTU (pozitivno<pozitivno, false)");

        // SLL x3, x1, x6  -> 0x3000 << 13 = 0x06000000
        run_instr(32'h006091B3, "SLL x3,x1,x6", 32'h06000000);
        check_reg(3, 32'h06000000, "SLL");

        // SRL x3, x1, x6  -> 0x3000 >> 13 = 1
        run_instr(32'h0060D1B3, "SRL x3,x1,x6", 32'h00000001);
        check_reg(3, 32'h00000001, "SRL");

        // SRA x3, x1, x6  -> (pozitivan broj, isto kao SRL) = 1
        run_instr(32'h4060D1B3, "SRA x3,x1,x6", 32'h00000001);
        check_reg(3, 32'h00000001, "SRA (pozitivan operand)");

        $display("================ TEST SA NEGATIVNIM OPERANDOM ================");
        // SUB x4, x0, x1  -> x4 = 0 - 0x3000 = 0xFFFFD000  (-12288)
        run_instr(32'h40100233, "SUB x4,x0,x1 (x4=-x1)", 32'hFFFFD000);
        check_reg(4, 32'hFFFFD000, "SUB (priprema negativnog broja)");

        // SLT x5, x4, x2  (-12288 < 4096 ? da, signed) -> 1
        run_instr(32'h002222B3, "SLT x5,x4,x2 (signed)", 32'h00000001);
        check_reg(5, 32'h00000001, "SLT (negativno < pozitivno, true)");

        // SLTU x5, x4, x2 (0xFFFFD000 < 0x1000 ? unsigned, ne) -> 0
        run_instr(32'h002232B3, "SLTU x5,x4,x2 (unsigned)", 32'h00000000);
        check_reg(5, 32'h00000000, "SLTU (0xFFFFD000 nije < 0x1000 unsigned, false)");

        // SRA x14, x4, x6  -> aritmeticki pomeraj negativnog broja
        // (-12288) >>> 13 = -2 = 0xFFFFFFFE
        run_instr(32'h40625733, "SRA x14,x4,x6 (negativan operand)", 32'hFFFFFFFE);
        check_reg(14, 32'hFFFFFFFE, "SRA (negativan operand, znak se sirio)");

        release uut.INSTRUCTIONS;

        $display("===============================================================");
        if (errors == 0)
            $display("SVI R-TIP TESTOVI PROSLI USPESNO.");
        else
            $display("BROJ NEUSPESNIH PROVERA: %0d", errors);
        $display("===============================================================");

        $stop;
    end

endmodule
