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
// CREATED		"Tue Jul 21 02:09:01 2026"

module REG32_LD_CL_INC_DEC(
	CL,
	clk,
	LD,
	INC,
	DEC,
	C0,
	E0,
	I,
	C32,
	E32,
	A
);


input wire	CL;
input wire	clk;
input wire	LD;
input wire	INC;
input wire	DEC;
input wire	C0;
input wire	E0;
input wire	[31:0] I;
output wire	C32;
output wire	E32;
output wire	[31:0] A;

wire	[31:0] A_ALTERA_SYNTHESIZED;
wire	C16;
wire	E16;





REG16_LD_CL_INC_DEC	b2v_inst(
	.LD(LD),
	.C0(C0),
	.INC(INC),
	.E0(E0),
	.DEC(DEC),
	.CL(CL),
	.clk(clk),
	.I(I[15:0]),
	.C16(C16),
	.E16(E16),
	.A(A_ALTERA_SYNTHESIZED[15:0]));


REG16_LD_CL_INC_DEC	b2v_inst5(
	.LD(LD),
	.C0(C16),
	.INC(INC),
	.E0(E16),
	.DEC(DEC),
	.CL(CL),
	.clk(clk),
	.I(I[31:16]),
	.C16(C32),
	.E16(E32),
	.A(A_ALTERA_SYNTHESIZED[31:16]));

assign	A = A_ALTERA_SYNTHESIZED;

endmodule
