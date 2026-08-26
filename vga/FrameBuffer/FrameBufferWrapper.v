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
// CREATED		"Wed Aug 26 18:41:24 2026"

module FrameBufferWrapper(
	FB_WR,
	FB_CLK,
	FB_ADDR,
	FB_DATA_IN,
	FB_DATA_OUT
);


input wire	FB_WR;
input wire	FB_CLK;
input wire	[15:0] FB_ADDR;
input wire	[7:0] FB_DATA_IN;
output wire	[7:0] FB_DATA_OUT;






FrameBufferRAM	b2v_inst(
	.wren(FB_WR),
	.clock(FB_CLK),
	.address(FB_ADDR),
	.data(FB_DATA_IN),
	.q(FB_DATA_OUT));


endmodule
