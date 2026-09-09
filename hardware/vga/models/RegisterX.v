module RegisterX #(parameter integer size = 16, parameter integer default_value = 0) (
    input CLK, input LD, input CL, input INC, input DEC,
    input [size-1:0] DATA_IN, output reg [size-1:0] DATA_OUT
);
    initial DATA_OUT = default_value;
    always @(posedge CLK) begin
        if (CL) DATA_OUT <= {size{1'b0}};
        else if (LD) DATA_OUT <= DATA_IN;
        else if (INC) DATA_OUT <= DATA_OUT + {{(size-1){1'b0}},1'b1};
        else if (DEC) DATA_OUT <= DATA_OUT - {{(size-1){1'b0}},1'b1};
    end
endmodule
