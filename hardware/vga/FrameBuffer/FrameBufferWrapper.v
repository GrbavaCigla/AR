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
// CREATED		"Tue Sep 08 11:05:18 2026"

module FrameBufferWrapper(
	FB_WR,
	FB_CLK,
	FB_SEL,
	RESET,
	FB_ADDR_RD,
	FB_ADDR_WR,
	FB_DATA_IN,
	FB_DATA_OUT,
	FB_WR_DATA
);


input wire	FB_WR;
input wire	FB_CLK;
input wire	FB_SEL;
input wire	RESET;
input wire	[15:0] FB_ADDR_RD;
input wire	[15:0] FB_ADDR_WR;
input wire	[7:0] FB_DATA_IN;
output wire	[7:0] FB_DATA_OUT;
output wire	[7:0] FB_WR_DATA;

wire	[15:0] FB_ADDR;
wire	NSEL;
wire	[7:0] Q0;
wire	[7:0] Q1;
reg	SEL;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[15:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_1 = 1;
assign	SYNTHESIZED_WIRE_5 = 1;




always@(posedge FB_CLK or negedge RESET)
begin
if (!RESET)
	begin
	SEL <= 0;
	end
else
	SEL <= SEL ^ SYNTHESIZED_WIRE_0;
end


MPX2_16BIT	b2v_inst10(
	.S(SEL),
	.E(SYNTHESIZED_WIRE_1),
	.I0(FB_ADDR_WR),
	.I1(FB_ADDR_RD),
	.D(FB_ADDR));


FrameBufferRAM	b2v_inst100(
	.wren(SYNTHESIZED_WIRE_2),
	.clock(FB_CLK),
	.address(SYNTHESIZED_WIRE_3),
	.data(FB_DATA_IN),
	.q(Q0));


FrameBufferRAM	b2v_inst101(
	.wren(SYNTHESIZED_WIRE_4),
	.clock(FB_CLK),
	.address(FB_ADDR),
	.data(FB_DATA_IN),
	.q(Q1));



MPX2_8BIT	b2v_inst2(
	.sel(NSEL),
	.data0x(Q1),
	.data1x(Q0),
	.result(FB_DATA_OUT));

assign	SYNTHESIZED_WIRE_2 = FB_WR & SEL;

assign	SYNTHESIZED_WIRE_4 = FB_WR & NSEL;


MPX2_8BIT	b2v_inst5(
	.sel(SEL),
	.data0x(Q1),
	.data1x(Q0),
	.result(FB_WR_DATA));


RisingEdgeDetector	b2v_inst6(
	.IN(FB_SEL),
	.CLK(FB_CLK),
	.OUT(SYNTHESIZED_WIRE_0));

assign	NSEL =  ~SEL;


MPX2_16BIT	b2v_inst8(
	.S(NSEL),
	.E(SYNTHESIZED_WIRE_5),
	.I0(FB_ADDR_WR),
	.I1(FB_ADDR_RD),
	.D(SYNTHESIZED_WIRE_3));



endmodule
