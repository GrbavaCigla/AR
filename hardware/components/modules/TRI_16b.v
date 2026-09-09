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
// CREATED		"Sat Aug 29 13:31:06 2026"

module TRI_16b(
	BOOL,
	IN,
	OUT
);


input wire	BOOL;
input wire	[15:0] IN;
output wire	[15:0] OUT;

wire	[15:0] OUT_ALTERA_SYNTHESIZED;




assign	OUT_ALTERA_SYNTHESIZED[15] = BOOL ? IN[15] : 1'bz;

assign	OUT_ALTERA_SYNTHESIZED[14] = BOOL ? IN[14] : 1'bz;

assign	OUT_ALTERA_SYNTHESIZED[5] = BOOL ? IN[5] : 1'bz;

assign	OUT_ALTERA_SYNTHESIZED[4] = BOOL ? IN[4] : 1'bz;

assign	OUT_ALTERA_SYNTHESIZED[3] = BOOL ? IN[3] : 1'bz;

assign	OUT_ALTERA_SYNTHESIZED[2] = BOOL ? IN[2] : 1'bz;

assign	OUT_ALTERA_SYNTHESIZED[1] = BOOL ? IN[1] : 1'bz;

assign	OUT_ALTERA_SYNTHESIZED[0] = BOOL ? IN[0] : 1'bz;

assign	OUT_ALTERA_SYNTHESIZED[13] = BOOL ? IN[13] : 1'bz;

assign	OUT_ALTERA_SYNTHESIZED[12] = BOOL ? IN[12] : 1'bz;

assign	OUT_ALTERA_SYNTHESIZED[11] = BOOL ? IN[11] : 1'bz;

assign	OUT_ALTERA_SYNTHESIZED[10] = BOOL ? IN[10] : 1'bz;

assign	OUT_ALTERA_SYNTHESIZED[9] = BOOL ? IN[9] : 1'bz;

assign	OUT_ALTERA_SYNTHESIZED[8] = BOOL ? IN[8] : 1'bz;

assign	OUT_ALTERA_SYNTHESIZED[7] = BOOL ? IN[7] : 1'bz;

assign	OUT_ALTERA_SYNTHESIZED[6] = BOOL ? IN[6] : 1'bz;

assign	OUT = OUT_ALTERA_SYNTHESIZED;

endmodule
