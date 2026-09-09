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
// CREATED		"Tue Sep 01 18:21:11 2026"

module VgaTest3(
	CLK,
	BTN,
	PIXEL_CHANGED,
	v,
	SET_PIXEL,
	HS,
	VS,
	B,
	G,
	OUT,
	R
);


input wire	CLK;
input wire	BTN;
output wire	PIXEL_CHANGED;
output wire	v;
output wire	SET_PIXEL;
output wire	HS;
output wire	VS;
output wire	[3:0] B;
output wire	[3:0] G;
output wire	[7:0] OUT;
output wire	[3:0] R;

reg	FB_SEL;
wire	one;
wire	PIXEL_CHANGED_ALTERA_SYNTHESIZED;
reg	SET_PIXEL_ALTERA_SYNTHESIZED;
wire	[9:0] X;
wire	[9:0] Y_CONST;
wire	zero;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;





Monitor	b2v_inst(
	.clk(CLK),
	.SET_PIXEL(SET_PIXEL_ALTERA_SYNTHESIZED),
	.SET_BIT(one),
	.FB_SEL(FB_SEL),
	.XIN(X),
	.YIN(Y_CONST),
	.v(v),
	.hs(HS),
	.vs(VS),
	.PIXEL_CHANGED(PIXEL_CHANGED_ALTERA_SYNTHESIZED),
	.B(B),
	.G(G),
	.OUT(OUT),
	.R(R));


always@(posedge CLK)
begin
	SET_PIXEL_ALTERA_SYNTHESIZED <= ~SET_PIXEL_ALTERA_SYNTHESIZED & SYNTHESIZED_WIRE_0 | SET_PIXEL_ALTERA_SYNTHESIZED & ~SET_PIXEL_ALTERA_SYNTHESIZED;
end


RegisterX	b2v_inst12(
	.CLK(CLK),
	.LD(zero),
	.CL(zero),
	.INC(PIXEL_CHANGED_ALTERA_SYNTHESIZED),
	.DEC(zero),
	
	.DATA_OUT(X));
	defparam	b2v_inst12.default_value = 200;
	defparam	b2v_inst12.size = 10;


RisingEdgeDetector	b2v_inst2(
	.IN(SYNTHESIZED_WIRE_1),
	.CLK(CLK),
	.OUT(SYNTHESIZED_WIRE_0));

assign	SYNTHESIZED_WIRE_1 =  ~BTN;



ConstantX	b2v_inst6(
	.DATA_OUT(Y_CONST));
	defparam	b2v_inst6.const = 400;
	defparam	b2v_inst6.size = 10;



always@(posedge CLK)
begin
	begin
	FB_SEL <= PIXEL_CHANGED_ALTERA_SYNTHESIZED;
	end
end

assign	PIXEL_CHANGED = PIXEL_CHANGED_ALTERA_SYNTHESIZED;
assign	SET_PIXEL = SET_PIXEL_ALTERA_SYNTHESIZED;
assign	one = 1;
assign	zero = 0;

endmodule
