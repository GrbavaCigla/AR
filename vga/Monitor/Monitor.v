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
// CREATED		"Tue Sep 01 18:41:43 2026"

module Monitor(
	SET_PIXEL,
	SET_BIT,
	clk,
	FB_SEL,
	XIN,
	YIN,
	hs,
	vs,
	PIXEL_CHANGED,
	v,
	B,
	G,
	OUT,
	R
);


input wire	SET_PIXEL;
input wire	SET_BIT;
input wire	clk;
input wire	FB_SEL;
input wire	[9:0] XIN;
input wire	[9:0] YIN;
output wire	hs;
output wire	vs;
output wire	PIXEL_CHANGED;
output wire	v;
output wire	[3:0] B;
output wire	[3:0] G;
output wire	[7:0] OUT;
output wire	[3:0] R;

wire	[9:0] ACTUAL_X;
wire	[9:0] ACTUAL_Y;
wire	[3:0] BB;
wire	[3:0] BG;
wire	[3:0] BR;
wire	[9:0] controllerX;
wire	[9:0] controllerY;
wire	display;
wire	[3:0] PB;
wire	[3:0] PG;
wire	[3:0] PR;
wire	SET_PIXEL_ACTUAL;
wire	v_ALTERA_SYNTHESIZED;
wire	vga_clk;
wire	[9:0] X;
wire	[9:0] Y;
wire	zero;
wire	SYNTHESIZED_WIRE_0;
wire	[3:0] SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_2;
wire	[3:0] SYNTHESIZED_WIRE_3;

wire	[15:0] GDFX_TEMP_SIGNAL_1;
wire	[15:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_1 = {zero,zero,zero,zero,zero,zero,Y[9:0]};
assign	GDFX_TEMP_SIGNAL_0 = {zero,zero,zero,zero,zero,zero,X[9:0]};


ConstantX	b2v_inst(
	.DATA_OUT(PR));
	defparam	b2v_inst.const = 15;
	defparam	b2v_inst.size = 4;


ClockDivider	b2v_inst10(
	
	.CLK_IN(clk)
	
	);


MPX2_10BIT	b2v_inst100(
	.sel(SET_PIXEL_ACTUAL),
	.data0x(controllerX),
	.data1x(XIN)
	);


REG16_LD_CL	b2v_inst11(
	
	
	.clk(clk),
	.I(GDFX_TEMP_SIGNAL_0)
	);


REG16_LD_CL	b2v_inst12(
	
	
	.clk(clk),
	.I(GDFX_TEMP_SIGNAL_1)
	);

assign	SET_PIXEL_ACTUAL = SET_PIXEL & SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_0 =  ~display;


FrameBuffer	b2v_inst15(
	.clk(clk),
	.SET_PIXEL(SET_PIXEL),
	.SET_BIT(SET_BIT),
	.FB_SEL(FB_SEL),
	
	
	.X_RD(controllerX),
	.X_WR(XIN),
	.Y_RD(controllerY),
	.Y_WR(YIN),
	.PIXEL_ON(v_ALTERA_SYNTHESIZED),
	.WR_PIXEL(PIXEL_CHANGED),
	.OUT(OUT));


Controller2	b2v_inst17(
	.CLK(clk),
	.HS(hs),
	.VS(vs),
	.DISPLAY(display),
	.X(controllerX),
	.Y(controllerY));

assign	R = SYNTHESIZED_WIRE_1 & {display,display,display,display};


ConstantX	b2v_inst29(
	.DATA_OUT(PG));
	defparam	b2v_inst29.const = 0;
	defparam	b2v_inst29.size = 4;

assign	B = SYNTHESIZED_WIRE_2 & {display,display,display,display};


ConstantX	b2v_inst30(
	.DATA_OUT(PB));
	defparam	b2v_inst30.const = 0;
	defparam	b2v_inst30.size = 4;

assign	G = SYNTHESIZED_WIRE_3 & {display,display,display,display};


BackgroundMain	b2v_inst5(
	.X(controllerX),
	.Y(controllerY),
	
	.B(BB),
	.G(BG),
	.R(BR));


MultiplexerX	b2v_inst6(
	.S(v_ALTERA_SYNTHESIZED),
	.I0(BR),
	.I1(PR),
	.Y(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst6.size = 4;


MultiplexerX	b2v_inst7(
	.S(v_ALTERA_SYNTHESIZED),
	.I0(BG),
	.I1(PG),
	.Y(SYNTHESIZED_WIRE_3));
	defparam	b2v_inst7.size = 4;


MultiplexerX	b2v_inst8(
	.S(v_ALTERA_SYNTHESIZED),
	.I0(BB),
	.I1(PB),
	.Y(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst8.size = 4;


MPX2_10BIT	b2v_inst9(
	.sel(SET_PIXEL_ACTUAL),
	.data0x(controllerY),
	.data1x(YIN)
	);

assign	v = v_ALTERA_SYNTHESIZED;

endmodule
