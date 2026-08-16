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
// CREATED		"Sun Aug 16 01:19:10 2026"

module ADD2(
	C_0,
	A,
	B,
	C,
	OUT
);


input wire	C_0;
input wire	[1:0] A;
input wire	[1:0] B;
output wire	C;
output wire	[1:0] OUT;

wire	[1:0] OUT_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;





ADD1	b2v_inst(
	.A(A[0]),
	.B(B[0]),
	.C_0(C_0),
	.OUT(OUT_ALTERA_SYNTHESIZED[0]),
	.C(SYNTHESIZED_WIRE_0));


ADD1	b2v_inst2(
	.A(A[1]),
	.B(B[1]),
	.C_0(SYNTHESIZED_WIRE_0),
	.OUT(OUT_ALTERA_SYNTHESIZED[1]),
	.C(C));

assign	OUT = OUT_ALTERA_SYNTHESIZED;

endmodule
