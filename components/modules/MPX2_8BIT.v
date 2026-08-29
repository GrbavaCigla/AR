module MPX2_8BIT (
    input [7:0] data0x,
    input [7:0] data1x,
    input [0:0] sel,
    output reg [7:0] result
);
    always @* begin
        case (sel)
            1'd0: result = data0x;
            1'd1: result = data1x;
            default: result = { 8{1'b0} };
        endcase
    end
endmodule
