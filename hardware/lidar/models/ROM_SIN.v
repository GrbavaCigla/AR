// =====================================================================
// ROM_SIN.v
//
// Verilog ekvivalent fajla ROM_SIN.vhd (Quartus altsyncram megafunkcija,
// 64 x 16, registrovan izlaz - OUTDATA_REG_A = CLOCK0). Sadrzaj memorije
// je prekopiran iz priloženog sin_64_q15.mif (Q1.15 sinusna tabela za
// uglove 0..90 stepeni u 64 koraka, tj. korak ≈ 1.40625°).
//
// Napravljen da bude bit-tacan ekvivalent originalnog .vhd fajla, tako
// da ceo dizajn moze da se prevede kao cist Verilog u ModelSim-u
// (besplatna/OEM verzija ne moze da mesa VHDL i Verilog u istoj
// simulaciji).
// =====================================================================

module ROM_SIN(address, clock, data, wren, q);
    input  [5:0]  address;
    input         clock;
    input  [15:0] data;
    input         wren;
    output [15:0] q;
    reg    [15:0] q;

    reg [15:0] mem [0:63];

    initial begin
        mem[ 0] = 16'd0;     mem[ 1] = 16'd817;   mem[ 2] = 16'd1633;  mem[ 3] = 16'd2449;
        mem[ 4] = 16'd3263;  mem[ 5] = 16'd4074;  mem[ 6] = 16'd4884;  mem[ 7] = 16'd5690;
        mem[ 8] = 16'd6493;  mem[ 9] = 16'd7291;  mem[10] = 16'd8085;  mem[11] = 16'd8875;
        mem[12] = 16'd9658;  mem[13] = 16'd10436; mem[14] = 16'd11207; mem[15] = 16'd11971;
        mem[16] = 16'd12728; mem[17] = 16'd13477; mem[18] = 16'd14217; mem[19] = 16'd14949;
        mem[20] = 16'd15671; mem[21] = 16'd16384; mem[22] = 16'd17086; mem[23] = 16'd17778;
        mem[24] = 16'd18458; mem[25] = 16'd19128; mem[26] = 16'd19785; mem[27] = 16'd20430;
        mem[28] = 16'd21062; mem[29] = 16'd21681; mem[30] = 16'd22287; mem[31] = 16'd22879;
        mem[32] = 16'd23457; mem[33] = 16'd24020; mem[34] = 16'd24568; mem[35] = 16'd25101;
        mem[36] = 16'd25618; mem[37] = 16'd26120; mem[38] = 16'd26605; mem[39] = 16'd27073;
        mem[40] = 16'd27525; mem[41] = 16'd27960; mem[42] = 16'd28377; mem[43] = 16'd28777;
        mem[44] = 16'd29158; mem[45] = 16'd29522; mem[46] = 16'd29867; mem[47] = 16'd30194;
        mem[48] = 16'd30502; mem[49] = 16'd30791; mem[50] = 16'd31061; mem[51] = 16'd31311;
        mem[52] = 16'd31542; mem[53] = 16'd31754; mem[54] = 16'd31945; mem[55] = 16'd32117;
        mem[56] = 16'd32269; mem[57] = 16'd32401; mem[58] = 16'd32513; mem[59] = 16'd32604;
        mem[60] = 16'd32675; mem[61] = 16'd32726; mem[62] = 16'd32757; mem[63] = 16'd32767;
    end

    always @(posedge clock) begin
        if (wren)
            mem[address] <= data;
        q <= mem[address];
    end
endmodule
