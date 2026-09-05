module ROM_CPU3 (
    input  wire [9:0]  addr,
    output reg  [31:0] data
);

always @(*) begin
    case (addr)
        10'h000: data = 32'h02000137;
        10'h001: data = 32'h008000EF;
        10'h002: data = 32'h0000006F;
        10'h003: data = 32'h80010113;
        10'h004: data = 32'hD8010113;
        10'h005: data = 32'h001005B7;
        10'h006: data = 32'h10000E37;
        10'h007: data = 32'hA8010F13;
        10'h008: data = 32'hC0058593;
        10'h009: data = 32'h038E0E13;
        10'h00A: data = 32'h00000813;
        10'h00B: data = 32'h100002B7;
        10'h00C: data = 32'h80000537;
        10'h00D: data = 32'h20000637;
        10'h00E: data = 32'h400003B7;
        10'h00F: data = 32'h29D00E93;
        10'h010: data = 32'h0002A783;
        10'h011: data = 32'h0017F793;
        10'h012: data = 32'hFE078CE3;
        10'h013: data = 32'h10000337;
        10'h014: data = 32'h00832883;
        10'h015: data = 32'h00080793;
        10'h016: data = 32'h00830313;
        10'h017: data = 32'h0148D813;
        10'h018: data = 32'h3FF87813;
        10'h019: data = 32'h04F86063;
        10'h01A: data = 32'h030EE063;
        10'h01B: data = 32'h00A8D713;
        10'h01C: data = 32'h00281793;
        10'h01D: data = 32'h00FF07B3;
        10'h01E: data = 32'h3FF77713;
        10'h01F: data = 32'h3FF8F893;
        10'h020: data = 32'h58E79423;
        10'h021: data = 32'h59179523;
        10'h022: data = 32'h00430313;
        10'h023: data = 32'hFBC30AE3;
        10'h024: data = 32'h00032883;
        10'h025: data = 32'h00080793;
        10'h026: data = 32'h0148D813;
        10'h027: data = 32'h3FF87813;
        10'h028: data = 32'hFCF874E3;
        10'h029: data = 32'h00810713;
        10'h02A: data = 32'h00275783;
        10'h02B: data = 32'h00075683;
        10'h02C: data = 32'h00470713;
        10'h02D: data = 32'h00A79793;
        10'h02E: data = 32'h00B7F7B3;
        10'h02F: data = 32'h3FF6F693;
        10'h030: data = 32'h00D7E7B3;
        10'h031: data = 32'h00A7E7B3;
        10'h032: data = 32'h00F62023;
        10'h033: data = 32'h7FF10793;
        10'h034: data = 32'h28178793;
        10'h035: data = 32'hFCE79AE3;
        10'h036: data = 32'h00762023;
        10'h037: data = 32'hF8DFF06F;

        default: data = 32'h00000013;
    endcase
end

endmodule