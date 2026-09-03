module ROM_CPU3 (
    input  wire [9:0]  addr,
    output reg  [31:0] data
);

always @(*) begin
    case (addr)
        10'h000: data = 32'h02000137;
        10'h001: data = 32'h008000EF;
        10'h002: data = 32'h0000006F;
        10'h003: data = 32'h001005B7;
        10'h004: data = 32'hFFF58593;
        10'h005: data = 32'h00000693;
        10'h006: data = 32'h10000737;
        10'h007: data = 32'h80000837;
        10'h008: data = 32'h20000637;
        10'h009: data = 32'h29B00513;
        10'h00A: data = 32'h400008B7;
        10'h00B: data = 32'h00072783;
        10'h00C: data = 32'hFE07DEE3;
        10'h00D: data = 32'h00B7F7B3;
        10'h00E: data = 32'h0107E7B3;
        10'h00F: data = 32'h00F62023;
        10'h010: data = 32'h00A68663;
        10'h011: data = 32'h00168693;
        10'h012: data = 32'hFE5FF06F;
        10'h013: data = 32'h01162023;
        10'h014: data = 32'h00100693;
        10'h015: data = 32'hFD9FF06F;

        default: data = 32'h00000013;
    endcase
end

endmodule