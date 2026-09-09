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
// CREATED		"Sat Aug 29 10:43:39 2026"

module MPX2_32BIT(
	E,
	S,
	I0,
	I1,
	D
);


input wire	E;
input wire	S;
input wire	[31:0] I0;
input wire	[31:0] I1;
output wire	[31:0] D;

wire	[31:0] D_ALTERA_SYNTHESIZED;





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


MPX2	b2v_inst16(
	.I0(I0[16]),
	.I1(I1[16]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[16]));


MPX2	b2v_inst17(
	.I0(I0[17]),
	.I1(I1[17]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[17]));


MPX2	b2v_inst18(
	.I0(I0[18]),
	.I1(I1[18]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[18]));


MPX2	b2v_inst19(
	.I0(I0[19]),
	.I1(I1[19]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[19]));


MPX2	b2v_inst2(
	.I0(I0[2]),
	.I1(I1[2]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[2]));


MPX2	b2v_inst20(
	.I0(I0[20]),
	.I1(I1[20]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[20]));


MPX2	b2v_inst21(
	.I0(I0[21]),
	.I1(I1[21]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[21]));


MPX2	b2v_inst22(
	.I0(I0[22]),
	.I1(I1[22]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[22]));


MPX2	b2v_inst23(
	.I0(I0[23]),
	.I1(I1[23]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[23]));


MPX2	b2v_inst24(
	.I0(I0[24]),
	.I1(I1[24]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[24]));


MPX2	b2v_inst25(
	.I0(I0[25]),
	.I1(I1[25]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[25]));


MPX2	b2v_inst26(
	.I0(I0[26]),
	.I1(I1[26]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[26]));


MPX2	b2v_inst27(
	.I0(I0[27]),
	.I1(I1[27]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[27]));


MPX2	b2v_inst28(
	.I0(I0[28]),
	.I1(I1[28]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[28]));


MPX2	b2v_inst29(
	.I0(I0[29]),
	.I1(I1[29]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[29]));


MPX2	b2v_inst3(
	.I0(I0[3]),
	.I1(I1[3]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[3]));


MPX2	b2v_inst30(
	.I0(I0[30]),
	.I1(I1[30]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[30]));


MPX2	b2v_inst31(
	.I0(I0[31]),
	.I1(I1[31]),
	.S(S),
	.E(E),
	.D(D_ALTERA_SYNTHESIZED[31]));


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
