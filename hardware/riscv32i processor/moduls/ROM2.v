// ModelSim/synthesis-friendly ROM2.
// Original configuration: 1024 words x 32 bits, registered output,
// synchronous address/enable, clear input.
//
// IMPORTANT:
// The original ROM2 uses Quartus altsyncram and InicializationData.mif.
// This version uses a plain Verilog memory so ModelSim does not need the
// Altera LPM/altera_mf design unit just to elaborate ROM2.
//
// Put a HEX file named "InicializationData.hex" next to the simulation
// working directory. It must contain up to 1024 32-bit hexadecimal words.
// For Quartus synthesis, the same memory can be initialized from the
// corresponding MIF in the Quartus project.

`timescale 1ns/1ps
module ROM2 (
    input              clock,
    input              aclr,
    input              rden,
    input      [9:0]   address,
    output reg [31:0]  q
);

    reg [31:0] mem [0:1023];
    integer i;

    initial begin
        for (i = 0; i < 1024; i = i + 1)
            mem[i] = 32'b0;
        // If the HEX file exists, it overrides the zero initialization.
        $readmemh("InicializationData.hex", mem);
    end

    always @(posedge clock) begin
        if (aclr)
            q <= 32'b0;
        else if (rden)
            q <= mem[address];
    end

endmodule
