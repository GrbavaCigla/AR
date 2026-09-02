module LEDPeripheral (
    input  wire        clk,
    input  wire        reset,

    input  wire        cs,
    input  wire        bus_wr,
    input  wire        bus_rd,

    input  wire [31:0] bus_wdata,
    output reg  [31:0] bus_rdata,

    output wire        ready,
    output wire        led
);

    // LED register
    reg led_reg;

    // ------------------------------------------------------------
    // WRITE
    // CPU upisuje bit 0 na LED adresu:
    //
    //   bus_wdata[0] = 1 -> LED ON
    //   bus_wdata[0] = 0 -> LED OFF
    // ------------------------------------------------------------
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            led_reg <= 1'b0;
        end
        else begin
            if (cs && bus_wr) begin
                led_reg <= bus_wdata[0];
            end
        end
    end

    // ------------------------------------------------------------
    // READ
    // CPU čita LED registar:
    //
    //   bit 0 = trenutna vrednost LED
    //   bitovi 31:1 = 0
    // ------------------------------------------------------------
    always @(*) begin
        if (cs && bus_rd) begin
            bus_rdata = {31'b0, led_reg};
        end
        else begin
            bus_rdata = 32'b0;
        end
    end

    // ------------------------------------------------------------
    // READY
    // Jednostavna periferija može biti ready odmah.
    // ------------------------------------------------------------
    assign ready = cs && (bus_wr || bus_rd);

    // ------------------------------------------------------------
    // Physical LED output
    // ------------------------------------------------------------
    assign led = led_reg;

endmodule