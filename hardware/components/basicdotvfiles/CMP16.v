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
// CREATED		"Thu Aug 13 14:17:08 2026"

module CMP16(
	A,
	B,
	G,
	E,
	L
);


input wire	[15:0] A;
input wire	[15:0] B;
output wire	G;
output wire	E;
output wire	L;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;





CMP8	b2v_inst(
	.A(A[7:0]),
	.B(B[7:0]),
	.G(SYNTHESIZED_WIRE_6),
	.E(SYNTHESIZED_WIRE_7),
	.L(SYNTHESIZED_WIRE_8));


CMP1	b2v_inst10(
	.A(A[14]),
	.B(B[14]),
	.Gi_1(SYNTHESIZED_WIRE_0),
	.Ei_1(SYNTHESIZED_WIRE_1),
	.Li_1(SYNTHESIZED_WIRE_2),
	.G(SYNTHESIZED_WIRE_3),
	.E(SYNTHESIZED_WIRE_4),
	.L(SYNTHESIZED_WIRE_5));


CMP1	b2v_inst11(
	.A(A[15]),
	.B(B[15]),
	.Gi_1(SYNTHESIZED_WIRE_3),
	.Ei_1(SYNTHESIZED_WIRE_4),
	.Li_1(SYNTHESIZED_WIRE_5),
	.G(G),
	.E(E),
	.L(L));


CMP1	b2v_inst2(
	.A(A[8]),
	.B(B[8]),
	.Gi_1(SYNTHESIZED_WIRE_6),
	.Ei_1(SYNTHESIZED_WIRE_7),
	.Li_1(SYNTHESIZED_WIRE_8),
	.G(SYNTHESIZED_WIRE_9),
	.E(SYNTHESIZED_WIRE_10),
	.L(SYNTHESIZED_WIRE_11));


CMP1	b2v_inst3(
	.A(A[9]),
	.B(B[9]),
	.Gi_1(SYNTHESIZED_WIRE_9),
	.Ei_1(SYNTHESIZED_WIRE_10),
	.Li_1(SYNTHESIZED_WIRE_11),
	.G(SYNTHESIZED_WIRE_12),
	.E(SYNTHESIZED_WIRE_13),
	.L(SYNTHESIZED_WIRE_14));


CMP1	b2v_inst4(
	.A(A[10]),
	.B(B[10]),
	.Gi_1(SYNTHESIZED_WIRE_12),
	.Ei_1(SYNTHESIZED_WIRE_13),
	.Li_1(SYNTHESIZED_WIRE_14),
	.G(SYNTHESIZED_WIRE_15),
	.E(SYNTHESIZED_WIRE_16),
	.L(SYNTHESIZED_WIRE_17));


CMP1	b2v_inst5(
	.A(A[11]),
	.B(B[11]),
	.Gi_1(SYNTHESIZED_WIRE_15),
	.Ei_1(SYNTHESIZED_WIRE_16),
	.Li_1(SYNTHESIZED_WIRE_17),
	.G(SYNTHESIZED_WIRE_18),
	.E(SYNTHESIZED_WIRE_19),
	.L(SYNTHESIZED_WIRE_20));


CMP1	b2v_inst7(
	.A(A[12]),
	.B(B[12]),
	.Gi_1(SYNTHESIZED_WIRE_18),
	.Ei_1(SYNTHESIZED_WIRE_19),
	.Li_1(SYNTHESIZED_WIRE_20),
	.G(SYNTHESIZED_WIRE_21),
	.E(SYNTHESIZED_WIRE_22),
	.L(SYNTHESIZED_WIRE_23));


CMP1	b2v_inst8(
	.A(A[13]),
	.B(B[13]),
	.Gi_1(SYNTHESIZED_WIRE_21),
	.Ei_1(SYNTHESIZED_WIRE_22),
	.Li_1(SYNTHESIZED_WIRE_23),
	.G(SYNTHESIZED_WIRE_0),
	.E(SYNTHESIZED_WIRE_1),
	.L(SYNTHESIZED_WIRE_2));


endmodule
