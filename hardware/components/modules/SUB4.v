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
// CREATED		"Mon Jul 20 16:31:06 2026"

module SUB4(
	E_0,
	A,
	B,
	E,
	OUT
);


input wire	E_0;
input wire	[3:0] A;
input wire	[3:0] B;
output wire	E;
output wire	[3:0] OUT;

wire	[3:0] OUT_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;





SUB2	b2v_inst(
	.E_0(E_0),
	.A(A[1:0]),
	.B(B[1:0]),
	.E(SYNTHESIZED_WIRE_0),
	.OUT(OUT_ALTERA_SYNTHESIZED[1:0]));


SUB2	b2v_inst1(
	.E_0(SYNTHESIZED_WIRE_0),
	.A(A[3:2]),
	.B(B[3:2]),
	.E(E),
	.OUT(OUT_ALTERA_SYNTHESIZED[3:2]));

assign	OUT = OUT_ALTERA_SYNTHESIZED;

endmodule
