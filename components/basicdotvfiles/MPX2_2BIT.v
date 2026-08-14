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
// CREATED		"Thu Aug 13 14:17:44 2026"

module MPX2_2BIT(
	S,
	E,
	I0,
	I1,
	D
);


input wire	S;
input wire	E;
input wire	[1:0] I0;
input wire	[1:0] I1;
output wire	[1:0] D;

wire	[1:0] D_ALTERA_SYNTHESIZED;





MPX2	b2v_inst0(
	.I0(I0[0]),
	.I1(I1[0]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[0]));


MPX2	b2v_inst1(
	.I0(I0[1]),
	.I1(I1[1]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[1]));

assign	D = D_ALTERA_SYNTHESIZED;

endmodule
