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
// CREATED		"Thu Aug 13 02:51:28 2026"

module CMP4(
	A,
	B,
	G,
	E,
	L
);


input wire	[3:0] A;
input wire	[3:0] B;
output wire	G;
output wire	E;
output wire	L;

wire	jedan;
wire	nula;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;





CMP1	b2v_inst(
	.A(A[0]),
	.B(B[0]),
	.Gi_1(nula),
	.Ei_1(jedan),
	.Li_1(nula),
	.G(SYNTHESIZED_WIRE_0),
	.E(SYNTHESIZED_WIRE_1),
	.L(SYNTHESIZED_WIRE_2));


CMP1	b2v_inst14(
	.A(A[1]),
	.B(B[1]),
	.Gi_1(SYNTHESIZED_WIRE_0),
	.Ei_1(SYNTHESIZED_WIRE_1),
	.Li_1(SYNTHESIZED_WIRE_2),
	.G(SYNTHESIZED_WIRE_3),
	.E(SYNTHESIZED_WIRE_4),
	.L(SYNTHESIZED_WIRE_5));


CMP1	b2v_inst15(
	.A(A[2]),
	.B(B[2]),
	.Gi_1(SYNTHESIZED_WIRE_3),
	.Ei_1(SYNTHESIZED_WIRE_4),
	.Li_1(SYNTHESIZED_WIRE_5),
	.G(SYNTHESIZED_WIRE_6),
	.E(SYNTHESIZED_WIRE_7),
	.L(SYNTHESIZED_WIRE_8));


CMP1	b2v_inst16(
	.A(A[3]),
	.B(B[3]),
	.Gi_1(SYNTHESIZED_WIRE_6),
	.Ei_1(SYNTHESIZED_WIRE_7),
	.Li_1(SYNTHESIZED_WIRE_8),
	.G(G),
	.E(E),
	.L(L));



assign	jedan = 1;
assign	nula = 0;

endmodule
