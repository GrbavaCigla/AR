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
// CREATED		"Tue Sep 01 18:20:28 2026"

module VgaTest2_1(
	CLK,
	VS,
	HS,
	B,
	G,
	OUT,
	R
);


input wire	CLK;
output wire	VS;
output wire	HS;
output wire	[3:0] B;
output wire	[3:0] G;
output wire	[7:0] OUT;
output wire	[3:0] R;

wire	SYNTHESIZED_WIRE_5;
wire	[0:9] SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_5 = 0;
assign	SYNTHESIZED_WIRE_6 = 0;




Monitor	b2v_inst(
	.clk(CLK),
	.SET_PIXEL(SYNTHESIZED_WIRE_5),
	.SET_BIT(SYNTHESIZED_WIRE_5),
	.FB_SEL(SYNTHESIZED_WIRE_5),
	.XIN(SYNTHESIZED_WIRE_6),
	.YIN(SYNTHESIZED_WIRE_6),
	.hs(HS),
	.vs(VS),
	
	.B(B),
	.G(G),
	.OUT(OUT),
	.R(R));




endmodule
