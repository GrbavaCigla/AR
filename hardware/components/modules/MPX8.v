module MPX8 (
    input data0,
    input data1,
    input data2,
    input data3,
    input data4,
    input data5,
    input data6,
    input data7,
    input [2:0] sel,
    output reg result
);
    always @* begin
        case(sel)
            3'd0: result = data0;
            3'd1: result = data1;
            3'd2: result = data2;
            3'd3: result = data3;
            3'd4: result = data4;
            3'd5: result = data5;
            3'd6: result = data6;
            3'd7: result = data7;
            default: result = 1'b0;
        endcase
    end
endmodule
