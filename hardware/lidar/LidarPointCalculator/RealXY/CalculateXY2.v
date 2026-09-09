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
// CREATED		"Tue Sep 08 11:01:43 2026"

module CalculateXY2(
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
wire	dist_to_far;
wire	jedan;
wire	[15:0] late_distance;
wire	[15:0] max_distance;
wire	nq1;
wire	nq2;
wire	nula;
wire	[9:0] nule_10;
wire	[10:0] nule_11;
wire	[12:0] nule_13;
wire	[14:0] nule_15;
wire	[15:0] nule_16;
wire	[19:0] nule_20;
wire	[2:0] nule_3;
wire	[3:0] nule_4;
wire	[4:0] nule_5;
wire	[5:0] nule_6;
wire	[7:0] nule_8;
wire	q1;
wire	q2;
wire	q3;
wire	q4;
wire	[15:0] reference_angle;
wire	[31:0] res;
wire	[15:0] rom_address;
wire	[15:0] rom_cos_addr;
wire	[31:0] rom_sin_addr;
wire	[1:0] sel;
wire	[15:0] sin;
wire	sin_neg;
wire	[15:0] sinus;
wire	[8:0] x_offset;
wire	[32:0] x_temp;
wire	[6:0] xVisi_7;
wire	[8:0] y_offset;
wire	[32:0] y_temp;
wire	[6:0] yVisi_7;
wire	[15:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[15:0] SYNTHESIZED_WIRE_4;
wire	[15:0] SYNTHESIZED_WIRE_5;
wire	[15:0] SYNTHESIZED_WIRE_6;
wire	[15:0] SYNTHESIZED_WIRE_7;
wire	[15:0] SYNTHESIZED_WIRE_8;
wire	[15:0] SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	[15:0] SYNTHESIZED_WIRE_28;
wire	[15:0] SYNTHESIZED_WIRE_13;
wire	[15:0] SYNTHESIZED_WIRE_14;
wire	[31:0] SYNTHESIZED_WIRE_15;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	[15:0] SYNTHESIZED_WIRE_19;
wire	[15:0] SYNTHESIZED_WIRE_20;
wire	[15:0] SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	[15:0] SYNTHESIZED_WIRE_23;
wire	[15:0] SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	[15:0] SYNTHESIZED_WIRE_27;

wire	[31:0] GDFX_TEMP_SIGNAL_3;
wire	[31:0] GDFX_TEMP_SIGNAL_2;
wire	[31:0] GDFX_TEMP_SIGNAL_1;
wire	[31:0] GDFX_TEMP_SIGNAL_0;
wire	[31:0] GDFX_TEMP_SIGNAL_4;
wire	[16:0] GDFX_TEMP_SIGNAL_10;
wire	[16:0] GDFX_TEMP_SIGNAL_11;
wire	[15:0] GDFX_TEMP_SIGNAL_9;
wire	[6:0] GDFX_TEMP_SIGNAL_6;
wire	[6:0] GDFX_TEMP_SIGNAL_5;
wire	[15:0] GDFX_TEMP_SIGNAL_8;
wire	[31:0] GDFX_TEMP_SIGNAL_7;


assign	GDFX_TEMP_SIGNAL_3 = {nule_11[10:0],reference_angle[15:0],nule_5[4:0]};
assign	GDFX_TEMP_SIGNAL_2 = {nule_8[7:0],reference_angle[15:0],nule_8[7:0]};
assign	GDFX_TEMP_SIGNAL_1 = {nule_6[5:0],reference_angle[15:0],nule_10[9:0]};
assign	GDFX_TEMP_SIGNAL_0 = {nule_3[2:0],reference_angle[15:0],nule_13[12:0]};
assign	GDFX_TEMP_SIGNAL_4 = {nule_16[15:0],reference_angle[15:0]};
assign	GDFX_TEMP_SIGNAL_10 = {nula,late_distance[15:0]};
assign	GDFX_TEMP_SIGNAL_11 = {nula,late_distance[15:0]};
assign	GDFX_TEMP_SIGNAL_9 = {yVisi_7[6:0],y_offset[8:0]};
assign	GDFX_TEMP_SIGNAL_6 = {y_offset[8],y_offset[8],y_offset[8],y_offset[8],y_offset[8],y_offset[8],y_offset[8]};
assign	GDFX_TEMP_SIGNAL_5 = {x_offset[8],x_offset[8],x_offset[8],x_offset[8],x_offset[8],x_offset[8],x_offset[8]};
assign	GDFX_TEMP_SIGNAL_8 = {xVisi_7[6:0],x_offset[8:0]};
assign	GDFX_TEMP_SIGNAL_7 = {nule_20[19:0],res[31:20]};


CMP16	b2v_inst(
	.A(angle),
	.B(SYNTHESIZED_WIRE_0),
	.G(SYNTHESIZED_WIRE_11),
	.E(SYNTHESIZED_WIRE_10)
	);


ConstantX	b2v_inst1(
	.DATA_OUT(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst1.const = 9000;
	defparam	b2v_inst1.size = 16;

assign	q3 = SYNTHESIZED_WIRE_1 & nq2;


SUB32	b2v_inst11(
	.E_0(nula),
	.A(GDFX_TEMP_SIGNAL_0),
	.B(GDFX_TEMP_SIGNAL_1),
	
	.OUT(a));

assign	q4 = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;


MPX4_16BIT	b2v_inst13(
	.data0x(angle),
	.data1x(SYNTHESIZED_WIRE_4),
	.data2x(SYNTHESIZED_WIRE_5),
	.data3x(SYNTHESIZED_WIRE_6),
	.sel(sel),
	.result(reference_angle));


SUB16	b2v_inst14(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_7),
	.B(angle),
	
	.OUT(SYNTHESIZED_WIRE_4));



ConstantX	b2v_inst16(
	.DATA_OUT(SYNTHESIZED_WIRE_7));
	defparam	b2v_inst16.const = 18000;
	defparam	b2v_inst16.size = 16;


SUB16	b2v_inst17(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_8),
	.B(angle),
	
	.OUT(SYNTHESIZED_WIRE_6));


ConstantX	b2v_inst18(
	.DATA_OUT(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst18.const = 36000;
	defparam	b2v_inst18.size = 16;


SUB16	b2v_inst19(
	.E_0(nula),
	.A(angle),
	.B(SYNTHESIZED_WIRE_9),
	
	.OUT(SYNTHESIZED_WIRE_5));

assign	nq1 = SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_11;


ConstantX	b2v_inst20(
	.DATA_OUT(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst20.const = 18000;
	defparam	b2v_inst20.size = 16;

assign	sel[0] = q4 | q2;

assign	sel[1] = q3 | q4;


ROM_SIN_ASYNC	b2v_inst23(
	.address(rom_cos_addr[5:0]),
	.q(cos));


CMP16	b2v_inst24(
	.A(SYNTHESIZED_WIRE_28),
	.B(rom_sin_addr[15:0]),
	.G(SYNTHESIZED_WIRE_17)
	
	);


ConstantX	b2v_inst25(
	.DATA_OUT(SYNTHESIZED_WIRE_28));
	defparam	b2v_inst25.const = 63;
	defparam	b2v_inst25.size = 16;

assign	b = GDFX_TEMP_SIGNAL_2;


assign	c = GDFX_TEMP_SIGNAL_3;


assign	d = GDFX_TEMP_SIGNAL_4;


assign	xVisi_7 = GDFX_TEMP_SIGNAL_5;



CMP16	b2v_inst3(
	.A(angle),
	.B(SYNTHESIZED_WIRE_13),
	.G(SYNTHESIZED_WIRE_26),
	.E(SYNTHESIZED_WIRE_25),
	.L(SYNTHESIZED_WIRE_22));

assign	yVisi_7 = GDFX_TEMP_SIGNAL_6;



REG16_LD_CL	b2v_inst31(
	.LD(jedan),
	.CL(nula),
	.clk(clk),
	.I(SYNTHESIZED_WIRE_14),
	.A(late_distance));

assign	rom_sin_addr = GDFX_TEMP_SIGNAL_7;



ADD32	b2v_inst33(
	.C_0(nula),
	.A(a),
	.B(b),
	
	.OUT(SYNTHESIZED_WIRE_15));


ADD32	b2v_inst34(
	.C_0(nula),
	.A(c),
	.B(d),
	
	.OUT(SYNTHESIZED_WIRE_16));


ADD32	b2v_inst35(
	.C_0(nula),
	.A(SYNTHESIZED_WIRE_15),
	.B(SYNTHESIZED_WIRE_16),
	
	.OUT(res));


ConstantX	b2v_inst36(
	.DATA_OUT(nule_16));
	defparam	b2v_inst36.const = 0;
	defparam	b2v_inst36.size = 16;


ConstantX	b2v_inst37(
	.DATA_OUT(nule_10));
	defparam	b2v_inst37.const = 0;
	defparam	b2v_inst37.size = 10;



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


MPX2_16BIT	b2v_inst41(
	.S(SYNTHESIZED_WIRE_17),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_28),
	.I1(rom_sin_addr[15:0]),
	.D(rom_address));


ConstantX	b2v_inst42(
	.DATA_OUT(SYNTHESIZED_WIRE_19));
	defparam	b2v_inst42.const = 63;
	defparam	b2v_inst42.size = 16;


SUB16	b2v_inst43(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_19),
	.B(rom_address),
	
	.OUT(rom_cos_addr));


MPX2_16BIT	b2v_inst44(
	.S(sin_neg),
	.E(jedan),
	.I0(sin),
	.I1(SYNTHESIZED_WIRE_20),
	.D(sinus));


assign	sin_neg = q4 | q3;

assign	cos_neg = q3 | q2;


SUB16	b2v_inst48(
	.E_0(nula),
	.A(nule_16),
	.B(sin),
	
	.OUT(SYNTHESIZED_WIRE_20));


MPX2_16BIT	b2v_inst49(
	.S(cos_neg),
	.E(jedan),
	.I0(cos),
	.I1(SYNTHESIZED_WIRE_21),
	.D(cosinus));

assign	q2 = SYNTHESIZED_WIRE_22 & nq1;


SUB16	b2v_inst50(
	.E_0(nula),
	.A(nule_16),
	.B(cos),
	
	.OUT(SYNTHESIZED_WIRE_21));


ConstantX	b2v_inst51(
	.DATA_OUT(nule_13));
	defparam	b2v_inst51.const = 0;
	defparam	b2v_inst51.size = 13;


ConstantX	b2v_inst52(
	.DATA_OUT(nule_6));
	defparam	b2v_inst52.const = 0;
	defparam	b2v_inst52.size = 6;

assign	x_offset = x_temp[28:20];


assign	y_offset = y_temp[28:20];



ADD16	b2v_inst57(
	.C_0(nula),
	.A(SYNTHESIZED_WIRE_23),
	.B(GDFX_TEMP_SIGNAL_8),
	
	.OUT(x_pixel));


ConstantX	b2v_inst58(
	.DATA_OUT(SYNTHESIZED_WIRE_23));
	defparam	b2v_inst58.const = 400;
	defparam	b2v_inst58.size = 16;


SUB16	b2v_inst59(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_24),
	.B(GDFX_TEMP_SIGNAL_9),
	
	.OUT(y_pixel));


ROM_SIN_ASYNC	b2v_inst6(
	.address(rom_address[5:0]),
	.q(sin));


ConstantX	b2v_inst60(
	.DATA_OUT(SYNTHESIZED_WIRE_24));
	defparam	b2v_inst60.const = 300;
	defparam	b2v_inst60.size = 16;


ConstantX	b2v_inst61(
	.DATA_OUT(nule_8));
	defparam	b2v_inst61.const = 0;
	defparam	b2v_inst61.size = 8;





MUL_32b	b2v_inst65(
	.dataa(GDFX_TEMP_SIGNAL_10),
	.datab(cosinus),
	.result(x_temp));


MUL_32b	b2v_inst66(
	.dataa(GDFX_TEMP_SIGNAL_11),
	.datab(sinus),
	.result(y_temp));


ConstantX	b2v_inst67(
	.DATA_OUT(nule_11));
	defparam	b2v_inst67.const = 0;
	defparam	b2v_inst67.size = 11;


ConstantX	b2v_inst68(
	.DATA_OUT(nule_5));
	defparam	b2v_inst68.const = 0;
	defparam	b2v_inst68.size = 5;

assign	nq2 = SYNTHESIZED_WIRE_25 | SYNTHESIZED_WIRE_26;


ConstantX	b2v_inst71(
	.DATA_OUT(max_distance));
	defparam	b2v_inst71.const = 8000;
	defparam	b2v_inst71.size = 16;


CMP16	b2v_inst72(
	.A(distance),
	.B(max_distance),
	.G(dist_to_far)
	
	);


MPX2_16BIT	b2v_inst73(
	.S(dist_to_far),
	.E(jedan),
	.I0(distance),
	.I1(max_distance),
	.D(SYNTHESIZED_WIRE_14));


CMP16	b2v_inst8(
	.A(angle),
	.B(SYNTHESIZED_WIRE_27),
	.G(SYNTHESIZED_WIRE_3),
	.E(SYNTHESIZED_WIRE_2),
	.L(SYNTHESIZED_WIRE_1));


ConstantX	b2v_inst9(
	.DATA_OUT(SYNTHESIZED_WIRE_27));
	defparam	b2v_inst9.const = 27000;
	defparam	b2v_inst9.size = 16;

assign	jedan = 1;
assign	nula = 0;

endmodule
