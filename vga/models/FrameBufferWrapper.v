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
// CREATED		"Fri Aug 28 20:35:03 2026"

module FrameBufferWrapper(
	FB_WR,
	FB_CLK,
	FB_SEL,
	FB_ADDR,
	FB_DATA_IN,
	FB_DATA_OUT
);


input wire	FB_WR;
input wire	FB_CLK;
input wire	FB_SEL;
input wire	[15:0] FB_ADDR;
input wire	[7:0] FB_DATA_IN;
output wire	[7:0] FB_DATA_OUT;

wire	NSEL;
reg	SEL;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;





always@(posedge FB_CLK)
begin
	SEL <= SEL ^ SYNTHESIZED_WIRE_0;
end


FrameBufferRAM	b2v_inst100(
	.wren(SYNTHESIZED_WIRE_1),
	.clock(FB_CLK),
	.address(FB_ADDR),
	.data(FB_DATA_IN),
	.q(SYNTHESIZED_WIRE_4));


FrameBufferRAM	b2v_inst101(
	.wren(SYNTHESIZED_WIRE_2),
	.clock(FB_CLK),
	.address(FB_ADDR),
	.data(FB_DATA_IN),
	.q(SYNTHESIZED_WIRE_3));


MPX2_8BIT	b2v_inst2(
	.sel(NSEL),
	.data0x(SYNTHESIZED_WIRE_3),
	.data1x(SYNTHESIZED_WIRE_4),
	.result(FB_DATA_OUT));

assign	SYNTHESIZED_WIRE_1 = FB_WR & SEL;

assign	SYNTHESIZED_WIRE_2 = FB_WR & NSEL;


RisingEdgeDetector	b2v_inst6(
	.IN(FB_SEL),
	.CLK(FB_CLK),
	.OUT(SYNTHESIZED_WIRE_0));

assign	NSEL =  ~SEL;


endmodule
