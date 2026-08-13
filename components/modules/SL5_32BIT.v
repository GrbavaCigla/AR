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
// CREATED		"Thu Aug 13 02:54:55 2026"

module SL5_32BIT(
	A,
	B,
	X
);


input wire	[31:0] A;
input wire	[4:0] B;
output wire	[31:0] X;

wire	[31:0] A1_;
wire	[31:0] A2_;
wire	[31:0] A3_;
wire	[31:0] A4_;
wire	[31:0] Asr1_;
wire	[31:0] Asr2_;
wire	[31:0] Asr3_;
wire	[31:0] Asr4_;
wire	[31:0] Asr5_;
wire	jedan;
wire	nula;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_7;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	[31:0] SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_11;
wire	[31:0] SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_13;
wire	[31:0] SYNTHESIZED_WIRE_14;
wire	[31:0] SYNTHESIZED_WIRE_15;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	[31:0] SYNTHESIZED_WIRE_17;
wire	[31:0] SYNTHESIZED_WIRE_18;
wire	[31:0] SYNTHESIZED_WIRE_19;
wire	[31:0] SYNTHESIZED_WIRE_20;
wire	[31:0] SYNTHESIZED_WIRE_21;
wire	[31:0] SYNTHESIZED_WIRE_22;
wire	[31:0] SYNTHESIZED_WIRE_23;
wire	[31:0] SYNTHESIZED_WIRE_24;
wire	[31:0] SYNTHESIZED_WIRE_25;





MPX2_32BIT	b2v_inst(
	.S(B[0]),
	.E(jedan),
	.I0(A),
	.I1(Asr1_),
	.D(A1_));



SL_32BIT	b2v_inst10(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_0),
	.B(SYNTHESIZED_WIRE_1));


SL_32BIT	b2v_inst11(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_1),
	.B(SYNTHESIZED_WIRE_4));


SL_32BIT	b2v_inst12(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_2),
	.B(SYNTHESIZED_WIRE_5));


SL_32BIT	b2v_inst13(
	.C0(nula),
	.A(A2_),
	.B(SYNTHESIZED_WIRE_3));


SL_32BIT	b2v_inst14(
	.C0(nula),
	.A(A1_),
	.B(SYNTHESIZED_WIRE_9));


SL_32BIT	b2v_inst15(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_3),
	.B(SYNTHESIZED_WIRE_8));


SL_32BIT	b2v_inst16(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_4),
	.B(SYNTHESIZED_WIRE_6));


SL_32BIT	b2v_inst17(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_5),
	.B(SYNTHESIZED_WIRE_7));


SL_32BIT	b2v_inst18(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_6),
	.B(Asr5_));


SL_32BIT	b2v_inst19(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_7),
	.B(Asr4_));



SL_32BIT	b2v_inst20(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_8),
	.B(SYNTHESIZED_WIRE_10));


SL_32BIT	b2v_inst21(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_9),
	.B(Asr2_));


SL_32BIT	b2v_inst22(
	.C0(nula),
	.A(A),
	.B(Asr1_));


SL_32BIT	b2v_inst23(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_10),
	.B(Asr3_));


SL_32BIT	b2v_inst24(
	.C0(nula),
	.A(A3_),
	.B(SYNTHESIZED_WIRE_11));


SL_32BIT	b2v_inst25(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_11),
	.B(SYNTHESIZED_WIRE_12));


SL_32BIT	b2v_inst26(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_12),
	.B(SYNTHESIZED_WIRE_13));


SL_32BIT	b2v_inst27(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_13),
	.B(SYNTHESIZED_WIRE_25));


SL_32BIT	b2v_inst28(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_14),
	.B(SYNTHESIZED_WIRE_15));


SL_32BIT	b2v_inst29(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_15),
	.B(SYNTHESIZED_WIRE_16));


SL_32BIT	b2v_inst30(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_16),
	.B(SYNTHESIZED_WIRE_17));


SL_32BIT	b2v_inst31(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_17),
	.B(SYNTHESIZED_WIRE_24));


SL_32BIT	b2v_inst32(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_18),
	.B(SYNTHESIZED_WIRE_19));


SL_32BIT	b2v_inst33(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_19),
	.B(SYNTHESIZED_WIRE_20));


SL_32BIT	b2v_inst34(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_20),
	.B(SYNTHESIZED_WIRE_21));


SL_32BIT	b2v_inst35(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_21),
	.B(SYNTHESIZED_WIRE_14));


SL_32BIT	b2v_inst36(
	.C0(nula),
	.A(A3_),
	.B(SYNTHESIZED_WIRE_22));


SL_32BIT	b2v_inst38(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_22),
	.B(SYNTHESIZED_WIRE_23));


SL_32BIT	b2v_inst39(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_23),
	.B(SYNTHESIZED_WIRE_18));


MPX2_32BIT	b2v_inst4(
	.S(B[1]),
	.E(jedan),
	.I0(A1_),
	.I1(Asr2_),
	.D(A2_));


MPX2_32BIT	b2v_inst5(
	.S(B[2]),
	.E(jedan),
	.I0(A2_),
	.I1(Asr3_),
	.D(A3_));


MPX2_32BIT	b2v_inst6(
	.S(B[3]),
	.E(jedan),
	.I0(A3_),
	.I1(Asr4_),
	.D(A4_));


MPX2_32BIT	b2v_inst7(
	.S(B[4]),
	.E(jedan),
	.I0(A4_),
	.I1(Asr5_),
	.D(X));


SL_32BIT	b2v_inst8(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_24),
	.B(SYNTHESIZED_WIRE_0));


SL_32BIT	b2v_inst9(
	.C0(nula),
	.A(SYNTHESIZED_WIRE_25),
	.B(SYNTHESIZED_WIRE_2));

assign	jedan = 1;
assign	nula = 0;

endmodule
