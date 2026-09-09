`timescale 1ns/1ps
// ============================================================
// Testbench: I-tip aritmeticke instrukcije (opcode 0010011)
// ADDI, ANDI, ORI, XORI, SLTI, SLTIU, SLLI, SRLI, SRAI
//
// Ove instrukcije prolaze kroz ImmediateGenerator (I_TYPE format),
// za razliku od R-tipa koji ga uopste ne koristi. Ako svi R-tip
// testovi (tb_rtype.v) prolaze, a ovde nesto ne valja, prvi
// sumnjivac je generisanje/multipleksiranje I_TYPE immediate-a
// (ImmediateGenerator.v <-> immSrc iz ControlWord.v)
// - videti napomenu u UPUTSTVO.md.
// ============================================================

module tb_itype;

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
        input [31:0]  expected_result;
        begin
            force uut.INSTRUCTIONS = instr;
            #1;
            if (RESULT !== expected_result) begin
                $display("[FAIL] %0s : RESULT = %h, ocekivano %h", name, RESULT, expected_result);
                errors = errors + 1;
            end else begin
                $display("[ OK ] %0s : RESULT = %h", name, RESULT);
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
                10: actual = uut.b2v_inst3.OUT10_;
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
        force uut.INSTRUCTIONS = 32'h00000013; // NOP tokom reseta
        repeat (3) @(posedge CLK);
        RESET = 0;
        #1;

        $display("================ SETUP ================");
        // LUI x1, 0x00003 -> x1 = 0x00003000 (baza za sve I-tip testove)
        run_instr(32'h000030B7, "LUI x1,0x3", 32'h00003000);
        check_reg(1, 32'h00003000, "LUI x1,0x3");

        $display("================ I-TIP TESTOVI (x1 = 0x00003000 = 12288) ================");

        // ADDI x10, x1, 100  -> 0x3000 + 100 = 0x3064
        run_instr(32'h06408513, "ADDI x10,x1,100", 32'h00003064);
        check_reg(10, 32'h00003064, "ADDI (pozitivan immediate)");

        // ADDI x10, x1, -50  -> 0x3000 - 50 = 0x2FCE
        run_instr(32'hFCE08513, "ADDI x10,x1,-50", 32'h00002FCE);
        check_reg(10, 32'h00002FCE, "ADDI (negativan immediate, sign-extend)");

        // ANDI x10, x1, 0x0F0 -> 0x3000 & 0x0F0 = 0
        run_instr(32'h0F00F513, "ANDI x10,x1,0x0F0", 32'h00000000);
        check_reg(10, 32'h00000000, "ANDI");

        // ORI x10, x1, 0x0F0 -> 0x3000 | 0x0F0 = 0x30F0
        run_instr(32'h0F00E513, "ORI x10,x1,0x0F0", 32'h000030F0);
        check_reg(10, 32'h000030F0, "ORI");

        // XORI x10, x1, 0x0F0 -> 0x3000 ^ 0x0F0 = 0x30F0
        run_instr(32'h0F00C513, "XORI x10,x1,0x0F0", 32'h000030F0);
        check_reg(10, 32'h000030F0, "XORI");

        // SLTI x10, x1, 100  (12288 < 100 signed? ne) -> 0
        run_instr(32'h0640A513, "SLTI x10,x1,100", 32'h00000000);
        check_reg(10, 32'h00000000, "SLTI (false)");

        // SLTI x10, x1, -50 (12288 < -50 signed? ne) -> 0
        run_instr(32'hFCE0A513, "SLTI x10,x1,-50", 32'h00000000);
        check_reg(10, 32'h00000000, "SLTI (negativan immediate, i dalje false)");

        // SLTIU x10, x1, 100 (12288 < 100 unsigned? ne) -> 0
        run_instr(32'h0640B513, "SLTIU x10,x1,100", 32'h00000000);
        check_reg(10, 32'h00000000, "SLTIU (false)");

        // SLLI x10, x1, 5  -> 0x3000 << 5 = 0x60000
        run_instr(32'h00509513, "SLLI x10,x1,5", 32'h00060000);
        check_reg(10, 32'h00060000, "SLLI");

        // SRLI x10, x1, 5  -> 0x3000 >> 5 = 0x180
        run_instr(32'h0050D513, "SRLI x10,x1,5", 32'h00000180);
        check_reg(10, 32'h00000180, "SRLI");

        // SRAI x10, x1, 5  -> (pozitivan, isto kao SRLI) = 0x180
        run_instr(32'h4050D513, "SRAI x10,x1,5", 32'h00000180);
        check_reg(10, 32'h00000180, "SRAI (pozitivan operand)");

        release uut.INSTRUCTIONS;

        $display("===============================================================");
        if (errors == 0)
            $display("SVI I-TIP TESTOVI PROSLI USPESNO.");
        else
            $display("BROJ NEUSPESNIH PROVERA: %0d", errors);
        $display("===============================================================");

        $stop;
    end

endmodule
