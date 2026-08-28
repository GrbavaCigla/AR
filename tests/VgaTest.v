// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
// CREATED		"Fri Aug 28 14:15:58 2026"

module VgaTest(
	CLK,
	HS,
	VS,
	B,
	G,
	R
);


input wire	CLK;
output wire	HS;
output wire	VS;
output wire	[3:0] B;
output wire	[3:0] G;
output wire	[3:0] R;

reg	vga_clk;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_5;
wire	[0:9] SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_5 = 0;
assign	SYNTHESIZED_WIRE_6 = 0;




always@(posedge CLK)
begin
	begin
	vga_clk <= SYNTHESIZED_WIRE_0;
	end
end


Monitor	b2v_inst1(
	.clk(vga_clk),
	.SET_PIXEL(SYNTHESIZED_WIRE_5),
	.SET_BIT(SYNTHESIZED_WIRE_5),
	.XIN(SYNTHESIZED_WIRE_6),
	.YIN(SYNTHESIZED_WIRE_6),
	.hs(HS),
	.vs(VS),
	
	.B(B),
	.G(G),
	.R(R));



assign	SYNTHESIZED_WIRE_0 =  ~vga_clk;


endmodule
