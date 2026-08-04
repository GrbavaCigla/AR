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
// CREATED		"Mon Jul 20 17:41:21 2026"

module REG32_LD_CL(
	CL,
	clk,
	LD,
	I,
	A
);


input wire	CL;
input wire	clk;
input wire	LD;
input wire	[31:0] I;
output wire	[31:0] A;

wire	[31:0] A_ALTERA_SYNTHESIZED;





REG16_LD_CL	b2v_inst(
	.LD(LD),
	.CL(CL),
	.clk(clk),
	.I(I[15:0]),
	.A(A_ALTERA_SYNTHESIZED[15:0]));


REG16_LD_CL	b2v_inst1(
	.LD(LD),
	.CL(CL),
	.clk(clk),
	.I(I[31:16]),
	.A(A_ALTERA_SYNTHESIZED[31:16]));

assign	A = A_ALTERA_SYNTHESIZED;

endmodule
