module ComparatorX #(parameter integer size = 16) (
    input [size-1:0] A,
    input [size-1:0] B,
    output EQ,
    output LS,
    output GR
);
    assign EQ = (A == B);
    assign GR = (A > B);
    assign LS = (A < B);
endmodule
