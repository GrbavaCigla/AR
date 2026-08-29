module MPX12_16BIT (
    input wire [15:0] data0x,
    input wire [15:0] data1x,
    input wire [15:0] data2x,
    input wire [15:0] data3x,
    input wire [15:0] data4x,
    input wire [15:0] data5x,
    input wire [15:0] data6x,
    input wire [15:0] data7x,
    input wire [15:0] data8x,
    input wire [15:0] data9x,
    input wire [15:0] data10x,
    input wire [15:0] data11x,
    input wire [3:0] sel,
    output reg [15:0] result
);

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
        default: result = 16'b0;
    endcase
end

endmodule
