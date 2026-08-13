// ============================================================
// File Name: RAM2.v
// Verilog equivalent of RAM2.vhd (Altera altsyncram megafunction)
//
// Dual-port RAM, 1024 x 32
//   - Port A: write (wraddress, data, wren) synchronous to clock
//   - Port B: read (rdaddress -> q), address registered on clock,
//             output unregistered (same behavior as the original
//             ADDRESS_REG_B = "CLOCK0", OUTDATA_REG_B = "UNREGISTERED")
//
// Intended for synthesis on Cyclone III (infers M9K block RAM
// when compiled with Quartus).
// ============================================================

module RAM2 (
    input  wire        clock,
    input  wire [31:0] data,
    input  wire [9:0]  rdaddress,
    input  wire [9:0]  wraddress,
    input  wire        wren,
    output wire [31:0] q
);

    reg [31:0] mem [0:1023];
    reg [9:0]  rdaddress_reg;

    // Write port (port A)
    always @(posedge clock) begin
        if (wren)
            mem[wraddress] <= data;
    end

    // Registered read address (port B), matches ADDRESS_REG_B = CLOCK0
    always @(posedge clock) begin
        rdaddress_reg <= rdaddress;
    end

    // Unregistered output, read using the registered address
    assign q = mem[rdaddress_reg];

endmodule
