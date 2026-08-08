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
// CREATED		"Sat Aug 08 18:44:46 2026"

module MPX2_16BIT(
	E,
	S,
	I0,
	I1,
	D
);


input wire	E;
input wire	S;
input wire	[15:0] I0;
input wire	[15:0] I1;
output wire	[15:0] D;

wire	[15:0] D_ALTERA_SYNTHESIZED;





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


MPX2	b2v_inst10(
	.I0(I0[10]),
	.I1(I1[10]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[10]));


MPX2	b2v_inst11(
	.I0(I0[11]),
	.I1(I1[11]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[11]));


MPX2	b2v_inst12(
	.I0(I0[12]),
	.I1(I1[12]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[12]));


MPX2	b2v_inst13(
	.I0(I0[13]),
	.I1(I1[13]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[13]));


MPX2	b2v_inst14(
	.I0(I0[14]),
	.I1(I1[14]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[14]));


MPX2	b2v_inst15(
	.I0(I0[15]),
	.I1(I1[15]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[15]));


MPX2	b2v_inst2(
	.I0(I0[2]),
	.I1(I1[2]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[2]));


MPX2	b2v_inst3(
	.I0(I0[3]),
	.I1(I1[3]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[3]));


MPX2	b2v_inst4(
	.I0(I0[4]),
	.I1(I1[4]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[4]));


MPX2	b2v_inst5(
	.I0(I0[5]),
	.I1(I1[5]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[5]));


MPX2	b2v_inst6(
	.I0(I0[6]),
	.I1(I1[6]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[6]));


MPX2	b2v_inst7(
	.I0(I0[7]),
	.I1(I1[7]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[7]));


MPX2	b2v_inst8(
	.I0(I0[8]),
	.I1(I1[8]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[8]));


MPX2	b2v_inst9(
	.I0(I0[9]),
	.I1(I1[9]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[9]));

assign	D = D_ALTERA_SYNTHESIZED;

endmodule
