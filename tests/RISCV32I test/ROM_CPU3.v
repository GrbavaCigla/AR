module ROM_CPU3 (
    input  wire [9:0]  addr,
    output reg  [31:0] data
);

always @(*) begin
    case (addr)
        10'h000: data = 32'h02000137;
        10'h001: data = 32'h038000EF;
        10'h002: data = 32'h0000006F;
        10'h003: data = 32'h00000693;
        10'h004: data = 32'h200005B7;
        10'h005: data = 32'h00096637;
        10'h006: data = 32'h32000513;
        10'h007: data = 32'h00000793;
        10'h008: data = 32'h00D7E733;
        10'h009: data = 32'h00E5A023;
        10'h00A: data = 32'h40078793;
        10'h00B: data = 32'hFEC79AE3;
        10'h00C: data = 32'h00168693;
        10'h00D: data = 32'hFEA694E3;
        10'h00E: data = 32'h00008067;
        10'h00F: data = 32'hFF010113;
        10'h010: data = 32'h00812423;
        10'h011: data = 32'h00912223;
        10'h012: data = 32'h20000437;
        10'h013: data = 32'h400004B7;
        10'h014: data = 32'h00112623;
        10'h015: data = 32'hFB9FF0EF;
        10'h016: data = 32'h00942023;
        10'h017: data = 32'hFB1FF0EF;
        10'h018: data = 32'h00010737;
        10'h019: data = 32'h00100837;
        10'h01A: data = 32'hFFF70713;
        10'h01B: data = 32'hC0080813;
        10'h01C: data = 32'h00000693;
        10'h01D: data = 32'h10000E37;
        10'h01E: data = 32'h80000337;
        10'h01F: data = 32'h7D000893;
        10'h020: data = 32'h000965B7;
        10'h021: data = 32'h32000613;
        10'h022: data = 32'h000E2783;
        10'h023: data = 32'hFE07DEE3;
        10'h024: data = 32'h0147D513;
        10'h025: data = 32'h3FF57513;
        10'h026: data = 32'hFEE508E3;
        10'h027: data = 32'h00A79713;
        10'h028: data = 32'h00A7D793;
        10'h029: data = 32'h01077733;
        10'h02A: data = 32'h3FF7F793;
        10'h02B: data = 32'h00F767B3;
        10'h02C: data = 32'h0067E7B3;
        10'h02D: data = 32'h00168693;
        10'h02E: data = 32'h00F42023;
        10'h02F: data = 32'h01168663;
        10'h030: data = 32'h00050713;
        10'h031: data = 32'hFC5FF06F;
        10'h032: data = 32'h00942023;
        10'h033: data = 32'h00000793;
        10'h034: data = 32'h00000713;
        10'h035: data = 32'h00F766B3;
        10'h036: data = 32'h00D42023;
        10'h037: data = 32'h40070713;
        10'h038: data = 32'hFEB71AE3;
        10'h039: data = 32'h00178793;
        10'h03A: data = 32'hFEC794E3;
        10'h03B: data = 32'h00000693;
        10'h03C: data = 32'h00050713;
        10'h03D: data = 32'hF95FF06F;

        default: data = 32'h00000013;
    endcase
end

endmodule