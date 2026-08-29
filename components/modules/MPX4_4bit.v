module MPX4_4bit (
    input [3:0] data0x,
    input [3:0] data1x,
    input [3:0] data2x,
    input [3:0] data3x,
    input [1:0] sel,
    output reg [3:0] result
);
    always @* begin
        case (sel)
            2'd0: result = data0x;
            2'd1: result = data1x;
            2'd2: result = data2x;
            2'd3: result = data3x;
            default: result = { 4{1'b0} };
        endcase
    end
endmodule
