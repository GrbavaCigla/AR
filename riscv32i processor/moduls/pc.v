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
// CREATED		"Thu Aug 13 20:22:00 2026"

module pc(
	CLK,
	RESET,
	NEXT_PC,
	PC
);


input wire	CLK;
input wire	RESET;
input wire	[31:0] NEXT_PC;
output wire	[31:0] PC;

wire	0;
wire	SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_0 = 1;




REG32_LD_CL_INC_DEC	b2v_inst(
	.LD(SYNTHESIZED_WIRE_0),
	.C0(0),
	.INC(0),
	.E0(0),
	.DEC(0),
	.CL(RESET),
	.clk(CLK),
	.I(NEXT_PC),
	
	
	.A(PC));



assign	0 = 0;

endmodule
