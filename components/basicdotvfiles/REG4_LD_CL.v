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
// CREATED		"Sun Aug 16 01:18:03 2026"

module REG4_LD_CL(
	CL,
	clk,
	LD,
	I,
	A
);


input wire	CL;
input wire	clk;
input wire	LD;
input wire	[3:0] I;
output wire	[3:0] A;

wire	[3:0] A_ALTERA_SYNTHESIZED;





REG1_LD_CL	b2v_inst6(
	.LD(LD),
	.I(I[0]),
	.CL(CL),
	.clk(clk),
	.A(A_ALTERA_SYNTHESIZED[0]));


REG1_LD_CL	b2v_inst7(
	.LD(LD),
	.I(I[1]),
	.CL(CL),
	.clk(clk),
	.A(A_ALTERA_SYNTHESIZED[1]));


REG1_LD_CL	b2v_inst8(
	.LD(LD),
	.I(I[2]),
	.CL(CL),
	.clk(clk),
	.A(A_ALTERA_SYNTHESIZED[2]));


REG1_LD_CL	b2v_inst9(
	.LD(LD),
	.I(I[3]),
	.CL(CL),
	.clk(clk),
	.A(A_ALTERA_SYNTHESIZED[3]));

assign	A = A_ALTERA_SYNTHESIZED;

endmodule
