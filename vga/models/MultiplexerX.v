module MultiplexerX #(parameter integer size = 16) (
    input [size-1:0] I0, input [size-1:0] I1,
    input S, output [size-1:0] Y
);
    assign Y = S ? I1 : I0;
endmodule
