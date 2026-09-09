`timescale 1ns/1ps
// ============================================================
// Testbench: RV32I procesor - kompletan test (bez LB/LBU/LH/LHU)
//
// Podrzane memorijske instrukcije: samo LW i SW (cela rec, 32 bita).
//
// Kljucna razlika u odnosu na prethodnu verziju: instrukcije se ne
// prepisuju rucno kao hex konstante (sto je sklono greskama u
// transkripciji), nego se GENERISU programski preko enc_* funkcija
// koje sastavljaju instrukciju iz polja (rd, rs1, rs2, funct3,
// funct7, imm) tacno po RV32I specifikaciji. Time je test citljiviji
// i lakse ga je prosiriti.
//
// Takodje su ispravljena dva bag-a iz prethodne verzije testa:
//   1) SRA/SRAI testovi su koristili vrednosti registara koje nisu
//      postojale u hardkodiranoj case listi (set_x2/set_x3), pa su
//      x2/x3 ostajali 0. Sada se svaka vrednost registra postavlja
//      programski preko load_imm() - radi za bilo koju 32-bitnu
//      vrednost, nema vise "nepokrivenih" slucajeva.
//   2) AUIPC test je citao RESULT POSLE ivice takta, kada je PC vec
//      odmakao za +4, pa je rezultat bio pogresan za 4. Sada se
//      RESULT cita ODMAH posle primene instrukcije (kombinaciono),
//      pre nego sto se desi sledeca ivica takta - isto kao kod
//      R-tip/I-tip testova.
// ============================================================

module tb_all_instructions_c;

reg CLK;
reg RESET;

wire N;
wire Z;
wire [31:0] RESULT;

integer errors;
integer test_count;

reg [31:0] instruction_drive;


/* ============================================================
   OPCODE / FUNCT KONSTANTE
   ============================================================ */

localparam OPC_R        = 7'b0110011;
localparam OPC_I        = 7'b0010011;
localparam OPC_LOAD     = 7'b0000011;
localparam OPC_STORE    = 7'b0100011;
localparam OPC_BRANCH   = 7'b1100011;
localparam OPC_JAL      = 7'b1101111;
localparam OPC_JALR     = 7'b1100111;
localparam OPC_LUI      = 7'b0110111;
localparam OPC_AUIPC    = 7'b0010111;
localparam OPC_SYSTEM   = 7'b1110011;
localparam OPC_MISCMEM  = 7'b0001111;

localparam F7_NORMAL = 7'b0000000;
localparam F7_ALT    = 7'b0100000; // SUB / SRA / SRAI


/* ============================================================
   DUT
   ============================================================ */

Riscv32i uut (
    .CLK    (CLK),
    .RESET  (RESET),
    .N      (N),
    .Z      (Z),
    .RESULT (RESULT)
);


/* ============================================================
   CLOCK
   ============================================================ */

initial begin
    CLK = 1'b0;
    forever #5 CLK = ~CLK;
end


/* ============================================================
   INSTRUKCIJSKI ENKODERI (RV32I formati)
   ============================================================ */

function [31:0] enc_r;
    input [6:0] funct7;
    input [4:0] rs2;
    input [4:0] rs1;
    input [2:0] funct3;
    input [4:0] rd;
    input [6:0] opcode;
    begin
        enc_r = {funct7, rs2, rs1, funct3, rd, opcode};
    end
endfunction

function [31:0] enc_i;
    input [11:0] imm;
    input [4:0]  rs1;
    input [2:0]  funct3;
    input [4:0]  rd;
    input [6:0]  opcode;
    begin
        enc_i = {imm, rs1, funct3, rd, opcode};
    end
endfunction

function [31:0] enc_s;
    input [11:0] imm;
    input [4:0]  rs2;
    input [4:0]  rs1;
    input [2:0]  funct3;
    input [6:0]  opcode;
    begin
        enc_s = {imm[11:5], rs2, rs1, funct3, imm[4:0], opcode};
    end
endfunction

function [31:0] enc_b;
    input [12:0] imm; // bit0 uvek 0 (polureci poravnanje)
    input [4:0]  rs2;
    input [4:0]  rs1;
    input [2:0]  funct3;
    input [6:0]  opcode;
    begin
        enc_b = {imm[12], imm[10:5], rs2, rs1, funct3, imm[4:1], imm[11], opcode};
    end
endfunction

function [31:0] enc_u;
    input [19:0] imm;
    input [4:0]  rd;
    input [6:0]  opcode;
    begin
        enc_u = {imm, rd, opcode};
    end
endfunction

function [31:0] enc_j;
    input [20:0] imm; // bit0 uvek 0
    input [4:0]  rd;
    input [6:0]  opcode;
    begin
        enc_j = {imm[20], imm[10:1], imm[11], imm[19:12], rd, opcode};
    end
endfunction


/* ============================================================
   OSNOVNI HELPERI
   ============================================================ */

// napreduje takt za jedan ciklus (koristi se posle upisa u regfile
// ili kad samo treba da se pomeri PC)
task tick;
begin
    #2;
    @(posedge CLK);
    #2;
end
endtask

// primeni instrukciju i odmah pomeri takt (bez provere RESULT-a) -
// koristi se za "pripremne" instrukcije (npr. LUI/ADDI kod load_imm)
task apply_only;
    input [31:0] instr;
    begin
        instruction_drive = instr;
        tick;
    end
endtask

// primeni instrukciju, PROVERI RESULT ODMAH (kombinaciono, pre nego
// sto ivica takta pomeri PC), zatim pomeri takt da se upis zavrsi
task apply_and_check;
    input [31:0] instr;
    input [31:0] expected;
    input [200*8-1:0] name;
    begin
        instruction_drive = instr;
        #1;
        test_count = test_count + 1;
        if (RESULT === expected)
            $display("TEST %0d PASSED: %0s RESULT=%h", test_count, name, RESULT);
        else begin
            $display("TEST %0d FAILED: %0s EXPECTED=%h GOT=%h",
                      test_count, name, expected, RESULT);
            errors = errors + 1;
        end
        tick;
    end
endtask

// primeni instrukciju, pomeri takt, pa TEK ONDA proveri PC (koristi
// se za branch/jump instrukcije, gde PC posle ivice odrazava efekat
// upravo primenjene instrukcije)
task apply_and_check_pc;
    input [31:0] instr;
    input [31:0] expected_pc;
    input [200*8-1:0] name;
    begin
        instruction_drive = instr;
        tick;
        test_count = test_count + 1;
        if (uut.PC === expected_pc)
            $display("TEST %0d PASSED: %0s PC=%h", test_count, name, uut.PC);
        else begin
            $display("TEST %0d FAILED: %0s EXPECTED PC=%h GOT PC=%h",
                      test_count, name, expected_pc, uut.PC);
            errors = errors + 1;
        end
    end
endtask

// postavlja proizvoljnu 32-bitnu vrednost u registar rd, preko
// LUI + ADDI (standardni RISC-V trik, kompenzuje sign-extend ADDI-ja)
task load_imm;
    input [4:0]  rd;
    input [31:0] value;
    reg [19:0] imm20;
    reg [11:0] imm12;
    begin
        imm12 = value[11:0];
        imm20 = value[31:12];
        if (imm12[11])
            imm20 = imm20 + 1'b1; // kompenzacija sign-extend-a ADDI imm-a
        apply_only(enc_u(imm20, rd, OPC_LUI));
        apply_only(enc_i(imm12, rd, 3'b000, rd, OPC_I)); // ADDI rd,rd,imm12
    end
endtask


/* ============================================================
   RESET
   ============================================================ */

task reset_cpu;
begin
    RESET = 1'b1;

    force uut.PC = 32'h00000000;

    instruction_drive = enc_i(12'd0, 5'd0, 3'b000, 5'd0, OPC_I); // NOP
    force uut.INSTRUCTIONS = instruction_drive;

    repeat (3)
        tick;

    #1;
    if (uut.PC !== 32'h00000000) begin
        $display("RESET CHECK FAILED: PC = %h", uut.PC);
        errors = errors + 1;
    end

    RESET = 1'b0;
    #2;
    release uut.PC;
    #2;
end
endtask


/* ============================================================
   R-TIP
   ============================================================ */

task test_rtype;
begin
    // rd=x1, rs1=x2, rs2=x3 (konvencija za sve R-tip testove)

    reset_cpu; load_imm(2, 32'd10); load_imm(3, 32'd3);
    apply_and_check(enc_r(F7_NORMAL, 3, 2, 3'b000, 1, OPC_R), 32'd13, "ADD");

    reset_cpu; load_imm(2, 32'd10); load_imm(3, 32'd3);
    apply_and_check(enc_r(F7_ALT, 3, 2, 3'b000, 1, OPC_R), 32'd7, "SUB");

    reset_cpu; load_imm(2, 32'd10); load_imm(3, 32'd3);
    apply_and_check(enc_r(F7_NORMAL, 3, 2, 3'b001, 1, OPC_R), 32'd80, "SLL");

    reset_cpu; load_imm(2, 32'hFFFFFFF6); load_imm(3, 32'd3);
    apply_and_check(enc_r(F7_NORMAL, 3, 2, 3'b010, 1, OPC_R), 32'h00000001, "SLT signed");

    reset_cpu; load_imm(2, 32'hFFFFFFF6); load_imm(3, 32'd3);
    apply_and_check(enc_r(F7_NORMAL, 3, 2, 3'b011, 1, OPC_R), 32'h00000000, "SLTU unsigned");

    reset_cpu; load_imm(2, 32'd10); load_imm(3, 32'd3);
    apply_and_check(enc_r(F7_NORMAL, 3, 2, 3'b100, 1, OPC_R), 32'd9, "XOR");

    reset_cpu; load_imm(2, 32'd10); load_imm(3, 32'd3);
    apply_and_check(enc_r(F7_NORMAL, 3, 2, 3'b101, 1, OPC_R), 32'd1, "SRL");

    reset_cpu; load_imm(2, 32'hFFFFFFF0); load_imm(3, 32'd2);
    apply_and_check(enc_r(F7_ALT, 3, 2, 3'b101, 1, OPC_R), 32'hFFFFFFFC, "SRA");

    reset_cpu; load_imm(2, 32'd10); load_imm(3, 32'd3);
    apply_and_check(enc_r(F7_NORMAL, 3, 2, 3'b110, 1, OPC_R), 32'd11, "OR");

    reset_cpu; load_imm(2, 32'd10); load_imm(3, 32'd3);
    apply_and_check(enc_r(F7_NORMAL, 3, 2, 3'b111, 1, OPC_R), 32'd2, "AND");
end
endtask


/* ============================================================
   I-TIP
   ============================================================ */

task test_itype;
begin
    // rd=x1, rs1=x2

    reset_cpu; load_imm(2, 32'd10);
    apply_and_check(enc_i(12'd5, 2, 3'b000, 1, OPC_I), 32'd15, "ADDI");

    reset_cpu; load_imm(2, 32'd10);
    apply_and_check(enc_i(12'd11, 2, 3'b010, 1, OPC_I), 32'd1, "SLTI");

    reset_cpu; load_imm(2, 32'd10);
    apply_and_check(enc_i(12'd11, 2, 3'b011, 1, OPC_I), 32'd1, "SLTIU");

    reset_cpu; load_imm(2, 32'd10);
    apply_and_check(enc_i(12'h055, 2, 3'b100, 1, OPC_I), 32'h0000005F, "XORI");

    reset_cpu; load_imm(2, 32'd10);
    apply_and_check(enc_i(12'h055, 2, 3'b110, 1, OPC_I), 32'h0000005F, "ORI");

    reset_cpu; load_imm(2, 32'd10);
    apply_and_check(enc_i(12'h0FF, 2, 3'b111, 1, OPC_I), 32'h0000000A, "ANDI");

    // SLLI/SRLI/SRAI: imm[11:5]=funct7 deo (F7_NORMAL/F7_ALT), imm[4:0]=shamt
    reset_cpu; load_imm(2, 32'd10);
    apply_and_check(enc_i({F7_NORMAL, 5'd2}, 2, 3'b001, 1, OPC_I), 32'd40, "SLLI");

    reset_cpu; load_imm(2, 32'd10);
    apply_and_check(enc_i({F7_NORMAL, 5'd1}, 2, 3'b101, 1, OPC_I), 32'd5, "SRLI");

    reset_cpu; load_imm(2, 32'hFFFFFFF0);
    apply_and_check(enc_i({F7_ALT, 5'd1}, 2, 3'b101, 1, OPC_I), 32'hFFFFFFF8, "SRAI");
end
endtask


/* ============================================================
   U-TIP
   ============================================================ */

task test_utype;
begin
    reset_cpu;
    apply_and_check(enc_u(20'h12345, 1, OPC_LUI), 32'h12345000, "LUI");

    // AUIPC: PC je 0 odmah posle reseta (nema pripremnih instrukcija
    // pre ove), RESULT se cita PRE ivice takta, pa se PC jos nije
    // pomerio - zato je ocekivano tacno PC(0) + (imm<<12).
    reset_cpu;
    apply_and_check(enc_u(20'h12345, 1, OPC_AUIPC), 32'h12345000, "AUIPC");
end
endtask


/* ============================================================
   BRANCH
   ============================================================ */

task branch_test;
    input [2:0]  funct3;
    input [31:0] x2_value;
    input [31:0] x3_value;
    input        taken; // 1 = ocekuje se skok, 0 = ne
    input [200*8-1:0] name;
    reg [31:0] base_pc;
    reg [31:0] expected_pc;
    begin
        reset_cpu;
        load_imm(2, x2_value);
        load_imm(3, x3_value);
        // procitaj STVARNI PC neposredno pre branch instrukcije umesto
        // da se pretpostavlja fiksna vrednost (load_imm trosi 2
        // instrukcije po pozivu registra, pa broj setup instrukcija
        // zavisi od toga koliko puta je load_imm pozvan)
        base_pc = uut.PC;
        if (taken)
            expected_pc = base_pc + 32'd8;  // pomeraj instrukcije je +8
        else
            expected_pc = base_pc + 32'd4;  // sledeca instrukcija (PC+4)
        apply_and_check_pc(enc_b(13'd8, 3, 2, funct3, OPC_BRANCH), expected_pc, name);
    end
endtask

task test_branches;
begin
    branch_test(3'b000, 32'd5,        32'd5,        1'b1, "BEQ taken");
    branch_test(3'b000, 32'd5,        32'd3,        1'b0, "BEQ not taken");

    branch_test(3'b001, 32'd5,        32'd3,        1'b1, "BNE taken");
    branch_test(3'b001, 32'd5,        32'd5,        1'b0, "BNE not taken");

    branch_test(3'b100, 32'hFFFFFFF6, 32'd3,        1'b1, "BLT taken");
    branch_test(3'b100, 32'd10,       32'd3,        1'b0, "BLT not taken");

    branch_test(3'b101, 32'd10,       32'd3,        1'b1, "BGE taken");
    branch_test(3'b101, 32'hFFFFFFF6, 32'd3,        1'b0, "BGE not taken");

    branch_test(3'b110, 32'd3,        32'd10,       1'b1, "BLTU taken");
    branch_test(3'b110, 32'd10,       32'd3,        1'b0, "BLTU not taken");

    branch_test(3'b111, 32'd10,       32'd3,        1'b1, "BGEU taken");
    branch_test(3'b111, 32'd3,        32'd10,       1'b0, "BGEU not taken");
end
endtask


/* ============================================================
   JAL
   ============================================================ */

task test_jal;
    reg [31:0] base_pc;
begin
    reset_cpu;
    load_imm(2, 32'd10);
    load_imm(3, 32'd3);

    base_pc = uut.PC; // stvarni PC pre JAL instrukcije

    // JAL x1, +8  (target = base_pc+8, link = base_pc+4)
    apply_and_check_pc(enc_j(21'd8, 1, OPC_JAL), base_pc + 32'd8, "JAL target");

    // procitaj link vrednost preko ADDI x2,x1,0
    apply_and_check(enc_i(12'd0, 1, 3'b000, 2, OPC_I), base_pc + 32'd4, "JAL link PC+4");
end
endtask


/* ============================================================
   JALR
   ============================================================ */

task test_jalr;
    reg [31:0] base_pc;
begin
    reset_cpu;
    load_imm(2, 32'd17); // x2 = 17 (bit0=1, treba da se obrise u target-u)
    load_imm(3, 32'd3);

    base_pc = uut.PC; // stvarni PC pre JALR instrukcije

    // JALR x1, x2, 0  -> target = (17+0) & ~1 = 16 (ne zavisi od PC-a),
    // link = base_pc + 4
    apply_and_check_pc(enc_i(12'd0, 2, 3'b000, 1, OPC_JALR), 32'd16,
                        "JALR target and bit0 clear");

    apply_and_check(enc_i(12'd0, 1, 3'b000, 2, OPC_I), base_pc + 32'd4, "JALR link PC+4");
end
endtask


/* ============================================================
   MEMORIJA (samo LW / SW - cela rec)
   ============================================================ */

task test_memory;
begin
    reset_cpu;
    load_imm(2, 32'h00000100); // x2 = adresa
    load_imm(3, 32'd10);       // x3 = vrednost za upis

    // SW x3, 0(x2)
    apply_only(enc_s(12'd0, 3, 2, 3'b010, OPC_STORE));

    // LW x1, 0(x2)
    apply_only(enc_i(12'd0, 2, 3'b010, 1, OPC_LOAD));

    // procitaj ucitanu vrednost preko ADDI x4,x1,0
    apply_and_check(enc_i(12'd0, 1, 3'b000, 4, OPC_I), 32'd10, "SW/LW (cela rec)");
end
endtask


/* ============================================================
   FENCE / SYSTEM (tretiraju se kao NOP)
   ============================================================ */

task test_nop_like;
begin
    reset_cpu;
    apply_and_check_pc(enc_i(12'd0, 0, 3'b000, 0, OPC_MISCMEM), 32'd4, "FENCE as NOP");

    reset_cpu;
    apply_and_check_pc(enc_i(12'd0, 0, 3'b000, 0, OPC_SYSTEM), 32'd4, "ECALL as NOP");

    reset_cpu;
    apply_and_check_pc(enc_i(12'd1, 0, 3'b000, 0, OPC_SYSTEM), 32'd4, "EBREAK as NOP");
end
endtask


/* ============================================================
   MAIN
   ============================================================ */

initial begin
    errors = 0;
    test_count = 0;
    RESET = 1'b0;

    instruction_drive = enc_i(12'd0, 5'd0, 3'b000, 5'd0, OPC_I);
    force uut.INSTRUCTIONS = instruction_drive;

    #20;

    $display("");
    $display("==============================================");
    $display("        RV32I PROCESSOR TEST START (v2)");
    $display("        (bez LB/LBU/LH/LHU - samo LW/SW)");
    $display("==============================================");
    $display("");

    test_rtype;
    test_itype;
    test_utype;
    test_branches;
    test_jal;
    test_jalr;
    test_memory;
    test_nop_like;

    $display("");
    $display("==============================================");

    if (errors == 0) begin
        $display("PASSED");
        $display("ALL TESTS PASSED");
    end
    else begin
        $display("FAILED");
        $display("%0d TEST(S) FAILED", errors);
    end

    $display("==============================================");
    $display("");

    $finish;
end

endmodule
