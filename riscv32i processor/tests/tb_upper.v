`timescale 1ns/1ps
// ============================================================
// Testbench: LUI (0110111) i AUIPC (0010111)
//
// VAZNA NAPOMENA (LUI):
//   U ovom kolu ALUSrcA je 0 za SVE instrukcije osim AUIPC,
//   sto znaci da za LUI operand A dolazi iz RS1DATA (registar na
//   poziciji instrukcija[19:15]), a NE fiksno 0, iako po RISC-V
//   specifikaciji LUI treba da koristi samo immediate.
//   Polje [19:15] je kod LUI deo immediate-a, pa ce test raditi
//   ispravno SAMO ako izabrana immediate vrednost ima nule bas
//   na tim bitovima (sto je ovde obezbedjeno biranjem 0x000AB kao
//   immediate-a). Ako se u vasem kodu koristi drugaciji immediate
//   ciji bitovi [19:15] nisu 0, RESULT ce sadrzati pogresnu vrednost
//   (immediate + sadrzaj slucajnog registra) - to je potencijalni
//   bag u ALUSrcA logici (ControlWord.v) koji vredi proveriti.
// ============================================================

module tb_upper;

    reg CLK;
    reg RESET;
    wire N, Z;
    wire [31:0] RESULT;

    integer errors;
    reg [31:0] pc_snapshot;
    reg [31:0] expected_auipc;

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
                11: actual = uut.b2v_inst3.OUT11_;
                12: actual = uut.b2v_inst3.OUT12_;
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

        $display("================ LUI TEST ================");
        // LUI x11, 0x000AB  -> x11 = 0x000AB000
        // (immediate bitovi [19:15] = 00000, sigurno od gore opisanog problema)
        run_instr(32'h000AB5B7, "LUI x11,0xAB", 32'h000AB000);
        check_reg(11, 32'h000AB000, "LUI");

        $display("================ AUIPC TEST ================");
        // AUIPC x12, 0x00002 -> x12 = PC(u tom taktu) + 0x00002000
        // Pazi: PC ovde slobodno raste svaki takt (jer testiramo
        // instrukcije "force"-ovanjem, a PC modul to ne zna), zato
        // ocekivanu vrednost racunamo DINAMICKI citajuci uut.PC
        // neposredno pre provere.
        pc_snapshot = uut.PC;
        expected_auipc = pc_snapshot + 32'h00002000;
        run_instr(32'h00002617, "AUIPC x12,0x2", expected_auipc);
        $display("       (PC u trenutku izvrsavanja AUIPC bio je %h)", pc_snapshot);
        check_reg(12, expected_auipc, "AUIPC");

        release uut.INSTRUCTIONS;

        $display("===============================================================");
        if (errors == 0)
            $display("SVI LUI/AUIPC TESTOVI PROSLI USPESNO.");
        else
            $display("BROJ NEUSPESNIH PROVERA: %0d", errors);
        $display("===============================================================");

        $stop;
    end

endmodule
