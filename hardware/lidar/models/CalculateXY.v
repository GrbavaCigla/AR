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
// CREATED		"Wed Aug 26 18:46:19 2026"

module CalculateXY(
	clk,
	angle,
	distance,
	x_pixel,
	y_pixel
);


input wire	clk;
input wire	[15:0] angle;
input wire	[15:0] distance;
output wire	[15:0] x_pixel;
output wire	[15:0] y_pixel;

wire	[31:0] a;
wire	[31:0] b;
wire	[31:0] c;
wire	[15:0] cos;
wire	cos_neg;
wire	[15:0] cosinus;
wire	[31:0] d;
wire	jedan;
wire	nq1;
wire	nq2;
wire	nula;
wire	[9:0] nule_10;
wire	[14:0] nule_15;
wire	[15:0] nule_16;
wire	[19:0] nule_20;
wire	[2:0] nule_3;
wire	[3:0] nule_4;
wire	q1;
wire	q2;
wire	q3;
wire	q4;
wire	[15:0] reference_angle;
wire	[31:0] res;
wire	[15:0] rom_cos_addr;
wire	[31:0] rom_sin_addr;
wire	[1:0] sel;
wire	[15:0] sin;
wire	sin_neg;
wire	[15:0] sinus;
wire	[32:0] x_lidar;
wire	[8:0] x_offset;
wire	[32:0] x_temp;
wire	[6:0] xVisi_7;
wire	[15:0] y;
wire	[32:0] y_lidar;
wire	[8:0] y_offset;
wire	[32:0] y_temp;
wire	[6:0] yVisi_7;
wire	[15:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[15:0] SYNTHESIZED_WIRE_5;
wire	[15:0] SYNTHESIZED_WIRE_6;
wire	[15:0] SYNTHESIZED_WIRE_7;
wire	[15:0] SYNTHESIZED_WIRE_8;
wire	[15:0] SYNTHESIZED_WIRE_9;
wire	[15:0] SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	[15:0] SYNTHESIZED_WIRE_13;
wire	[31:0] SYNTHESIZED_WIRE_14;
wire	[31:0] SYNTHESIZED_WIRE_15;
wire	[15:0] SYNTHESIZED_WIRE_16;
wire	[15:0] SYNTHESIZED_WIRE_17;
wire	[15:0] SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	[15:0] SYNTHESIZED_WIRE_21;
wire	[15:0] SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	[15:0] SYNTHESIZED_WIRE_25;

wire	[15:0] GDFX_TEMP_SIGNAL_13;
wire	[6:0] GDFX_TEMP_SIGNAL_6;
wire	[6:0] GDFX_TEMP_SIGNAL_5;
wire	[15:0] GDFX_TEMP_SIGNAL_12;
wire	[32:0] GDFX_TEMP_SIGNAL_11;
wire	[32:0] GDFX_TEMP_SIGNAL_10;
wire	[16:0] GDFX_TEMP_SIGNAL_8;
wire	[16:0] GDFX_TEMP_SIGNAL_9;
wire	[31:0] GDFX_TEMP_SIGNAL_7;
wire	[31:0] GDFX_TEMP_SIGNAL_4;
wire	[31:0] GDFX_TEMP_SIGNAL_3;
wire	[31:0] GDFX_TEMP_SIGNAL_2;
wire	[31:0] GDFX_TEMP_SIGNAL_1;
wire	[15:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_13 = {yVisi_7[6:0],y_offset[8:0]};
assign	GDFX_TEMP_SIGNAL_6 = {y_offset[8],y_offset[8],y_offset[8],y_offset[8],y_offset[8],y_offset[8],y_offset[8]};
assign	GDFX_TEMP_SIGNAL_5 = {x_offset[8],x_offset[8],x_offset[8],x_offset[8],x_offset[8],x_offset[8],x_offset[8]};
assign	GDFX_TEMP_SIGNAL_12 = {xVisi_7[6:0],x_offset[8:0]};
assign	GDFX_TEMP_SIGNAL_11 = {nule_15[14:0],y_temp[32:15]};
assign	GDFX_TEMP_SIGNAL_10 = {nule_15[14:0],x_temp[32:15]};
assign	GDFX_TEMP_SIGNAL_8 = {nula,distance[15:0]};
assign	GDFX_TEMP_SIGNAL_9 = {nula,distance[15:0]};
assign	GDFX_TEMP_SIGNAL_7 = {nule_20[19:0],res[31:20]};
assign	GDFX_TEMP_SIGNAL_4 = {nule_16[15:0],y[15:0]};
assign	GDFX_TEMP_SIGNAL_3 = {nule_16[15:0],y[15:3],nule_3[2:0]};
assign	GDFX_TEMP_SIGNAL_2 = {nule_16[15:0],y[15:4],nule_4[3:0]};
assign	GDFX_TEMP_SIGNAL_1 = {nule_16[15:0],y[15:10],nule_10[9:0]};
assign	GDFX_TEMP_SIGNAL_0 = {reference_angle[15:3],nula,nula,nula};


CMP16	b2v_inst(
	.A(angle),
	.B(SYNTHESIZED_WIRE_0),
	.G(SYNTHESIZED_WIRE_12),
	.E(SYNTHESIZED_WIRE_11),
	.L(q1));


ConstantX	b2v_inst1(
	.DATA_OUT(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst1.const = 9000;
	defparam	b2v_inst1.size = 16;

assign	q3 = SYNTHESIZED_WIRE_1 & SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_2 =  ~nq2;

assign	q4 = SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4;


MPX4_16BIT	b2v_inst13(
	.data0x(angle),
	.data1x(SYNTHESIZED_WIRE_5),
	.data2x(SYNTHESIZED_WIRE_6),
	.data3x(SYNTHESIZED_WIRE_7),
	.sel(sel),
	.result(reference_angle));


SUB16	b2v_inst14(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_8),
	.B(angle),
	
	.OUT(SYNTHESIZED_WIRE_5));



ConstantX	b2v_inst16(
	.DATA_OUT(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst16.const = 18000;
	defparam	b2v_inst16.size = 16;


SUB16	b2v_inst17(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_9),
	.B(angle),
	
	.OUT(SYNTHESIZED_WIRE_7));


ConstantX	b2v_inst18(
	.DATA_OUT(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst18.const = 36000;
	defparam	b2v_inst18.size = 16;


SUB16	b2v_inst19(
	.E_0(nula),
	.A(angle),
	.B(SYNTHESIZED_WIRE_10),
	
	.OUT(SYNTHESIZED_WIRE_6));

assign	nq1 = SYNTHESIZED_WIRE_11 | SYNTHESIZED_WIRE_12;


ConstantX	b2v_inst20(
	.DATA_OUT(SYNTHESIZED_WIRE_10));
	defparam	b2v_inst20.const = 18000;
	defparam	b2v_inst20.size = 16;

assign	sel[0] = q4 | q2;

assign	sel[1] = q3 | q1;


ROM_SIN	b2v_inst23(
	.wren(nula),
	.clock(clk),
	.address(rom_sin_addr[5:0]),
	.data(nule_16),
	.q(sin));


SUB16	b2v_inst24(
	.E_0(nula),
	.A(GDFX_TEMP_SIGNAL_0),
	.B(reference_angle),
	
	.OUT(y));

assign	a = GDFX_TEMP_SIGNAL_1;


assign	b = GDFX_TEMP_SIGNAL_2;


assign	c = GDFX_TEMP_SIGNAL_3;


assign	d = GDFX_TEMP_SIGNAL_4;


assign	xVisi_7 = GDFX_TEMP_SIGNAL_5;



CMP16	b2v_inst3(
	.A(angle),
	.B(SYNTHESIZED_WIRE_13),
	.G(SYNTHESIZED_WIRE_24),
	.E(SYNTHESIZED_WIRE_23),
	.L(SYNTHESIZED_WIRE_19));

assign	yVisi_7 = GDFX_TEMP_SIGNAL_6;


assign	rom_sin_addr = GDFX_TEMP_SIGNAL_7;



ADD32	b2v_inst33(
	.C_0(nula),
	.A(a),
	.B(b),
	
	.OUT(SYNTHESIZED_WIRE_14));


ADD32	b2v_inst34(
	.C_0(nula),
	.A(c),
	.B(d),
	
	.OUT(SYNTHESIZED_WIRE_15));


ADD32	b2v_inst35(
	.C_0(nula),
	.A(SYNTHESIZED_WIRE_14),
	.B(SYNTHESIZED_WIRE_15),
	
	.OUT(res));


ConstantX	b2v_inst36(
	.DATA_OUT(nule_16));
	defparam	b2v_inst36.const = 0;
	defparam	b2v_inst36.size = 16;


ConstantX	b2v_inst37(
	.DATA_OUT(nule_10));
	defparam	b2v_inst37.const = 0;
	defparam	b2v_inst37.size = 10;


ConstantX	b2v_inst38(
	.DATA_OUT(nule_4));
	defparam	b2v_inst38.const = 0;
	defparam	b2v_inst38.size = 4;


ConstantX	b2v_inst39(
	.DATA_OUT(nule_3));
	defparam	b2v_inst39.const = 0;
	defparam	b2v_inst39.size = 3;


ConstantX	b2v_inst4(
	.DATA_OUT(SYNTHESIZED_WIRE_13));
	defparam	b2v_inst4.const = 18000;
	defparam	b2v_inst4.size = 16;


ConstantX	b2v_inst40(
	.DATA_OUT(nule_20));
	defparam	b2v_inst40.const = 0;
	defparam	b2v_inst40.size = 20;


ROM_SIN	b2v_inst41(
	.wren(nula),
	.clock(clk),
	.address(rom_cos_addr[5:0]),
	.data(nule_16),
	.q(cos));


ConstantX	b2v_inst42(
	.DATA_OUT(SYNTHESIZED_WIRE_16));
	defparam	b2v_inst42.const = 63;
	defparam	b2v_inst42.size = 16;


SUB16	b2v_inst43(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_16),
	.B(rom_sin_addr[15:0]),
	
	.OUT(rom_cos_addr));


MPX2_16BIT	b2v_inst44(
	.S(sin_neg),
	.E(jedan),
	.I0(sin),
	.I1(SYNTHESIZED_WIRE_17),
	.D(sinus));


assign	sin_neg = q4 | q3;

assign	cos_neg = q3 | q2;


SUB16	b2v_inst48(
	.E_0(nula),
	.A(nule_16),
	.B(sin),
	
	.OUT(SYNTHESIZED_WIRE_17));


MPX2_16BIT	b2v_inst49(
	.S(cos_neg),
	.E(jedan),
	.I0(cos),
	.I1(SYNTHESIZED_WIRE_18),
	.D(cosinus));

assign	q2 = SYNTHESIZED_WIRE_19 & SYNTHESIZED_WIRE_20;


SUB16	b2v_inst50(
	.E_0(nula),
	.A(nule_16),
	.B(cos),
	
	.OUT(SYNTHESIZED_WIRE_18));


MUL_32b	b2v_inst51(
	.dataa(GDFX_TEMP_SIGNAL_8),
	.datab(sinus),
	.result(y_temp));


MUL_32b	b2v_inst52(
	.dataa(GDFX_TEMP_SIGNAL_9),
	.datab(cosinus),
	.result(x_temp));

assign	x_lidar = GDFX_TEMP_SIGNAL_10;


assign	y_lidar = GDFX_TEMP_SIGNAL_11;


assign	x_offset = x_lidar[12:4];


assign	y_offset = y_lidar[12:4];



ADD16	b2v_inst57(
	.C_0(nula),
	.A(SYNTHESIZED_WIRE_21),
	.B(GDFX_TEMP_SIGNAL_12),
	
	.OUT(x_pixel));


ConstantX	b2v_inst58(
	.DATA_OUT(SYNTHESIZED_WIRE_21));
	defparam	b2v_inst58.const = 320;
	defparam	b2v_inst58.size = 16;


SUB16	b2v_inst59(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_22),
	.B(GDFX_TEMP_SIGNAL_13),
	
	.OUT(y_pixel));

assign	SYNTHESIZED_WIRE_20 =  ~nq1;


ConstantX	b2v_inst60(
	.DATA_OUT(SYNTHESIZED_WIRE_22));
	defparam	b2v_inst60.const = 240;
	defparam	b2v_inst60.size = 16;


ConstantX	b2v_inst62(
	.DATA_OUT(nule_15));
	defparam	b2v_inst62.const = 0;
	defparam	b2v_inst62.size = 15;

assign	nq2 = SYNTHESIZED_WIRE_23 | SYNTHESIZED_WIRE_24;


CMP16	b2v_inst8(
	.A(angle),
	.B(SYNTHESIZED_WIRE_25),
	.G(SYNTHESIZED_WIRE_4),
	.E(SYNTHESIZED_WIRE_3),
	.L(SYNTHESIZED_WIRE_1));


ConstantX	b2v_inst9(
	.DATA_OUT(SYNTHESIZED_WIRE_25));
	defparam	b2v_inst9.const = 27000;
	defparam	b2v_inst9.size = 16;

assign	jedan = 1;
assign	nula = 0;

endmodule
