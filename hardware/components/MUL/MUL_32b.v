// =====================================================================
// MUL_32b.v
//
// Verilog ekvivalent fajla MUL_32b.vhd (Quartus LPM_MULT megafunkcija:
// SIGNED, WIDTHA=17, WIDTHB=16, WIDTHP=33, LPM_PIPELINE=0 => cisto
// kombinacioni signed mnozac, bez registra na izlazu).
// =====================================================================

module MUL_32b(dataa, datab, result);
    input  [16:0] dataa;   // signed, 17-bit
    input  [15:0] datab;   // signed, 16-bit
    output [32:0] result;  // signed, 33-bit
    assign result = $signed(dataa) * $signed(datab);
endmodule
