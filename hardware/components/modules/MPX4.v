module MPX4 (
    input data0,
    input data1,
    input data2,
    input data3,
    input [1:0] sel,
    output reg result
);
    always @* begin
        case(sel)
            2'd0: result = data0;
            2'd1: result = data1;
            2'd2: result = data2;
            2'd3: result = data3;
            default: result = 1'b0;
        endcase
    end
endmodule
