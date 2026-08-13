// ============================================================
// Verilog ekvivalent MPX16_32BIT.vhd (LPM_MUX, 16:1, 32-bit)
// Rucno preveden iz Altera MegaWizard generisanog VHDL fajla.
// ============================================================

module MPX16_32BIT (
    data0x,  data1x,  data2x,  data3x,
    data4x,  data5x,  data6x,  data7x,
    data8x,  data9x,  data10x, data11x,
    data12x, data13x, data14x, data15x,
    sel,
    result
);

    input  [31:0] data0x,  data1x,  data2x,  data3x;
    input  [31:0] data4x,  data5x,  data6x,  data7x;
    input  [31:0] data8x,  data9x,  data10x, data11x;
    input  [31:0] data12x, data13x, data14x, data15x;
    input  [3:0]  sel;
    output [31:0] result;

    reg [31:0] result;

    always @(*) begin
        case (sel)
            4'd0:  result = data0x;
            4'd1:  result = data1x;
            4'd2:  result = data2x;
            4'd3:  result = data3x;
            4'd4:  result = data4x;
            4'd5:  result = data5x;
            4'd6:  result = data6x;
            4'd7:  result = data7x;
            4'd8:  result = data8x;
            4'd9:  result = data9x;
            4'd10: result = data10x;
            4'd11: result = data11x;
            4'd12: result = data12x;
            4'd13: result = data13x;
            4'd14: result = data14x;
            4'd15: result = data15x;
            default: result = 32'bx;
        endcase
    end

endmodule
