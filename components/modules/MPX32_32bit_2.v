// ============================================================
// Verilog ekvivalent MPX32_32bit_2.vhd (LPM_MUX, 32:1, 32-bit)
// Rucno preveden iz Altera MegaWizard generisanog VHDL fajla.
// ============================================================

module MPX32_32bit_2 (
    data0x,  data1x,  data2x,  data3x,
    data4x,  data5x,  data6x,  data7x,
    data8x,  data9x,  data10x, data11x,
    data12x, data13x, data14x, data15x,
    data16x, data17x, data18x, data19x,
    data20x, data21x, data22x, data23x,
    data24x, data25x, data26x, data27x,
    data28x, data29x, data30x, data31x,
    sel,
    result
);

    input  [31:0] data0x,  data1x,  data2x,  data3x;
    input  [31:0] data4x,  data5x,  data6x,  data7x;
    input  [31:0] data8x,  data9x,  data10x, data11x;
    input  [31:0] data12x, data13x, data14x, data15x;
    input  [31:0] data16x, data17x, data18x, data19x;
    input  [31:0] data20x, data21x, data22x, data23x;
    input  [31:0] data24x, data25x, data26x, data27x;
    input  [31:0] data28x, data29x, data30x, data31x;
    input  [4:0]  sel;
    output [31:0] result;

    reg [31:0] result;

    always @(*) begin
        case (sel)
            5'd0:  result = data0x;
            5'd1:  result = data1x;
            5'd2:  result = data2x;
            5'd3:  result = data3x;
            5'd4:  result = data4x;
            5'd5:  result = data5x;
            5'd6:  result = data6x;
            5'd7:  result = data7x;
            5'd8:  result = data8x;
            5'd9:  result = data9x;
            5'd10: result = data10x;
            5'd11: result = data11x;
            5'd12: result = data12x;
            5'd13: result = data13x;
            5'd14: result = data14x;
            5'd15: result = data15x;
            5'd16: result = data16x;
            5'd17: result = data17x;
            5'd18: result = data18x;
            5'd19: result = data19x;
            5'd20: result = data20x;
            5'd21: result = data21x;
            5'd22: result = data22x;
            5'd23: result = data23x;
            5'd24: result = data24x;
            5'd25: result = data25x;
            5'd26: result = data26x;
            5'd27: result = data27x;
            5'd28: result = data28x;
            5'd29: result = data29x;
            5'd30: result = data30x;
            5'd31: result = data31x;
            default: result = 32'bx;
        endcase
    end

endmodule
