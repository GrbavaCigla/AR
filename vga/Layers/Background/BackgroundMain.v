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
// CREATED		"Tue Aug 18 14:05:01 2026"

module BackgroundMain(
	X,
	Y,
	VALID,
	B,
	G,
	R
);


input wire	[9:0] X;
input wire	[9:0] Y;
output wire	VALID;
output wire	[3:0] B;
output wire	[3:0] G;
output wire	[3:0] R;


assign	VALID = 1;




ConstantX	b2v_inst2(
	.DATA_OUT(G));
	defparam	b2v_inst2.const = 255;
	defparam	b2v_inst2.size = 4;


ConstantX	b2v_inst6(
	.DATA_OUT(B));
	defparam	b2v_inst6.const = 0;
	defparam	b2v_inst6.size = 4;


ConstantX	b2v_inst8(
	.DATA_OUT(R));
	defparam	b2v_inst8.const = 0;
	defparam	b2v_inst8.size = 4;



endmodule
