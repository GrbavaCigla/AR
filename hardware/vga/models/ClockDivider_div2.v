module ClockDivider_div2 (
    input CLK_IN,
    input RST,
    input PAUSE,
    output reg CLK_OUT
);
    always @(posedge CLK_IN) begin
        if (RST)
            CLK_OUT <= 1'b0;
        else if (!PAUSE)
            CLK_OUT <= ~CLK_OUT;
    end
endmodule
