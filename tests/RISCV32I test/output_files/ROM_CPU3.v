module ROM_CPU3 (
    input  wire [9:0]  addr,
    output reg  [31:0] data
);

always @(*) begin
    case (addr)
        10'h000: data = 32'h00000693;
        10'h001: data = 32'h200005B7;
        10'h002: data = 32'h32000613;
        10'h003: data = 32'h00096537;
        10'h004: data = 32'h00000793;
        10'h005: data = 32'h00F6E733;
        10'h006: data = 32'h00E5A023;
        10'h007: data = 32'h00178793;
        10'h008: data = 32'hFEC79AE3;
        10'h009: data = 32'h40068693;
        10'h00A: data = 32'hFEA694E3;
        10'h00B: data = 32'h19000613;
        10'h00C: data = 32'h00060813;
        10'h00D: data = 32'h000326B7;
        10'h00E: data = 32'h00000893;
        10'h00F: data = 32'h80000537;
        10'h010: data = 32'h200005B7;
        10'h011: data = 32'h0C700E13;
        10'h012: data = 32'h00064337;
        10'h013: data = 32'h05066263;
        10'h014: data = 32'h00080793;
        10'h015: data = 32'h3FF7F713;
        10'h016: data = 32'h00D76733;
        10'h017: data = 32'h00178793;
        10'h018: data = 32'h01079793;
        10'h019: data = 32'h00A76733;
        10'h01A: data = 32'h0107D793;
        10'h01B: data = 32'h00E5A023;
        10'h01C: data = 32'hFEF672E3;
        10'h01D: data = 32'h09688793;
        10'h01E: data = 32'h02FE6663;
        10'h01F: data = 32'h40068693;
        10'h020: data = 32'h04668463;
        10'h021: data = 32'h01066E63;
        10'h022: data = 32'h00078893;
        10'h023: data = 32'hFC5FF06F;
        10'h024: data = 32'h09688793;
        10'h025: data = 32'h00FE6863;
        10'h026: data = 32'h40068693;
        10'h027: data = 32'h02668663;
        10'h028: data = 32'h00078893;
        10'h029: data = 32'hFFF80813;
        10'h02A: data = 32'h00160613;
        10'h02B: data = 32'h01081813;
        10'h02C: data = 32'h01061613;
        10'h02D: data = 32'h40068693;
        10'h02E: data = 32'h01085813;
        10'h02F: data = 32'h01065613;
        10'h030: data = 32'hFCE88893;
        10'h031: data = 32'hF86694E3;
        10'h032: data = 32'h200007B7;
        10'h033: data = 32'h40000737;
        10'h034: data = 32'h00E7A023;
        10'h035: data = 32'h0000006F;

        default: data = 32'h00000013;
    endcase
end

endmodule