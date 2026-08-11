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
// CREATED		"Tue Aug 11 00:34:14 2026"

module pc(
	LD,
	CL,
	INC,
	clk,
	I,
	OUT
);


input wire	LD;
input wire	CL;
input wire	INC;
input wire	clk;
input wire	[31:0] I;
output wire	[31:0] OUT;

wire	0;
wire	1;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_13;





REG32_LD_CL_INC_DEC	b2v_inst(
	.LD(LD),
	.C0(0),
	.INC(0),
	.E0(0),
	.DEC(0),
	.CL(CL),
	.clk(clk),
	.I(I),
	
	
	.A(SYNTHESIZED_WIRE_2));

assign	SYNTHESIZED_WIRE_3 = {INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC,INC} & SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_4 = {SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1} & SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_1 =  ~INC;

assign	OUT = SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4;


REG32_LD_CL_INC_DEC	b2v_inst6(
	.LD(0),
	.C0(0),
	.INC(INC),
	.E0(0),
	.DEC(0),
	.CL(0),
	.clk(clk),
	.I(I),
	.C32(SYNTHESIZED_WIRE_5),
	.E32(SYNTHESIZED_WIRE_6),
	.A(SYNTHESIZED_WIRE_7));


REG32_LD_CL_INC_DEC	b2v_inst7(
	.LD(0),
	.C0(SYNTHESIZED_WIRE_5),
	.INC(1),
	.E0(SYNTHESIZED_WIRE_6),
	.DEC(0),
	.CL(0),
	.clk(clk),
	.I(SYNTHESIZED_WIRE_7),
	.C32(SYNTHESIZED_WIRE_8),
	.E32(SYNTHESIZED_WIRE_9),
	.A(SYNTHESIZED_WIRE_10));


REG32_LD_CL_INC_DEC	b2v_inst8(
	.LD(0),
	.C0(SYNTHESIZED_WIRE_8),
	.INC(1),
	.E0(SYNTHESIZED_WIRE_9),
	.DEC(0),
	.CL(0),
	.clk(clk),
	.I(SYNTHESIZED_WIRE_10),
	.C32(SYNTHESIZED_WIRE_11),
	.E32(SYNTHESIZED_WIRE_12),
	.A(SYNTHESIZED_WIRE_13));


REG32_LD_CL_INC_DEC	b2v_inst9(
	.LD(0),
	.C0(SYNTHESIZED_WIRE_11),
	.INC(1),
	.E0(SYNTHESIZED_WIRE_12),
	.DEC(0),
	.CL(0),
	.clk(clk),
	.I(SYNTHESIZED_WIRE_13),
	
	
	.A(SYNTHESIZED_WIRE_0));


endmodule
