module FrameBufferRAM (
    input [15:0] address,
    input clock,
    input [7:0] data,
    input wren,
    output reg [7:0] q
);
    reg [7:0] mem [0:38399];
    always @(posedge clock) begin
        if (wren) begin
            mem[address] <= data;
            q <= data;
        end else begin
            q <= mem[address];
        end
    end
endmodule
