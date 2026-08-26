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
// CREATED		"Mon Aug 24 16:43:01 2026"

module Controller(
	CLK,
	HS,
	VS,
	DISPLAY,
	X,
	Y
);


input wire	CLK;
output wire	HS;
output wire	VS;
output wire	DISPLAY;
output wire	[9:0] X;
output wire	[9:0] Y;

wire	[10:0] X_ALTERA_SYNTHESIZED;
wire	[9:0] Y_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_1;
wire	[10:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[9:0] SYNTHESIZED_WIRE_5;
wire	[9:0] SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	[10:0] SYNTHESIZED_WIRE_9;
wire	[10:0] SYNTHESIZED_WIRE_10;
wire	[9:0] SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	[9:0] SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_18;
wire	[10:0] SYNTHESIZED_WIRE_19;





RegisterX	b2v_inst(
	.CLK(CLK),
	
	.CL(SYNTHESIZED_WIRE_20),
	.INC(SYNTHESIZED_WIRE_1),
	
	
	.DATA_OUT(X_ALTERA_SYNTHESIZED));
	defparam	b2v_inst.default_value = 0;
	defparam	b2v_inst.size = 11;


ConstantX	b2v_inst1(
	.DATA_OUT(SYNTHESIZED_WIRE_10));
	defparam	b2v_inst1.const = 799;
	defparam	b2v_inst1.size = 11;


ComparatorX	b2v_inst10(
	.A(X_ALTERA_SYNTHESIZED),
	.B(SYNTHESIZED_WIRE_2),
	.LS(SYNTHESIZED_WIRE_3)
	
	);
	defparam	b2v_inst10.size = 11;

assign	HS = SYNTHESIZED_WIRE_3 & SYNTHESIZED_WIRE_4;


ConstantX	b2v_inst12(
	.DATA_OUT(SYNTHESIZED_WIRE_5));
	defparam	b2v_inst12.const = 489;
	defparam	b2v_inst12.size = 10;


ComparatorX	b2v_inst13(
	.A(Y_ALTERA_SYNTHESIZED),
	.B(SYNTHESIZED_WIRE_5),
	
	
	.GR(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst13.size = 10;


ConstantX	b2v_inst14(
	.DATA_OUT(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst14.const = 492;
	defparam	b2v_inst14.size = 10;


ComparatorX	b2v_inst15(
	.A(Y_ALTERA_SYNTHESIZED),
	.B(SYNTHESIZED_WIRE_6),
	.LS(SYNTHESIZED_WIRE_7)
	
	);
	defparam	b2v_inst15.size = 10;

assign	VS = SYNTHESIZED_WIRE_7 & SYNTHESIZED_WIRE_8;


ConstantX	b2v_inst17(
	.DATA_OUT(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst17.const = 640;
	defparam	b2v_inst17.size = 11;


ComparatorX	b2v_inst18(
	.A(X_ALTERA_SYNTHESIZED),
	.B(SYNTHESIZED_WIRE_9),
	.LS(SYNTHESIZED_WIRE_13)
	
	);
	defparam	b2v_inst18.size = 11;


ConstantX	b2v_inst19(
	.DATA_OUT(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst19.const = 480;
	defparam	b2v_inst19.size = 10;


ComparatorX	b2v_inst2(
	.A(X_ALTERA_SYNTHESIZED),
	.B(SYNTHESIZED_WIRE_10),
	.LS(SYNTHESIZED_WIRE_1),
	.EQ(SYNTHESIZED_WIRE_20)
	);
	defparam	b2v_inst2.size = 11;


ComparatorX	b2v_inst20(
	.A(Y_ALTERA_SYNTHESIZED),
	.B(SYNTHESIZED_WIRE_11),
	.LS(SYNTHESIZED_WIRE_12)
	
	);
	defparam	b2v_inst20.size = 10;

assign	DISPLAY = SYNTHESIZED_WIRE_12 & SYNTHESIZED_WIRE_13;


RegisterX	b2v_inst3(
	.CLK(CLK),
	
	.CL(SYNTHESIZED_WIRE_14),
	.INC(SYNTHESIZED_WIRE_20),
	
	
	.DATA_OUT(Y_ALTERA_SYNTHESIZED));
	defparam	b2v_inst3.default_value = 0;
	defparam	b2v_inst3.size = 10;


ConstantX	b2v_inst4(
	.DATA_OUT(SYNTHESIZED_WIRE_16));
	defparam	b2v_inst4.const = 524;
	defparam	b2v_inst4.size = 10;


ComparatorX	b2v_inst5(
	.A(Y_ALTERA_SYNTHESIZED),
	.B(SYNTHESIZED_WIRE_16),
	
	.EQ(SYNTHESIZED_WIRE_18)
	);
	defparam	b2v_inst5.size = 10;

assign	SYNTHESIZED_WIRE_14 = SYNTHESIZED_WIRE_20 & SYNTHESIZED_WIRE_18;


ConstantX	b2v_inst7(
	.DATA_OUT(SYNTHESIZED_WIRE_19));
	defparam	b2v_inst7.const = 655;
	defparam	b2v_inst7.size = 11;


ComparatorX	b2v_inst8(
	.A(X_ALTERA_SYNTHESIZED),
	.B(SYNTHESIZED_WIRE_19),
	
	
	.GR(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst8.size = 11;


ConstantX	b2v_inst9(
	.DATA_OUT(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst9.const = 752;
	defparam	b2v_inst9.size = 11;

assign	X[9:0] = X_ALTERA_SYNTHESIZED[9:0];
assign	Y = Y_ALTERA_SYNTHESIZED;

endmodule
