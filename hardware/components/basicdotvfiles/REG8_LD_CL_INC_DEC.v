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
// CREATED		"Thu Aug 13 14:16:17 2026"

module REG8_LD_CL_INC_DEC(
	CL,
	clk,
	LD,
	INC,
	DEC,
	C0,
	E0,
	I,
	E8,
	C8,
	A
);


input wire	CL;
input wire	clk;
input wire	LD;
input wire	INC;
input wire	DEC;
input wire	C0;
input wire	E0;
input wire	[7:0] I;
output wire	E8;
output wire	C8;
output wire	[7:0] A;

wire	[7:0] A_ALTERA_SYNTHESIZED;
wire	C1;
wire	C2;
wire	C3;
wire	C4;
wire	C5;
wire	C6;
wire	C7;
wire	E1;
wire	E2;
wire	E3;
wire	E4;
wire	E5;
wire	E6;
wire	E7;





REG1_LD_CL_INC_DEC	b2v_inst(
	.LD(LD),
	.I(I[0]),
	.Ci(C0),
	.INC(INC),
	.Ei(E0),
	.DEC(DEC),
	.CL(CL),
	.clk(clk),
	.A(A_ALTERA_SYNTHESIZED[0]),
	.Ci_1(C1),
	.Ei_1(E1));


REG1_LD_CL_INC_DEC	b2v_inst1(
	.LD(LD),
	.I(I[1]),
	.Ci(C1),
	.INC(INC),
	.Ei(E1),
	.DEC(DEC),
	.CL(CL),
	.clk(clk),
	.A(A_ALTERA_SYNTHESIZED[1]),
	.Ci_1(C2),
	.Ei_1(E2));


REG1_LD_CL_INC_DEC	b2v_inst2(
	.LD(LD),
	.I(I[2]),
	.Ci(C2),
	.INC(INC),
	.Ei(E2),
	.DEC(DEC),
	.CL(CL),
	.clk(clk),
	.A(A_ALTERA_SYNTHESIZED[2]),
	.Ci_1(C3),
	.Ei_1(E3));


REG1_LD_CL_INC_DEC	b2v_inst3(
	.LD(LD),
	.I(I[3]),
	.Ci(C3),
	.INC(INC),
	.Ei(E3),
	.DEC(DEC),
	.CL(CL),
	.clk(clk),
	.A(A_ALTERA_SYNTHESIZED[3]),
	.Ci_1(C4),
	.Ei_1(E4));


REG1_LD_CL_INC_DEC	b2v_inst6(
	.LD(LD),
	.I(I[4]),
	.Ci(C4),
	.INC(INC),
	.Ei(E4),
	.DEC(DEC),
	.CL(CL),
	.clk(clk),
	.A(A_ALTERA_SYNTHESIZED[4]),
	.Ci_1(C5),
	.Ei_1(E5));


REG1_LD_CL_INC_DEC	b2v_inst7(
	.LD(LD),
	.I(I[5]),
	.Ci(C5),
	.INC(INC),
	.Ei(E5),
	.DEC(DEC),
	.CL(CL),
	.clk(clk),
	.A(A_ALTERA_SYNTHESIZED[5]),
	.Ci_1(C6),
	.Ei_1(E6));


REG1_LD_CL_INC_DEC	b2v_inst8(
	.LD(LD),
	.I(I[6]),
	.Ci(C6),
	.INC(INC),
	.Ei(E6),
	.DEC(DEC),
	.CL(CL),
	.clk(clk),
	.A(A_ALTERA_SYNTHESIZED[6]),
	.Ci_1(C7),
	.Ei_1(E7));


REG1_LD_CL_INC_DEC	b2v_inst9(
	.LD(LD),
	.I(I[7]),
	.Ci(C7),
	.INC(INC),
	.Ei(E7),
	.DEC(DEC),
	.CL(CL),
	.clk(clk),
	.A(A_ALTERA_SYNTHESIZED[7]),
	.Ci_1(C8),
	.Ei_1(E8));

assign	A = A_ALTERA_SYNTHESIZED;

endmodule
