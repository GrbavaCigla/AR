module counter_8bit (
    input wire       clock,
    input wire       cnt_en,
    input wire       sclr,
    output reg [7:0] q
);

always @(posedge clock) begin
    if (sclr)
        q <= 8'b00000000;

    else if (cnt_en)
        q <= q + 8'd1;
end

endmodule