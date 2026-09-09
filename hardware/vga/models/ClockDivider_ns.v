module ClockDivider #(
    parameter integer period_in_MHz = 50,
    parameter integer period_out_ns = 1000000
) (
    input CLK_IN,
    input RST,
    input PAUSE,
    output reg CLK_OUT
);
    localparam integer HALF_PERIOD = (period_out_ns * period_in_MHz) / 2000;
    integer cnt;
    always @(posedge CLK_IN) begin
        if (RST) begin
            cnt <= HALF_PERIOD - 1;
            CLK_OUT <= 1'b0;
        end else if (!PAUSE) begin
            if (cnt == 0) begin
                cnt <= HALF_PERIOD - 1;
                CLK_OUT <= ~CLK_OUT;
            end else begin
                cnt <= cnt - 1;
            end
        end
    end
endmodule
