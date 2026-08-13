// ============================================================
// Bihevioralni Verilog ekvivalent ROM1.vhd (altsyncram, ROM mod)
// numwords_a = 1024, widthad_a = 10, width_a = 32
// outdata_reg_a = "UNREGISTERED" -> asinhroni (combinational) izlaz
//
// NAPOMENA: Ovo NIJE bit-tacan prevod Altera altsyncram primitive,
// vec funkcionalno ekvivalentan bihevioralni model za simulaciju.
// Ako postoji originalni ROM1_syn.v (generisan od strane MegaWizard-a,
// vidi retrieval info u ROM1.vhd), koristi TAJ fajl umesto ovog.
//
// init_file u originalu je "./InstructionMemory/InicializationData.mif"
// Verilog ne cita .mif direktno - potrebno je konvertovati sadrzaj
// u .hex ili .txt format (jedna 32-bitna hex vrednost po liniji) i
// promeniti putanju u $readmemh liniji ispod.
// ============================================================

module ROM1 (
    address,
    clock,
    q
);

    input  [9:0]  address;
    input         clock;
    output [31:0] q;

    reg [31:0] mem [0:1023];
    reg [31:0] q;

    // Ucitavanje inicijalnih podataka. Konvertuj InicializationData.mif
    // u InicializationData.hex (32-bitne hex vrednosti, jedna po liniji)
    // i postavi tacnu putanju ovde.
    initial begin
        $readmemh("InstructionMemory/InicializationData.hex", mem);
    end

    // outdata_reg_a = UNREGISTERED -> izlaz prati adresu asinhrono
    always @(*) begin
        q = mem[address];
    end

endmodule
