module MUX16 (
	input wire [511:0] data,
	input wire [4:0] sel,
	output wire [15:0] result
);
	assign result = data[sel * 16 +: 16];
endmodule