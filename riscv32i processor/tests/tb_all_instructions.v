`timescale 1ns/1ps

module tb_Riscv32i;

reg CLK;
reg RESET;

wire N;
wire Z;
wire [31:0] RESULT;

integer errors;

reg [31:0] instruction_drive;


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
   HELPERS
   ============================================================ */

task tick;
begin
    #2;
    @(posedge CLK);
    #2;
end
endtask


/* ============================================================
   RESET CPU
   ============================================================ */

task reset_cpu;
begin
    RESET = 1'b1;

    force uut.PC = 32'h00000000;

    instruction_drive = 32'h00000013; // ADDI x0,x0,0 = NOP
    force uut.INSTRUCTIONS = instruction_drive;

    repeat (3)
        tick;

    #1;

    if (uut.PC !== 32'h00000000) begin
        $display("TEST RESET FAILED: PC = %h", uut.PC);
        errors = errors + 1;
    end

    RESET = 1'b0;

    #2;

    release uut.PC;

    #2;
end
endtask


/* ============================================================
   CHECK RESULT
   ============================================================ */

task check_result;
input integer number;
input [31:0] expected;
input [200*8-1:0] name;
begin
    if (RESULT === expected)
        $display("TEST %0d PASSED: %0s RESULT=%h", number, name, RESULT);
    else begin
        $display("TEST %0d FAILED: %0s EXPECTED=%h GOT=%h",
                 number, name, expected, RESULT);
        errors = errors + 1;
    end
end
endtask


/* ============================================================
   CHECK PC
   ============================================================ */

task check_pc;
input integer number;
input [31:0] expected;
input [200*8-1:0] name;
begin
    if (uut.PC === expected)
        $display("TEST %0d PASSED: %0s PC=%h", number, name, uut.PC);
    else begin
        $display("TEST %0d FAILED: %0s EXPECTED PC=%h GOT PC=%h",
                 number, name, expected, uut.PC);
        errors = errors + 1;
    end
end
endtask


/* ============================================================
   SET x2
   ============================================================ */

task set_x2;
input [31:0] value;
begin
    case (value)
        32'd0:       instruction_drive = 32'h00000113;
        32'd3:       instruction_drive = 32'h00300113;
        32'd5:       instruction_drive = 32'h00500113;
        32'd10:      instruction_drive = 32'h00A00113;
        32'd16:      instruction_drive = 32'h01000113;
        32'd17:      instruction_drive = 32'h01100113;
        32'd18:      instruction_drive = 32'h01200113;
        32'hFFFFFFF6: instruction_drive = 32'hFF600113;
        default:     instruction_drive = 32'h00000113;
    endcase
    tick;
end
endtask


/* ============================================================
   SET x3
   ============================================================ */

task set_x3;
input [31:0] value;
begin
    case (value)
        32'd0:        instruction_drive = 32'h00000193;
        32'd3:        instruction_drive = 32'h00300193;
        32'd5:        instruction_drive = 32'h00500193;
        32'd10:       instruction_drive = 32'h00A00193;
        32'hFFFFFFF6: instruction_drive = 32'hFF600193;
        32'h00008000: instruction_drive = 32'h000081B7;
        32'hFFFFFF80: instruction_drive = 32'hF8000193;
        default:      instruction_drive = 32'h00000193;
    endcase
    tick;
end
endtask


/* ============================================================
   R-TYPE
   ============================================================ */

task test_rtype;
begin
    reset_cpu;
    set_x2(32'd10);
    set_x3(32'd3);
    instruction_drive = 32'h003100B3; tick;
    check_result(1, 32'd13, "ADD");

    reset_cpu;
    set_x2(32'd10);
    set_x3(32'd3);
    instruction_drive = 32'h403100B3; tick;
    check_result(2, 32'd7, "SUB");

    reset_cpu;
    set_x2(32'd10);
    set_x3(32'd3);
    instruction_drive = 32'h003110B3; tick;
    check_result(3, 32'd80, "SLL");

    reset_cpu;
    set_x2(32'hFFFFFFF6);
    set_x3(32'd3);
    instruction_drive = 32'h003120B3; tick;
    check_result(4, 32'h00000001, "SLT signed");

    reset_cpu;
    set_x2(32'hFFFFFFF6);
    set_x3(32'd3);
    instruction_drive = 32'h003130B3; tick;
    check_result(5, 32'h00000000, "SLTU unsigned");

    reset_cpu;
    set_x2(32'd10);
    set_x3(32'd3);
    instruction_drive = 32'h003140B3; tick;
    check_result(6, 32'd9, "XOR");

    reset_cpu;
    set_x2(32'd10);
    set_x3(32'd3);
    instruction_drive = 32'h003150B3; tick;
    check_result(7, 32'd1, "SRL");

    reset_cpu;
    set_x2(32'hFFFFFFF0);
    set_x3(32'd2);
    instruction_drive = 32'h403150B3; tick;
    check_result(8, 32'hFFFFFFFC, "SRA");

    reset_cpu;
    set_x2(32'd10);
    set_x3(32'd3);
    instruction_drive = 32'h003160B3; tick;
    check_result(9, 32'd11, "OR");

    reset_cpu;
    set_x2(32'd10);
    set_x3(32'd3);
    instruction_drive = 32'h003170B3; tick;
    check_result(10, 32'd2, "AND");
end
endtask


/* ============================================================
   I-TYPE
   ============================================================ */

task test_itype;
begin
    reset_cpu; set_x2(32'd10);
    instruction_drive = 32'h00510093; tick;
    check_result(11, 32'd15, "ADDI");

    reset_cpu; set_x2(32'd10);
    instruction_drive = 32'h00B12093; tick;
    check_result(12, 32'd1, "SLTI");

    reset_cpu; set_x2(32'd10);
    instruction_drive = 32'h00B13093; tick;
    check_result(13, 32'd1, "SLTIU");

    reset_cpu; set_x2(32'd10);
    instruction_drive = 32'h05514093; tick;
    check_result(14, 32'h0000005F, "XORI");

    reset_cpu; set_x2(32'd10);
    instruction_drive = 32'h05516093; tick;
    check_result(15, 32'h0000005F, "ORI");

    reset_cpu; set_x2(32'd10);
    instruction_drive = 32'h0FF17093; tick;
    check_result(16, 32'h0000000A, "ANDI");

    reset_cpu; set_x2(32'd10);
    instruction_drive = 32'h00211093; tick;
    check_result(17, 32'd40, "SLLI");

    reset_cpu; set_x2(32'd10);
    instruction_drive = 32'h00115093; tick;
    check_result(18, 32'd5, "SRLI");

    reset_cpu; set_x2(32'hFFFFFFF0);
    instruction_drive = 32'h40115093; tick;
    check_result(19, 32'hFFFFFFF8, "SRAI");
end
endtask


/* ============================================================
   U-TYPE
   ============================================================ */

task test_utype;
begin
    reset_cpu;
    instruction_drive = 32'h123450B7; tick;
    check_result(20, 32'h12345000, "LUI");

    reset_cpu;
    instruction_drive = 32'h12345097; tick;
    check_result(21, 32'h12345000, "AUIPC");
end
endtask


/* ============================================================
   BRANCH HELPER
   ============================================================ */

task branch_test;
input integer number;
input [31:0] instr;
input [31:0] x2_value;
input [31:0] x3_value;
input [31:0] expected_pc;
input [200*8-1:0] name;
begin
    reset_cpu;
    set_x2(x2_value);
    set_x3(x3_value);
    instruction_drive = instr;
    tick;
    check_pc(number, expected_pc, name);
end
endtask


/* ============================================================
   ALL BRANCHES
   ============================================================ */

task test_branches;
begin
    branch_test(22, 32'h00310463, 32'd5, 32'd5, 32'd16, "BEQ taken");
    branch_test(23, 32'h00310463, 32'd5, 32'd3, 32'd12, "BEQ not taken");

    branch_test(24, 32'h00311463, 32'd5, 32'd3, 32'd16, "BNE taken");
    branch_test(25, 32'h00311463, 32'd5, 32'd5, 32'd12, "BNE not taken");

    branch_test(26, 32'h00314463, 32'hFFFFFFF6, 32'd3, 32'd16, "BLT taken");
    branch_test(27, 32'h00314463, 32'd10, 32'd3, 32'd12, "BLT not taken");

    branch_test(28, 32'h00315463, 32'd10, 32'd3, 32'd16, "BGE taken");
    branch_test(29, 32'h00315463, 32'hFFFFFFF6, 32'd3, 32'd12, "BGE not taken");

    branch_test(30, 32'h00316463, 32'd3, 32'd10, 32'd16, "BLTU taken");
    branch_test(31, 32'h00316463, 32'd10, 32'd3, 32'd12, "BLTU not taken");

    branch_test(32, 32'h00317463, 32'd10, 32'd3, 32'd16, "BGEU taken");
    branch_test(33, 32'h00317463, 32'd3, 32'd10, 32'd12, "BGEU not taken");
end
endtask


/* ============================================================
   JAL
   ============================================================ */

task test_jal;
begin
    reset_cpu;
    set_x2(32'd10);
    set_x3(32'd3);

    instruction_drive = 32'h008000EF;
    tick;
    check_pc(34, 32'd16, "JAL target");

    instruction_drive = 32'h00008213;
    tick;
    check_result(35, 32'd12, "JAL link PC+4");
end
endtask


/* ============================================================
   JALR
   ============================================================ */

task test_jalr;
begin
    reset_cpu;

    set_x2(32'd17);
    set_x3(32'd3);

    instruction_drive = 32'h000100E7;
    tick;

    check_pc(36, 32'd16, "JALR target and bit0 clear");

    instruction_drive = 32'h00008213;
    tick;

    check_result(37, 32'd12, "JALR link PC+4");
end
endtask


/* ============================================================
   MEMORY
   ============================================================ */

task test_memory;
begin
    reset_cpu;

    instruction_drive = 32'h10000113; tick;
    instruction_drive = 32'h00A00193; tick;

    instruction_drive = 32'h00312023; tick; // SW
    instruction_drive = 32'h00012083; tick; // LW

    instruction_drive = 32'h00008213; tick;

    check_result(38, 32'd10, "SW/LW");
end
endtask


/* ============================================================
   BYTE / HALFWORD MEMORY
   ============================================================ */

task test_byte_halfword;
begin
    reset_cpu;

    instruction_drive = 32'h10000113; tick;
    instruction_drive = 32'hF8000193; tick;

    instruction_drive = 32'h00310023; tick; // SB
    instruction_drive = 32'h00010083; tick; // LB
    instruction_drive = 32'h00008213; tick;

    check_result(39, 32'hFFFFFF80, "SB/LB sign extension");


    reset_cpu;

    instruction_drive = 32'h10000113; tick;
    instruction_drive = 32'hF8000193; tick;

    instruction_drive = 32'h00310023; tick; // SB
    instruction_drive = 32'h00014083; tick; // LBU
    instruction_drive = 32'h00008213; tick;

    check_result(40, 32'h00000080, "SB/LBU zero extension");


    reset_cpu;

    instruction_drive = 32'h10000113; tick;
    instruction_drive = 32'h000081B7; tick; // x3=0x8000

    instruction_drive = 32'h00311023; tick; // SH
    instruction_drive = 32'h00011083; tick; // LH
    instruction_drive = 32'h00008213; tick;

    check_result(41, 32'hFFFF8000, "SH/LH sign extension");


    reset_cpu;

    instruction_drive = 32'h10000113; tick;
    instruction_drive = 32'h000081B7; tick;

    instruction_drive = 32'h00311023; tick; // SH
    instruction_drive = 32'h00015083; tick; // LHU
    instruction_drive = 32'h00008213; tick;

    check_result(42, 32'h00008000, "SH/LHU zero extension");
end
endtask


/* ============================================================
   FENCE / SYSTEM
   ============================================================ */

task test_nop_like;
begin
    reset_cpu;
    instruction_drive = 32'h0000000F; tick;
    check_pc(43, 32'd4, "FENCE as NOP");

    reset_cpu;
    instruction_drive = 32'h00000073; tick;
    check_pc(44, 32'd4, "ECALL as NOP");

    reset_cpu;
    instruction_drive = 32'h00100073; tick;
    check_pc(45, 32'd4, "EBREAK as NOP");
end
endtask


/* ============================================================
   MAIN
   ============================================================ */

initial begin
    errors = 0;
    RESET = 1'b0;

    instruction_drive = 32'h00000013;
    force uut.INSTRUCTIONS = instruction_drive;

    #20;

    $display("");
    $display("==============================================");
    $display("        RV32I PROCESSOR TEST START");
    $display("==============================================");
    $display("");

    test_rtype;
    test_itype;
    test_utype;
    test_branches;
    test_jal;
    test_jalr;
    test_memory;
    test_byte_halfword;
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
