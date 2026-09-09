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
// CREATED		"Wed Sep 09 11:40:37 2026"

module PointBank12(
	clk,
	reset,
	write_en,
	read_index,
	write_data,
	write_index,
	read_data
);


input wire	clk;
input wire	reset;
input wire	write_en;
input wire	[3:0] read_index;
input wire	[31:0] write_data;
input wire	[3:0] write_index;
output wire	[31:0] read_data;

wire	[31:0] 10_point;
wire	[31:0] 11_point;
wire	[31:0] 12_point;
wire	[31:0] 1_point;
wire	[31:0] 2_point;
wire	[31:0] 3_point;
wire	[31:0] 4_point;
wire	[31:0] 5_point;
wire	[31:0] 6_point;
wire	[31:0] 7_point;
wire	[31:0] 8_point;
wire	[31:0] 9_point;
wire	ld0;
wire	ld1;
wire	ld10;
wire	ld11;
wire	ld2;
wire	ld3;
wire	ld4;
wire	ld5;
wire	ld6;
wire	ld7;
wire	ld8;
wire	ld9;
wire	[0:31] SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_4;
wire	[3:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[3:0] SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	[3:0] SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	[3:0] SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	[3:0] SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	[3:0] SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	[3:0] SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	[3:0] SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	[3:0] SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	[3:0] SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	[3:0] SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	[3:0] SYNTHESIZED_WIRE_27;

assign	SYNTHESIZED_WIRE_28 = 0;





REG32_LD_CL	b2v_inst10(
	.LD(ld4),
	.CL(reset),
	.clk(clk),
	.I(write_data),
	.A(5_point));


REG32_LD_CL	b2v_inst11(
	.LD(ld5),
	.CL(reset),
	.clk(clk),
	.I(write_data),
	.A(6_point));


REG32_LD_CL	b2v_inst12(
	.LD(ld6),
	.CL(reset),
	.clk(clk),
	.I(write_data),
	.A(7_point));


REG32_LD_CL	b2v_inst13(
	.LD(ld7),
	.CL(reset),
	.clk(clk),
	.I(write_data),
	.A(8_point));


REG32_LD_CL	b2v_inst14(
	.LD(ld8),
	.CL(reset),
	.clk(clk),
	.I(write_data),
	.A(9_point));


REG32_LD_CL	b2v_inst15(
	.LD(ld9),
	.CL(reset),
	.clk(clk),
	.I(write_data),
	.A(10_point));


REG32_LD_CL	b2v_inst16(
	.LD(ld10),
	.CL(reset),
	.clk(clk),
	.I(write_data),
	.A(11_point));


REG32_LD_CL	b2v_inst17(
	.LD(ld11),
	.CL(reset),
	.clk(clk),
	.I(write_data),
	.A(12_point));


MPX16_32BIT	b2v_inst18(
	.data0x(1_point),
	.data10x(11_point),
	.data11x(12_point),
	.data12x(SYNTHESIZED_WIRE_28),
	.data13x(SYNTHESIZED_WIRE_28),
	.data14x(SYNTHESIZED_WIRE_28),
	.data15x(SYNTHESIZED_WIRE_28),
	.data1x(2_point),
	.data2x(3_point),
	.data3x(4_point),
	.data4x(5_point),
	.data5x(6_point),
	.data6x(7_point),
	.data7x(8_point),
	.data8x(9_point),
	.data9x(10_point),
	
	.result(read_data));

assign	ld0 = write_en & SYNTHESIZED_WIRE_4;


CMP4	b2v_inst20(
	.A(write_index),
	.B(SYNTHESIZED_WIRE_5),
	
	.E(SYNTHESIZED_WIRE_4)
	);


ConstantX	b2v_inst21(
	.DATA_OUT(SYNTHESIZED_WIRE_5));
	defparam	b2v_inst21.const = 0;
	defparam	b2v_inst21.size = 4;

assign	ld1 = write_en & SYNTHESIZED_WIRE_6;


CMP4	b2v_inst23(
	.A(write_index),
	.B(SYNTHESIZED_WIRE_7),
	
	.E(SYNTHESIZED_WIRE_6)
	);


ConstantX	b2v_inst24(
	.DATA_OUT(SYNTHESIZED_WIRE_7));
	defparam	b2v_inst24.const = 1;
	defparam	b2v_inst24.size = 4;

assign	ld2 = write_en & SYNTHESIZED_WIRE_8;


CMP4	b2v_inst26(
	.A(write_index),
	.B(SYNTHESIZED_WIRE_9),
	
	.E(SYNTHESIZED_WIRE_8)
	);


ConstantX	b2v_inst27(
	.DATA_OUT(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst27.const = 2;
	defparam	b2v_inst27.size = 4;

assign	ld3 = write_en & SYNTHESIZED_WIRE_10;


CMP4	b2v_inst29(
	.A(write_index),
	.B(SYNTHESIZED_WIRE_11),
	
	.E(SYNTHESIZED_WIRE_10)
	);


ConstantX	b2v_inst30(
	.DATA_OUT(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst30.const = 3;
	defparam	b2v_inst30.size = 4;

assign	ld4 = write_en & SYNTHESIZED_WIRE_12;


CMP4	b2v_inst32(
	.A(write_index),
	.B(SYNTHESIZED_WIRE_13),
	
	.E(SYNTHESIZED_WIRE_12)
	);


ConstantX	b2v_inst33(
	.DATA_OUT(SYNTHESIZED_WIRE_13));
	defparam	b2v_inst33.const = 4;
	defparam	b2v_inst33.size = 4;

assign	ld5 = write_en & SYNTHESIZED_WIRE_14;


CMP4	b2v_inst35(
	.A(write_index),
	.B(SYNTHESIZED_WIRE_15),
	
	.E(SYNTHESIZED_WIRE_14)
	);


ConstantX	b2v_inst36(
	.DATA_OUT(SYNTHESIZED_WIRE_15));
	defparam	b2v_inst36.const = 5;
	defparam	b2v_inst36.size = 4;

assign	ld6 = write_en & SYNTHESIZED_WIRE_16;


CMP4	b2v_inst38(
	.A(write_index),
	.B(SYNTHESIZED_WIRE_17),
	
	.E(SYNTHESIZED_WIRE_16)
	);


ConstantX	b2v_inst39(
	.DATA_OUT(SYNTHESIZED_WIRE_17));
	defparam	b2v_inst39.const = 6;
	defparam	b2v_inst39.size = 4;

assign	ld7 = write_en & SYNTHESIZED_WIRE_18;


CMP4	b2v_inst41(
	.A(write_index),
	.B(SYNTHESIZED_WIRE_19),
	
	.E(SYNTHESIZED_WIRE_18)
	);


ConstantX	b2v_inst42(
	.DATA_OUT(SYNTHESIZED_WIRE_19));
	defparam	b2v_inst42.const = 7;
	defparam	b2v_inst42.size = 4;

assign	ld8 = write_en & SYNTHESIZED_WIRE_20;


CMP4	b2v_inst44(
	.A(write_index),
	.B(SYNTHESIZED_WIRE_21),
	
	.E(SYNTHESIZED_WIRE_20)
	);


ConstantX	b2v_inst45(
	.DATA_OUT(SYNTHESIZED_WIRE_21));
	defparam	b2v_inst45.const = 8;
	defparam	b2v_inst45.size = 4;

assign	ld9 = write_en & SYNTHESIZED_WIRE_22;


CMP4	b2v_inst47(
	.A(write_index),
	.B(SYNTHESIZED_WIRE_23),
	
	.E(SYNTHESIZED_WIRE_22)
	);


ConstantX	b2v_inst48(
	.DATA_OUT(SYNTHESIZED_WIRE_23));
	defparam	b2v_inst48.const = 9;
	defparam	b2v_inst48.size = 4;

assign	ld10 = write_en & SYNTHESIZED_WIRE_24;


CMP4	b2v_inst50(
	.A(write_index),
	.B(SYNTHESIZED_WIRE_25),
	
	.E(SYNTHESIZED_WIRE_24)
	);


ConstantX	b2v_inst51(
	.DATA_OUT(SYNTHESIZED_WIRE_25));
	defparam	b2v_inst51.const = 10;
	defparam	b2v_inst51.size = 4;

assign	ld11 = write_en & SYNTHESIZED_WIRE_26;


CMP4	b2v_inst53(
	.A(write_index),
	.B(SYNTHESIZED_WIRE_27),
	
	.E(SYNTHESIZED_WIRE_26)
	);


ConstantX	b2v_inst54(
	.DATA_OUT(SYNTHESIZED_WIRE_27));
	defparam	b2v_inst54.const = 11;
	defparam	b2v_inst54.size = 4;


REG32_LD_CL	b2v_inst7(
	.LD(ld1),
	.CL(reset),
	.clk(clk),
	.I(write_data),
	.A(2_point));


REG32_LD_CL	b2v_inst8(
	.LD(ld2),
	.CL(reset),
	.clk(clk),
	.I(write_data),
	.A(3_point));


REG32_LD_CL	b2v_inst9(
	.LD(ld3),
	.CL(reset),
	.clk(clk),
	.I(write_data),
	.A(4_point));


REG32_LD_CL	b2v_inst99(
	.LD(ld0),
	.CL(reset),
	.clk(clk),
	.I(write_data),
	.A(1_point));


endmodule
