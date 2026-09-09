`timescale 1ns/1ps

module tb_all_instructions_g_data;

    reg CLK;
    reg RESET;

    wire N;
    wire Z;
    wire [31:0] RESULT;

    integer errors;
    integer test_no;

    Riscv32i uut (
        .CLK    (CLK),
        .RESET  (RESET),
        .N      (N),
        .Z      (Z),
        .RESULT (RESULT)
    );

    always #5 CLK = ~CLK;

    // ============================================================
    // Expected ROM instructions from the supplied FULL ROM test
    // ============================================================
    reg [31:0] EXP_INSTR [0:46];
    reg [31:0] EXP_PC     [0:46];
    reg [31:0] EXP_RESULT [0:46];

    reg [127:0] TEST_NAME [0:46];

    integer i;

    initial begin

        // --------------------------------------------------------
        // Test names
        // --------------------------------------------------------
        TEST_NAME[0]  = "ADDI";
        TEST_NAME[1]  = "ROM LATENCY";
        TEST_NAME[2]  = "ADD";
        TEST_NAME[3]  = "XOR";
        TEST_NAME[4]  = "ADDI";
        TEST_NAME[5]  = "SW";
        TEST_NAME[6]  = "LW";
        TEST_NAME[7]  = "ADDI";
        TEST_NAME[8]  = "ADDI";
        TEST_NAME[9]  = "ADD";
        TEST_NAME[10] = "SUB";
        TEST_NAME[11] = "SLL";
        TEST_NAME[12] = "XOR";
        TEST_NAME[13] = "SRL";
        TEST_NAME[14] = "OR";
        TEST_NAME[15] = "AND";
        TEST_NAME[16] = "ADDI";
        TEST_NAME[17] = "SLTI";
        TEST_NAME[18] = "XORI";
        TEST_NAME[19] = "ORI";
        TEST_NAME[20] = "ANDI";
        TEST_NAME[21] = "SLLI";
        TEST_NAME[22] = "SRLI";
        TEST_NAME[23] = "ADDI -16";
        TEST_NAME[24] = "ADDI";
        TEST_NAME[25] = "SRA";
        TEST_NAME[26] = "SRAI";
        TEST_NAME[27] = "LUI";
        TEST_NAME[28] = "AUIPC";
        TEST_NAME[29] = "ADDI";
        TEST_NAME[30] = "ADDI";
        TEST_NAME[31] = "SW";
        TEST_NAME[32] = "LW";
        TEST_NAME[33] = "ADDI";
        TEST_NAME[34] = "ADDI";
        TEST_NAME[35] = "ADDI";
        TEST_NAME[36] = "BEQ";
        TEST_NAME[37] = "BEQ TARGET";
        TEST_NAME[38] = "ADDI";
        TEST_NAME[39] = "ADDI";
        TEST_NAME[40] = "BNE";
        TEST_NAME[41] = "BNE TARGET";
        TEST_NAME[42] = "JAL";
        TEST_NAME[43] = "JAL TARGET";
        TEST_NAME[44] = "ADDI";
        TEST_NAME[45] = "JALR";
        TEST_NAME[46] = "JALR TARGET";

        // --------------------------------------------------------
        // Exact PC / ROM contents / RESULT from the supplied log
        // --------------------------------------------------------
        EXP_PC[0] = 32'h00000000; EXP_INSTR[0] = 32'h12300093; EXP_RESULT[0] = 32'h00000123;
        EXP_PC[1] = 32'h00000004; EXP_INSTR[1] = 32'h12300093; EXP_RESULT[1] = 32'h00000123;
        EXP_PC[2] = 32'h00000008; EXP_INSTR[2] = 32'h00108133; EXP_RESULT[2] = 32'h00000246;
        EXP_PC[3] = 32'h0000000c; EXP_INSTR[3] = 32'h0020c1b3; EXP_RESULT[3] = 32'h00000365;
        EXP_PC[4] = 32'h00000010; EXP_INSTR[4] = 32'h00409213; EXP_RESULT[4] = 32'h00001230;
        EXP_PC[5] = 32'h00000014; EXP_INSTR[5] = 32'h00102023; EXP_RESULT[5] = 32'h00000000;
        EXP_PC[6] = 32'h00000018; EXP_INSTR[6] = 32'h00002283; EXP_RESULT[6] = 32'h00000000;
        EXP_PC[7] = 32'h0000001c; EXP_INSTR[7] = 32'h00a00113; EXP_RESULT[7] = 32'h0000000a;
        EXP_PC[8] = 32'h00000020; EXP_INSTR[8] = 32'h00300193; EXP_RESULT[8] = 32'h00000003;
        EXP_PC[9] = 32'h00000024; EXP_INSTR[9] = 32'h003100b3; EXP_RESULT[9] = 32'h0000000d;
        EXP_PC[10] = 32'h00000028; EXP_INSTR[10] = 32'h400100b3; EXP_RESULT[10] = 32'h0000000a;
        EXP_PC[11] = 32'h0000002c; EXP_INSTR[11] = 32'h003110b3; EXP_RESULT[11] = 32'h00000050;
        EXP_PC[12] = 32'h00000030; EXP_INSTR[12] = 32'h003140b3; EXP_RESULT[12] = 32'h00000009;
        EXP_PC[13] = 32'h00000034; EXP_INSTR[13] = 32'h003150b3; EXP_RESULT[13] = 32'h00000001;
        EXP_PC[14] = 32'h00000038; EXP_INSTR[14] = 32'h003160b3; EXP_RESULT[14] = 32'h0000000b;
        EXP_PC[15] = 32'h0000003c; EXP_INSTR[15] = 32'h003170b3; EXP_RESULT[15] = 32'h00000002;
        EXP_PC[16] = 32'h00000040; EXP_INSTR[16] = 32'h00510093; EXP_RESULT[16] = 32'h0000000f;
        EXP_PC[17] = 32'h00000044; EXP_INSTR[17] = 32'h00b12093; EXP_RESULT[17] = 32'h00000001;
        EXP_PC[18] = 32'h00000048; EXP_INSTR[18] = 32'h05514093; EXP_RESULT[18] = 32'h0000005f;
        EXP_PC[19] = 32'h0000004c; EXP_INSTR[19] = 32'h05516093; EXP_RESULT[19] = 32'h0000005f;
        EXP_PC[20] = 32'h00000050; EXP_INSTR[20] = 32'h0ff17093; EXP_RESULT[20] = 32'h0000000a;
        EXP_PC[21] = 32'h00000054; EXP_INSTR[21] = 32'h00211093; EXP_RESULT[21] = 32'h00000028;
        EXP_PC[22] = 32'h00000058; EXP_INSTR[22] = 32'h00115093; EXP_RESULT[22] = 32'h00000005;
        EXP_PC[23] = 32'h0000005c; EXP_INSTR[23] = 32'hff000113; EXP_RESULT[23] = 32'hfffffff0;
        EXP_PC[24] = 32'h00000060; EXP_INSTR[24] = 32'h00300193; EXP_RESULT[24] = 32'h00000003;
        EXP_PC[25] = 32'h00000064; EXP_INSTR[25] = 32'h403150b3; EXP_RESULT[25] = 32'hfffffffe;
        EXP_PC[26] = 32'h00000068; EXP_INSTR[26] = 32'h40115093; EXP_RESULT[26] = 32'hfffffff8;
        EXP_PC[27] = 32'h0000006c; EXP_INSTR[27] = 32'h12345037; EXP_RESULT[27] = 32'h12345000;
        EXP_PC[28] = 32'h00000070; EXP_INSTR[28] = 32'h12345017; EXP_RESULT[28] = 32'h12345070;
        EXP_PC[29] = 32'h00000074; EXP_INSTR[29] = 32'h10000113; EXP_RESULT[29] = 32'h00000100;
        EXP_PC[30] = 32'h00000078; EXP_INSTR[30] = 32'h00a00193; EXP_RESULT[30] = 32'h0000000a;
        EXP_PC[31] = 32'h0000007c; EXP_INSTR[31] = 32'h00312023; EXP_RESULT[31] = 32'h00000100;
        EXP_PC[32] = 32'h00000080; EXP_INSTR[32] = 32'h00012083; EXP_RESULT[32] = 32'h00000100;
        EXP_PC[33] = 32'h00000084; EXP_INSTR[33] = 32'h00008213; EXP_RESULT[33] = 32'h0000000a;
        EXP_PC[34] = 32'h00000088; EXP_INSTR[34] = 32'h00500113; EXP_RESULT[34] = 32'h00000005;
        EXP_PC[35] = 32'h0000008c; EXP_INSTR[35] = 32'h00500193; EXP_RESULT[35] = 32'h00000005;
        EXP_PC[36] = 32'h00000090; EXP_INSTR[36] = 32'h00310463; EXP_RESULT[36] = 32'h00000000;
        EXP_PC[37] = 32'h00000098; EXP_INSTR[37] = 32'h00000013; EXP_RESULT[37] = 32'h00000000;
        EXP_PC[38] = 32'h0000009c; EXP_INSTR[38] = 32'h00500113; EXP_RESULT[38] = 32'h00000005;
        EXP_PC[39] = 32'h000000a0; EXP_INSTR[39] = 32'h00300193; EXP_RESULT[39] = 32'h00000003;
        EXP_PC[40] = 32'h000000a4; EXP_INSTR[40] = 32'h00311463; EXP_RESULT[40] = 32'h00000002;
        EXP_PC[41] = 32'h000000ac; EXP_INSTR[41] = 32'h00000013; EXP_RESULT[41] = 32'h00000000;
        EXP_PC[42] = 32'h000000b0; EXP_INSTR[42] = 32'h0080006f; EXP_RESULT[42] = 32'hxxxxxxxx;
        EXP_PC[43] = 32'h000000b8; EXP_INSTR[43] = 32'h00000013; EXP_RESULT[43] = 32'h00000000;
        EXP_PC[44] = 32'h000000bc; EXP_INSTR[44] = 32'h0c000113; EXP_RESULT[44] = 32'h000000c0;
        EXP_PC[45] = 32'h000000c0; EXP_INSTR[45] = 32'h00010067; EXP_RESULT[45] = 32'h000000c0;
        EXP_PC[46] = 32'h000000c0; EXP_INSTR[46] = 32'h00000013; EXP_RESULT[46] = 32'h00000000;

        errors = 0;
        test_no = 0;
        CLK = 0;
        RESET = 1;

        $display("");
        $display("============================================================");
        $display("        RV32I PROCESSOR - SELF CHECKING TEST");
        $display("============================================================");
        $display("");

        $display("RESET ACTIVE");
        #20;
        RESET = 0;
        $display("RESET RELEASED");
        $display("");

        // ========================================================
        // Each test is self-checking.
        // A zeroed HEX therefore fails immediately because
        // INSTRUCTIONS will be 00000000 instead of EXP_INSTR.
        // ========================================================
        for (i = 0; i < 47; i = i + 1) begin

            @(negedge CLK);
            #2;

            test_no = i + 1;

            if ((uut.PC === EXP_PC[i]) &&
                (uut.INSTRUCTIONS === EXP_INSTR[i]) &&
                ((i == 42) || (RESULT === EXP_RESULT[i]))) begin

                $display("TEST %02d %-12s PASS", test_no, TEST_NAME[i]);

            end
            else begin

                errors = errors + 1;

                $display("TEST %02d %-12s FAIL", test_no, TEST_NAME[i]);

                if (uut.PC !== EXP_PC[i])
                    $display("  Expected PC     : %08h", EXP_PC[i]);

                if (uut.INSTRUCTIONS !== EXP_INSTR[i]) begin
                    $display("  Expected INSTR  : %08h", EXP_INSTR[i]);
                    $display("  Actual INSTR    : %08h", uut.INSTRUCTIONS);
                end

                if ((i != 42) && (RESULT !== EXP_RESULT[i])) begin
                    $display("  Expected RESULT : %08h", EXP_RESULT[i]);
                    $display("  Actual RESULT   : %08h", RESULT);
                end

                $display("");
            end

            // Move to next CPU state.
            @(posedge CLK);
            #2;
        end

        $display("");
        $display("============================================================");

        if (errors == 0) begin
            $display("             ALL TESTS PASSED: 47 / 47");
        end
        else begin
            $display("             TEST FAILED");
            $display("             PASSED: %0d / 47", 47 - errors);
            $display("             FAILED: %0d / 47", errors);
        end

        $display("============================================================");
        $display("");

        $finish;
    end

endmodule
