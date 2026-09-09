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
// CREATED		"Mon Jul 20 11:26:49 2026"

module OR16(
	IN,
	OUT
);


input wire	[15:0] IN;
output wire	OUT;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;




assign	SYNTHESIZED_WIRE_1 = IN[0] | IN[2] | IN[1] | IN[3] | IN[5] | IN[4] | IN[6] | IN[7];

assign	SYNTHESIZED_WIRE_0 = IN[8] | IN[10] | IN[9] | IN[11] | IN[13] | IN[12] | IN[14] | IN[15];

assign	OUT = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;


endmodule
