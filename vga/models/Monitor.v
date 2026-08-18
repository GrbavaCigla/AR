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
// CREATED		"Tue Aug 18 14:04:32 2026"

module Monitor(
	clk,
	hs,
	vs,
	B,
	G,
	R
);


input wire	clk;
output wire	hs;
output wire	vs;
output wire	[3:0] B;
output wire	[3:0] G;
output wire	[3:0] R;

wire	display;
wire	[3:0] L0B;
wire	[3:0] L0G;
wire	[9:0] SYNTHESIZED_WIRE_0;
wire	[9:0] SYNTHESIZED_WIRE_1;





Controller	b2v_inst(
	.CLK(clk),
	.HS(hs),
	.VS(vs),
	.DISPLAY(display),
	.X(SYNTHESIZED_WIRE_0),
	.Y(SYNTHESIZED_WIRE_1));


assign	G = {display,display,display,display};

assign	B = {display,display,display,display};


BackgroundMain	b2v_inst5(
	.X(SYNTHESIZED_WIRE_0),
	.Y(SYNTHESIZED_WIRE_1),
	
	
	
	.R(R));


endmodule
