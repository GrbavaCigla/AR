// ============================================================
// Verilog ekvivalent MPX5_32bit.vhd (LPM_MUX, 5:1, 32-bit)
// Rucno preveden iz Altera MegaWizard generisanog VHDL fajla.
// ============================================================

module MPX5_32bit (
    data0x,
    data1x,
    data2x,
    data3x,
    data4x,
    sel,
    result
);

    input  [31:0] data0x;
    input  [31:0] data1x;
    input  [31:0] data2x;
    input  [31:0] data3x;
    input  [31:0] data4x;
    input  [2:0]  sel;
    output [31:0] result;

    reg [31:0] result;

    always @(*) begin
        case (sel)
            3'd0: result = data0x;
            3'd1: result = data1x;
            3'd2: result = data2x;
            3'd3: result = data3x;
            3'd4: result = data4x;
            default: result = 32'bx;
        endcase
    end

endmodule
