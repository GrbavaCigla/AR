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
// CREATED		"Tue Aug 11 00:33:21 2026"

module ImmediateGenerator(
	IMM_SRC,
	INSTRUCTION,
	IMM_OUT
);


input wire	[2:0] IMM_SRC;
input wire	[31:0] INSTRUCTION;
output wire	[31:0] IMM_OUT;

wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;





ImmediateGenTypes	b2v_inst(
	.INSTR(INSTRUCTION),
	.B_TYPE(SYNTHESIZED_WIRE_2),
	.I_TYPE(SYNTHESIZED_WIRE_4),
	.J_TYPE(SYNTHESIZED_WIRE_0),
	.S_TYPE(SYNTHESIZED_WIRE_3),
	.U_TYPE(SYNTHESIZED_WIRE_1));


MPX5_32bit	b2v_inst1(
	.data0x(SYNTHESIZED_WIRE_0),
	.data1x(SYNTHESIZED_WIRE_1),
	.data2x(SYNTHESIZED_WIRE_2),
	.data3x(SYNTHESIZED_WIRE_3),
	.data4x(SYNTHESIZED_WIRE_4),
	.sel(IMM_SRC),
	.result(IMM_OUT));


endmodule
