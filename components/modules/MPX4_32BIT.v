// ============================================================
// File Name: MPX4_32BIT.v
// Verilog equivalent of MPX4_32BIT.vhd (Altera LPM_MUX megafunction)
//
// 4-to-1 multiplexer, 32-bit wide
//   sel = 00 -> result = data0x
//   sel = 01 -> result = data1x
//   sel = 10 -> result = data2x
//   sel = 11 -> result = data3x
// ============================================================

module MPX4_32BIT (
    input  wire [31:0] data0x,
    input  wire [31:0] data1x,
    input  wire [31:0] data2x,
    input  wire [31:0] data3x,
    input  wire [1:0]  sel,
    output reg  [31:0] result
);

    always @(*) begin
        case (sel)
            2'b00: result = data0x;
            2'b01: result = data1x;
            2'b10: result = data2x;
            2'b11: result = data3x;
            default: result = 32'bx;
        endcase
    end

endmodule
