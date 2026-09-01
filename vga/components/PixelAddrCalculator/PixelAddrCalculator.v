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
// CREATED		"Tue Sep 01 19:33:48 2026"

module PixelAddrCalculator(
	X,
	Y,
	PIXEL_ADDR
);


input wire	[9:0] X;
input wire	[9:0] Y;
output wire	[15:0] PIXEL_ADDR;

wire	zero;
wire	SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	[15:0] SYNTHESIZED_WIRE_2;

wire	[15:0] GDFX_TEMP_SIGNAL_3;
wire	[15:0] GDFX_TEMP_SIGNAL_2;
wire	[15:0] GDFX_TEMP_SIGNAL_1;
wire	[15:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_3 = {zero,zero,zero,zero,zero,zero,zero,zero,zero,X[9:3]};
assign	GDFX_TEMP_SIGNAL_2 = {zero,zero,zero,zero,Y[9:0],zero,zero};
assign	GDFX_TEMP_SIGNAL_1 = {Y[9:0],zero,zero,zero,zero,zero,zero};
assign	GDFX_TEMP_SIGNAL_0 = {zero,Y[9:0],zero,zero,zero,zero,zero};



ADD16	b2v_inst1(
	.C_0(zero),
	.A(GDFX_TEMP_SIGNAL_0),
	.B(GDFX_TEMP_SIGNAL_1),
	.C(SYNTHESIZED_WIRE_0),
	.OUT(SYNTHESIZED_WIRE_2));


ADD16	b2v_inst15(
	.C_0(zero),
	.A(GDFX_TEMP_SIGNAL_2),
	.B(GDFX_TEMP_SIGNAL_3),
	
	.OUT(SYNTHESIZED_WIRE_1));


ADD16	b2v_inst2(
	.C_0(SYNTHESIZED_WIRE_0),
	.A(SYNTHESIZED_WIRE_1),
	.B(SYNTHESIZED_WIRE_2),
	
	.OUT(PIXEL_ADDR));

assign	zero = 0;

endmodule
