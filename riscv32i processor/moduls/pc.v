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
// CREATED		"Tue Aug 11 23:42:39 2026"

module pc(
	CLK,
	RESET,
	PC
);


input wire	CLK;
input wire	RESET;
output wire	[31:0] PC;

wire	[31:0] PC_ALTERA_SYNTHESIZED;
wire	[31:0] PCplus4;
wire	SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_0 = 1'b1;
wire	[31:0] GDFX_TEMP_SIGNAL_0;

assign	GDFX_TEMP_SIGNAL_0 = 32'd4;


REG32_LD_CL_INC_DEC	b2v_inst(
	.LD(SYNTHESIZED_WIRE_0),
	.C0(1'b0),
	.INC(1'b0),
	.E0(1'b0),
	.DEC(1'b0),
	.CL(RESET),
	.clk(CLK),
	.I(PCplus4),
	
	.A(PC_ALTERA_SYNTHESIZED)
);


ADD32	b2v_inst8(
	.C_0(1'b0),
	.A(PC_ALTERA_SYNTHESIZED),
	.B(GDFX_TEMP_SIGNAL_0),
	
	.OUT(PCplus4)
);

assign	PC = PC_ALTERA_SYNTHESIZED;

endmodule