// =====================================================================
// MPX4_16BIT.v
//
// Verilog ekvivalent fajla MPX4_16BIT.vhd (Quartus LPM_MUX megafunkcija:
// LPM_SIZE=4, LPM_WIDTH=16, LPM_WIDTHS=2). Standardni 4:1 mux, 16-bit:
//
//   sel = 00 -> result = data0x
//   sel = 01 -> result = data1x
//   sel = 10 -> result = data2x
//   sel = 11 -> result = data3x
//
// (potvrdjeno mapiranjem @data indeksa 0..3 na data0x..data3x u
// originalnom .vhd fajlu).
// =====================================================================

module MPX4_16BIT(data0x, data1x, data2x, data3x, sel, result);
    input  [15:0] data0x, data1x, data2x, data3x;
    input  [1:0]  sel;
    output [15:0] result;
    reg    [15:0] result;

    always @(*) begin
        case (sel)
            2'b00: result = data0x;
            2'b01: result = data1x;
            2'b10: result = data2x;
            2'b11: result = data3x;
        endcase
    end
endmodule
