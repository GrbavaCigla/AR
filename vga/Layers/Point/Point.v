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
// CREATED		"Tue Aug 18 15:04:34 2026"

module Point(
	clk,
	X,
	Y,
	valid,
	B,
	G,
	R
);


input wire	clk;
input wire	[9:0] X;
input wire	[9:0] Y;
output wire	valid;
output wire	[3:0] B;
output wire	[3:0] G;
output wire	[3:0] R;

wire	[15:0] D0;
wire	[15:0] D1;
wire	[15:0] L0;
wire	[15:0] L1;
reg	loadAll;
wire	nula;
wire	[15:0] SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	[9:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[15:0] SYNTHESIZED_WIRE_7;
wire	[9:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	[9:0] SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	[15:0] SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	[9:0] SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;

wire	[15:0] GDFX_TEMP_SIGNAL_0;
wire	[15:0] GDFX_TEMP_SIGNAL_1;
wire	[15:0] GDFX_TEMP_SIGNAL_2;
wire	[15:0] GDFX_TEMP_SIGNAL_3;


assign	GDFX_TEMP_SIGNAL_0 = {nula,nula,nula,nula,nula,nula,X[9:0]};
assign	GDFX_TEMP_SIGNAL_1 = {nula,nula,nula,nula,nula,nula,X[9:0]};
assign	GDFX_TEMP_SIGNAL_2 = {nula,nula,nula,nula,nula,nula,Y[9:0]};
assign	GDFX_TEMP_SIGNAL_3 = {nula,nula,nula,nula,nula,nula,Y[9:0]};


RegisterX	b2v_inst(
	.CLK(clk),
	.LD(loadAll),
	.CL(nula),
	.INC(nula),
	.DEC(nula),
	.DATA_IN(L0[9:0]),
	.DATA_OUT(SYNTHESIZED_WIRE_20));
	defparam	b2v_inst.default_value = 0;
	defparam	b2v_inst.size = 10;


SUB16	b2v_inst1(
	.E_0(nula),
	.A(GDFX_TEMP_SIGNAL_0),
	.B(SYNTHESIZED_WIRE_0),
	
	.OUT(L0));


ADD16	b2v_inst10(
	.C_0(nula),
	.A(GDFX_TEMP_SIGNAL_1),
	.B(SYNTHESIZED_WIRE_1),
	
	.OUT(D0));



ConstantX	b2v_inst12(
	.DATA_OUT(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst12.const = 5;
	defparam	b2v_inst12.size = 16;


ComparatorX	b2v_inst13(
	.A(X),
	.B(SYNTHESIZED_WIRE_2),
	.LS(SYNTHESIZED_WIRE_3),
	.EQ(SYNTHESIZED_WIRE_4)
	);
	defparam	b2v_inst13.size = 10;

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_17 = SYNTHESIZED_WIRE_5 & SYNTHESIZED_WIRE_6;


SUB16	b2v_inst16(
	.E_0(nula),
	.A(GDFX_TEMP_SIGNAL_2),
	.B(SYNTHESIZED_WIRE_7),
	
	.OUT(L1));


RegisterX	b2v_inst17(
	.CLK(clk),
	.LD(loadAll),
	.CL(nula),
	.INC(nula),
	.DEC(nula),
	.DATA_IN(L1[9:0]),
	.DATA_OUT(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst17.default_value = 0;
	defparam	b2v_inst17.size = 10;



ConstantX	b2v_inst19(
	.DATA_OUT(SYNTHESIZED_WIRE_7));
	defparam	b2v_inst19.const = 5;
	defparam	b2v_inst19.size = 16;



ComparatorX	b2v_inst20(
	.A(Y),
	.B(SYNTHESIZED_WIRE_8),
	
	.EQ(SYNTHESIZED_WIRE_9),
	.GR(SYNTHESIZED_WIRE_10));
	defparam	b2v_inst20.size = 10;

assign	SYNTHESIZED_WIRE_16 = SYNTHESIZED_WIRE_9 | SYNTHESIZED_WIRE_10;


RegisterX	b2v_inst22(
	.CLK(clk),
	.LD(loadAll),
	.CL(nula),
	.INC(nula),
	.DEC(nula),
	.DATA_IN(D1[9:0]),
	.DATA_OUT(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst22.default_value = 0;
	defparam	b2v_inst22.size = 10;



ConstantX	b2v_inst24(
	.DATA_OUT(SYNTHESIZED_WIRE_14));
	defparam	b2v_inst24.const = 5;
	defparam	b2v_inst24.size = 16;


ComparatorX	b2v_inst25(
	.A(Y),
	.B(SYNTHESIZED_WIRE_11),
	.LS(SYNTHESIZED_WIRE_12),
	.EQ(SYNTHESIZED_WIRE_13)
	);
	defparam	b2v_inst25.size = 10;

assign	SYNTHESIZED_WIRE_15 = SYNTHESIZED_WIRE_12 | SYNTHESIZED_WIRE_13;


ADD16	b2v_inst27(
	.C_0(nula),
	.A(GDFX_TEMP_SIGNAL_3),
	.B(SYNTHESIZED_WIRE_14),
	
	.OUT(D1));

assign	SYNTHESIZED_WIRE_18 = SYNTHESIZED_WIRE_15 & SYNTHESIZED_WIRE_16;

assign	valid = SYNTHESIZED_WIRE_17 & SYNTHESIZED_WIRE_18;


ConstantX	b2v_inst3(
	.DATA_OUT(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst3.const = 5;
	defparam	b2v_inst3.size = 16;


ConstantX	b2v_inst30(
	.DATA_OUT(R));
	defparam	b2v_inst30.const = 255;
	defparam	b2v_inst30.size = 4;


ConstantX	b2v_inst31(
	.DATA_OUT(G));
	defparam	b2v_inst31.const = 0;
	defparam	b2v_inst31.size = 4;


ConstantX	b2v_inst32(
	.DATA_OUT(B));
	defparam	b2v_inst32.const = 0;
	defparam	b2v_inst32.size = 4;


always@(posedge clk)
begin
	loadAll <= ~loadAll & SYNTHESIZED_WIRE_19 | loadAll & ~loadAll;
end

assign	SYNTHESIZED_WIRE_19 =  ~loadAll;


ComparatorX	b2v_inst6(
	.A(X),
	.B(SYNTHESIZED_WIRE_20),
	
	.EQ(SYNTHESIZED_WIRE_21),
	.GR(SYNTHESIZED_WIRE_22));
	defparam	b2v_inst6.size = 10;

assign	SYNTHESIZED_WIRE_6 = SYNTHESIZED_WIRE_21 | SYNTHESIZED_WIRE_22;


RegisterX	b2v_inst8(
	.CLK(clk),
	.LD(loadAll),
	.CL(nula),
	.INC(nula),
	.DEC(nula),
	.DATA_IN(D0[9:0]),
	.DATA_OUT(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst8.default_value = 0;
	defparam	b2v_inst8.size = 10;

assign	nula = 0;
assign	nula = 0;
assign	nula = 0;
assign	nula = 0;

endmodule
