`timescale 1ns/1ps

module tb_all_instructions_g;

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
   TICK
   ============================================================ */

task tick;
begin
    #2;
    @(posedge CLK);
    #2;
end
endtask


/* ============================================================
   RESET
   ============================================================ */

task reset_cpu;
begin
    RESET = 1'b1;

    force uut.PC = 32'h00000000;

    instruction_drive = 32'h00000013;
    force uut.INSTRUCTIONS = instruction_drive;

    repeat (3)
        tick;

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
    if (RESULT === expected) begin

        $display(
            "TEST %0d PASSED: %0s RESULT=%h",
            number,
            name,
            RESULT
        );

    end
    else begin

        $display(
            "TEST %0d FAILED: %0s EXPECTED=%h GOT=%h",
            number,
            name,
            expected,
            RESULT
        );

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
    if (uut.PC === expected) begin

        $display(
            "TEST %0d PASSED: %0s PC=%h",
            number,
            name,
            uut.PC
        );

    end
    else begin

        $display(
            "TEST %0d FAILED: %0s EXPECTED PC=%h GOT PC=%h",
            number,
            name,
            expected,
            uut.PC
        );

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

        32'd0:
            instruction_drive = 32'h00000113;

        32'd3:
            instruction_drive = 32'h00300113;

        32'd5:
            instruction_drive = 32'h00500113;

        32'd10:
            instruction_drive = 32'h00A00113;

        32'd17:
            instruction_drive = 32'h01100113;

        default:
            instruction_drive = 32'h00000113;

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

        32'd0:
            instruction_drive = 32'h00000193;

        32'd3:
            instruction_drive = 32'h00300193;

        32'd5:
            instruction_drive = 32'h00500193;

        32'd10:
            instruction_drive = 32'h00A00193;

        default:
            instruction_drive = 32'h00000193;

    endcase

    tick;

end
endtask


/* ============================================================
   R-TYPE
   ADD
   SUB
   AND
   OR
   XOR
   ============================================================ */

task test_rtype;

begin

    /* ADD */
    reset_cpu;

    set_x2(32'd10);
    set_x3(32'd3);

    instruction_drive = 32'h003100B3;
    tick;

    check_result(
        1,
        32'd13,
        "ADD"
    );


    /* SUB */
    reset_cpu;

    set_x2(32'd10);
    set_x3(32'd3);

    instruction_drive = 32'h403100B3;
    tick;

    check_result(
        2,
        32'd7,
        "SUB"
    );


    /* AND */
    reset_cpu;

    set_x2(32'd10);
    set_x3(32'd3);

    instruction_drive = 32'h003170B3;
    tick;

    check_result(
        3,
        32'd2,
        "AND"
    );


    /* OR */
    reset_cpu;

    set_x2(32'd10);
    set_x3(32'd3);

    instruction_drive = 32'h003160B3;
    tick;

    check_result(
        4,
        32'd11,
        "OR"
    );


    /* XOR */
    reset_cpu;

    set_x2(32'd10);
    set_x3(32'd3);

    instruction_drive = 32'h003140B3;
    tick;

    check_result(
        5,
        32'd9,
        "XOR"
    );

end
endtask


/* ============================================================
   I-TYPE
   ADDI
   ============================================================ */

task test_itype;

begin

    reset_cpu;

    set_x2(32'd10);

    instruction_drive = 32'h00510093;
    tick;

    check_result(
        6,
        32'd15,
        "ADDI"
    );

end
endtask


/* ============================================================
   LUI
   ============================================================ */

task test_lui;

begin

    reset_cpu;

    instruction_drive = 32'h123450B7;
    tick;

    check_result(
        7,
        32'h12345000,
        "LUI"
    );

end
endtask


/* ============================================================
   MEMORY
   SW + LW
   ============================================================ */

task test_memory;

begin

    reset_cpu;

    /*
       x2 = 0x100
    */

    instruction_drive = 32'h10000113;
    tick;


    /*
       x3 = 10
    */

    instruction_drive = 32'h00A00193;
    tick;


    /*
       SW x3, 0(x2)

       MEM[0x100] = 10
    */

    instruction_drive = 32'h00312023;
    tick;


    /*
       LW x1, 0(x2)

       x1 = MEM[0x100]
          = 10
    */

    instruction_drive = 32'h00012083;
    tick;


    /*
       ADDI x4, x1, 0

       RESULT = x1
    */

    instruction_drive = 32'h00008213;
    tick;


    check_result(
        8,
        32'd10,
        "SW/LW"
    );

end
endtask


/* ============================================================
   JAL
   ============================================================ */

task test_jal;

begin

    reset_cpu;


    /*
       JAL x1, +8

       PC:
       0 -> 8
    */

    instruction_drive = 32'h008000EF;
    tick;

    check_pc(
        9,
        32'd8,
        "JAL target"
    );


    /*
       x4 = x1

       x1 treba da sadrzi PC+4 = 4
    */

    instruction_drive = 32'h00008213;
    tick;

    check_result(
        10,
        32'd4,
        "JAL link PC+4"
    );

end
endtask


/* ============================================================
   JALR
   ============================================================ */

task test_jalr;

begin

    reset_cpu;


    /*
       x2 = 17
       JALR target = x2 + 0
       bit 0 se clear-uje

       17 & ~1 = 16
    */

    set_x2(32'd17);


    /*
       JALR x1, 0(x2)
    */

    instruction_drive = 32'h000100E7;
    tick;

    check_pc(
        11,
        32'd16,
        "JALR target"
    );


    /*
       x4 = x1

       x1 = PC_old + 4 = 4
    */

    instruction_drive = 32'h00008213;
    tick;

    check_result(
    12,
    32'd8,
    "JALR link PC+4"
);
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
    $display("       RV32I PROCESSOR TEST START");
    $display("==============================================");
    $display("");



    /* R-TYPE */

    test_rtype;


    /* I-TYPE */

    test_itype;


    /* LUI */

    test_lui;


    /* MEMORY */

    test_memory;


    /* JAL */

    test_jal;


    /* JALR */

    test_jalr;



    $display("");
    $display("==============================================");


    if (errors == 0) begin

        $display("PASSED");
        $display("ALL IMPLEMENTED TESTS PASSED");

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