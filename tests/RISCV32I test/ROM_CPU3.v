module ROM_CPU3 (
    input  wire [9:0]  addr,
    output reg  [31:0] data
);

always @(*) begin
    case (addr)
        10'h000: data = 32'h02000137;
        10'h001: data = 32'h008000EF;
        10'h002: data = 32'h0000006F;
        10'h003: data = 32'h00100637;
        10'h004: data = 32'hFFF60613;
        10'h005: data = 32'h10000537;
        10'h006: data = 32'h800005B7;
        10'h007: data = 32'h200006B7;
        10'h008: data = 32'h40000837;
        10'h009: data = 32'h01900713;
        10'h00A: data = 32'h00052783;
        10'h00B: data = 32'hFFF70713;
        10'h00C: data = 32'h00C7F7B3;
        10'h00D: data = 32'h00B7E7B3;
        10'h00E: data = 32'h00F6A023;
        10'h00F: data = 32'hFE0716E3;
        10'h010: data = 32'h0106A023;
        10'h011: data = 32'hFE1FF06F;

        default: data = 32'h00000013;
    endcase
end

endmodule