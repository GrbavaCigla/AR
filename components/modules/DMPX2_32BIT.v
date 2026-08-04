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
// CREATED		"Tue Aug 04 22:57:38 2026"

module DMPX2_32BIT(
	E,
	S,
	I,
	D0,
	D1
);


input wire	E;
input wire	S;
input wire	[31:0] I;
output wire	[31:0] D0;
output wire	[31:0] D1;

wire	[31:0] D_ALTERA_SYNTHESIZED0;
wire	[31:0] D_ALTERA_SYNTHESIZED1;





DMPX2	b2v_inst0(
	.I0(I[0]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[0]),
	.D1(D_ALTERA_SYNTHESIZED1[0]));


DMPX2	b2v_inst1(
	.I0(I[1]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[1]),
	.D1(D_ALTERA_SYNTHESIZED1[1]));


DMPX2	b2v_inst10(
	.I0(I[10]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[10]),
	.D1(D_ALTERA_SYNTHESIZED1[10]));


DMPX2	b2v_inst11(
	.I0(I[11]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[11]),
	.D1(D_ALTERA_SYNTHESIZED1[11]));


DMPX2	b2v_inst12(
	.I0(I[12]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[12]),
	.D1(D_ALTERA_SYNTHESIZED1[12]));


DMPX2	b2v_inst13(
	.I0(I[13]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[13]),
	.D1(D_ALTERA_SYNTHESIZED1[13]));


DMPX2	b2v_inst14(
	.I0(I[14]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[14]),
	.D1(D_ALTERA_SYNTHESIZED1[14]));


DMPX2	b2v_inst15(
	.I0(I[15]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[15]),
	.D1(D_ALTERA_SYNTHESIZED1[15]));


DMPX2	b2v_inst16(
	.I0(I[16]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[16]),
	.D1(D_ALTERA_SYNTHESIZED1[16]));


DMPX2	b2v_inst17(
	.I0(I[17]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[17]),
	.D1(D_ALTERA_SYNTHESIZED1[17]));


DMPX2	b2v_inst18(
	.I0(I[18]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[18]),
	.D1(D_ALTERA_SYNTHESIZED1[18]));


DMPX2	b2v_inst19(
	.I0(I[19]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[19]),
	.D1(D_ALTERA_SYNTHESIZED1[19]));


DMPX2	b2v_inst2(
	.I0(I[2]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[2]),
	.D1(D_ALTERA_SYNTHESIZED1[2]));


DMPX2	b2v_inst20(
	.I0(I[20]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[20]),
	.D1(D_ALTERA_SYNTHESIZED1[20]));


DMPX2	b2v_inst21(
	.I0(I[21]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[21]),
	.D1(D_ALTERA_SYNTHESIZED1[21]));


DMPX2	b2v_inst22(
	.I0(I[22]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[22]),
	.D1(D_ALTERA_SYNTHESIZED1[22]));


DMPX2	b2v_inst23(
	.I0(I[23]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[23]),
	.D1(D_ALTERA_SYNTHESIZED1[23]));


DMPX2	b2v_inst24(
	.I0(I[24]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[24]),
	.D1(D_ALTERA_SYNTHESIZED1[24]));


DMPX2	b2v_inst25(
	.I0(I[25]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[25]),
	.D1(D_ALTERA_SYNTHESIZED1[25]));


DMPX2	b2v_inst26(
	.I0(I[26]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[26]),
	.D1(D_ALTERA_SYNTHESIZED1[26]));


DMPX2	b2v_inst27(
	.I0(I[27]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[27]),
	.D1(D_ALTERA_SYNTHESIZED1[27]));


DMPX2	b2v_inst28(
	.I0(I[28]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[28]),
	.D1(D_ALTERA_SYNTHESIZED1[28]));


DMPX2	b2v_inst29(
	.I0(I[29]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[29]),
	.D1(D_ALTERA_SYNTHESIZED1[29]));


DMPX2	b2v_inst3(
	.I0(I[3]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[3]),
	.D1(D_ALTERA_SYNTHESIZED1[3]));


DMPX2	b2v_inst30(
	.I0(I[30]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[30]),
	.D1(D_ALTERA_SYNTHESIZED1[30]));


DMPX2	b2v_inst31(
	.I0(I[31]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[31]),
	.D1(D_ALTERA_SYNTHESIZED1[31]));


DMPX2	b2v_inst4(
	.I0(I[4]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[4]),
	.D1(D_ALTERA_SYNTHESIZED1[4]));


DMPX2	b2v_inst5(
	.I0(I[5]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[5]),
	.D1(D_ALTERA_SYNTHESIZED1[5]));


DMPX2	b2v_inst6(
	.I0(I[6]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[6]),
	.D1(D_ALTERA_SYNTHESIZED1[6]));


DMPX2	b2v_inst7(
	.I0(I[7]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[7]),
	.D1(D_ALTERA_SYNTHESIZED1[7]));


DMPX2	b2v_inst8(
	.I0(I[8]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[8]),
	.D1(D_ALTERA_SYNTHESIZED1[8]));


DMPX2	b2v_inst9(
	.I0(I[9]),
	.S(S),
	.E(E),
	.D0(D_ALTERA_SYNTHESIZED0[9]),
	.D1(D_ALTERA_SYNTHESIZED1[9]));

assign	D0 = D_ALTERA_SYNTHESIZED0;
assign	D1 = D_ALTERA_SYNTHESIZED1;

endmodule
