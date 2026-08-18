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
// CREATED		"Tue Aug 18 15:12:10 2026"

module Monitor(
	clk,
	PX,
	PY,
	hs,
	vs,
	B,
	G,
	R
);


input wire	clk;
input wire	[9:0] PX;
input wire	[9:0] PY;
output wire	hs;
output wire	vs;
output wire	[3:0] B;
output wire	[3:0] G;
output wire	[3:0] R;

wire	[3:0] BB;
wire	[3:0] BG;
wire	[3:0] BR;
wire	display;
wire	[3:0] PB;
wire	[3:0] PG;
wire	[3:0] PR;
wire	v;
wire	[3:0] SYNTHESIZED_WIRE_0;
wire	[3:0] SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_2;
wire	[9:0] SYNTHESIZED_WIRE_3;
wire	[9:0] SYNTHESIZED_WIRE_4;





Controller	b2v_inst(
	.CLK(clk),
	.HS(hs),
	.VS(vs),
	.DISPLAY(display),
	.X(SYNTHESIZED_WIRE_3),
	.Y(SYNTHESIZED_WIRE_4));


point	b2v_inst1(
	.clk(clk),
	.X(PX),
	.Y(PY),
	.valid(v),
	
	
	.R(PR));

assign	R = SYNTHESIZED_WIRE_0 & {display,display,display,display};

assign	G = SYNTHESIZED_WIRE_1 & {display,display,display,display};

assign	B = SYNTHESIZED_WIRE_2 & {display,display,display,display};


BackgroundMain	b2v_inst5(
	.X(SYNTHESIZED_WIRE_3),
	.Y(SYNTHESIZED_WIRE_4),
	
	
	
	.R(BR));


MultiplexerX	b2v_inst6(
	.S(v),
	.I0(BR),
	.I1(PR),
	.Y(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst6.size = 4;


MultiplexerX	b2v_inst7(
	.S(v),
	.I0(BR),
	.I1(PR),
	.Y(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst7.size = 4;


MultiplexerX	b2v_inst8(
	.S(v),
	.I0(BR),
	.I1(PR),
	.Y(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst8.size = 4;


endmodule
