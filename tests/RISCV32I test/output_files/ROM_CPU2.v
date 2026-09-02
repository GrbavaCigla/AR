module ROM_CPU2 (
    input  wire [9:0]  address,
    input  wire        clock,
    input  wire        rden,
    output reg  [31:0] q
);

always @(*)
begin
    case (address)

        10'h000: q = 32'h80000537;
        10'h001: q = 32'h20000637;
        10'h002: q = 32'h15400593;
        10'h003: q = 32'h00041837;
        10'h004: q = 32'h40000E37;
        10'h005: q = 32'h00100313;
        10'h006: q = 32'h00200893;
        10'h007: q = 32'h000376B7;
        10'h008: q = 32'h12C00793;
        10'h009: q = 32'h00F6E733;
        10'h00A: q = 32'h00A76733;
        10'h00B: q = 32'h00E62023;
        10'h00C: q = 32'h00178793;
        10'h00D: q = 32'hFEB798E3;
        10'h00E: q = 32'h40068693;
        10'h00F: q = 32'hFF0692E3;
        10'h010: q = 32'h01C62023;
        10'h011: q = 32'h0000006F;
        10'h012: q = 32'h00100893;
        10'h013: q = 32'h000376B7;
        10'h014: q = 32'hFD1FF06F;

        default: q = 32'h00000013; // NOP

    endcase
end

endmodule