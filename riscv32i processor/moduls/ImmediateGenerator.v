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
// CREATED		"Sat Aug 15 03:33:22 2026"

module ImmediateGenerator(
	IMM_SRC,
	INSTRUCTION,
	IMM_OUT
);


input wire	[2:0] IMM_SRC;
input wire	[31:0] INSTRUCTION;
output wire	[31:0] IMM_OUT;

wire	[31:0] B_TYPE;
wire	[31:0] I_TYPE;
wire	[31:0] J_TYPE;
wire	[31:0] S_TYPE;
wire	[31:0] U_TYPE;





ImmediateGenTypes	b2v_inst(
	.INSTR(INSTRUCTION),
	.B_TYPE(B_TYPE),
	.I_TYPE(I_TYPE),
	.J_TYPE(J_TYPE),
	.S_TYPE(S_TYPE),
	.U_TYPE(U_TYPE));


MPX5_32bit	b2v_inst1(
	.data0x(I_TYPE),
	.data1x(S_TYPE),
	.data2x(B_TYPE),
	.data3x(U_TYPE),
	.data4x(J_TYPE),
	.sel(IMM_SRC),
	.result(IMM_OUT));


endmodule
