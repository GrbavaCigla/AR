module MPX5_32bit (
    input [31:0] data0x,
    input [31:0] data1x,
    input [31:0] data2x,
    input [31:0] data3x,
    input [31:0] data4x,
    input [2:0] sel,
    output reg [31:0] result
);
    always @* begin
        case (sel)
            3'd0: result = data0x;
            3'd1: result = data1x;
            3'd2: result = data2x;
            3'd3: result = data3x;
            3'd4: result = data4x;
            default: result = {32{1'b0}};
        endcase
    end
endmodule
