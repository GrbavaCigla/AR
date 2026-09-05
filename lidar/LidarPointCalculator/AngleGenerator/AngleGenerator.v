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
// CREATED		"Sat Sep 05 21:59:58 2026"

module AngleGenerator(
	end_angle,
	start_angle,
	angle_p0,
	angle_p1,
	angle_p1_0,
	angle_p1_1,
	angle_p2,
	angle_p3,
	angle_p4,
	angle_p5,
	angle_p6,
	angle_p7,
	angle_p8,
	angle_p9
);


input wire	[15:0] end_angle;
input wire	[15:0] start_angle;
output wire	[15:0] angle_p0;
output wire	[15:0] angle_p1;
output wire	[15:0] angle_p1_0;
output wire	[15:0] angle_p1_1;
output wire	[15:0] angle_p2;
output wire	[15:0] angle_p3;
output wire	[15:0] angle_p4;
output wire	[15:0] angle_p5;
output wire	[15:0] angle_p6;
output wire	[15:0] angle_p7;
output wire	[15:0] angle_p8;
output wire	[15:0] angle_p9;

wire	[15:0] angle_p1_ALTERA_SYNTHESIZED0;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED1;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED2;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED3;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED4;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED5;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED6;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED7;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED8;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED9;
wire	[15:0] angle_range;
wire	[15:0] delta;
wire	jedan;
wire	nula;
wire	[9:0] nule_10;
wire	[15:0] nule_16;
wire	[18:0] nule_19;
wire	[2:0] nule_3;
wire	[4:0] nule_5;
wire	[7:0] nule_8;
wire	[8:0] nule_9;
wire	[31:0] range32;
wire	s;
wire	s1;
wire	s10;
wire	s11;
wire	s2;
wire	s3;
wire	s4;
wire	s5;
wire	s6;
wire	s7;
wire	s8;
wire	s9;
wire	[31:0] shift3;
wire	[31:0] shift5;
wire	[31:0] shift8;
wire	[31:0] shift9;
wire	[31:0] sum1;
wire	[31:0] sum2;
wire	[31:0] sum3;
wire	[31:0] sum4;
wire	[31:0] sum5;
wire	[15:0] SYNTHESIZED_WIRE_93;
wire	[15:0] SYNTHESIZED_WIRE_94;
wire	[15:0] SYNTHESIZED_WIRE_95;
wire	[15:0] SYNTHESIZED_WIRE_96;
wire	[15:0] SYNTHESIZED_WIRE_97;
wire	[15:0] SYNTHESIZED_WIRE_98;
wire	[15:0] SYNTHESIZED_WIRE_99;
wire	[15:0] SYNTHESIZED_WIRE_100;
wire	[15:0] SYNTHESIZED_WIRE_101;
wire	[15:0] SYNTHESIZED_WIRE_102;
wire	[15:0] SYNTHESIZED_WIRE_103;
wire	[15:0] SYNTHESIZED_WIRE_104;
wire	[15:0] SYNTHESIZED_WIRE_105;
wire	[15:0] SYNTHESIZED_WIRE_106;
wire	[15:0] SYNTHESIZED_WIRE_107;
wire	[15:0] SYNTHESIZED_WIRE_108;
wire	[15:0] SYNTHESIZED_WIRE_109;
wire	[15:0] SYNTHESIZED_WIRE_110;
wire	[15:0] SYNTHESIZED_WIRE_18;
wire	[15:0] SYNTHESIZED_WIRE_111;
wire	[15:0] SYNTHESIZED_WIRE_112;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	[31:0] SYNTHESIZED_WIRE_24;
wire	[15:0] SYNTHESIZED_WIRE_25;
wire	[15:0] SYNTHESIZED_WIRE_113;
wire	[15:0] SYNTHESIZED_WIRE_114;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	[15:0] SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	[15:0] SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	[15:0] SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	[15:0] SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_54;
wire	[15:0] SYNTHESIZED_WIRE_55;
wire	SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_60;
wire	[15:0] SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_66;
wire	[15:0] SYNTHESIZED_WIRE_67;
wire	SYNTHESIZED_WIRE_71;
wire	SYNTHESIZED_WIRE_72;
wire	[15:0] SYNTHESIZED_WIRE_73;
wire	SYNTHESIZED_WIRE_77;
wire	SYNTHESIZED_WIRE_78;
wire	[15:0] SYNTHESIZED_WIRE_79;
wire	SYNTHESIZED_WIRE_83;
wire	SYNTHESIZED_WIRE_84;
wire	[15:0] SYNTHESIZED_WIRE_85;
wire	[15:0] SYNTHESIZED_WIRE_115;
wire	[15:0] SYNTHESIZED_WIRE_91;

wire	[31:0] GDFX_TEMP_SIGNAL_1;
wire	[31:0] GDFX_TEMP_SIGNAL_0;
wire	[31:0] GDFX_TEMP_SIGNAL_4;
wire	[31:0] GDFX_TEMP_SIGNAL_2;
wire	[31:0] GDFX_TEMP_SIGNAL_3;


assign	GDFX_TEMP_SIGNAL_1 = {range32[28:0],nule_3[2:0]};
assign	GDFX_TEMP_SIGNAL_0 = {range32[26:0],nule_5[4:0]};
assign	GDFX_TEMP_SIGNAL_4 = {range32[23:0],nule_8[7:0]};
assign	GDFX_TEMP_SIGNAL_2 = {range32[22:0],nule_9[8:0]};
assign	GDFX_TEMP_SIGNAL_3 = {nule_16[15:0],angle_range[15:0]};




SUB16	b2v_inst100(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_93),
	.B(SYNTHESIZED_WIRE_94),
	
	.OUT(SYNTHESIZED_WIRE_31));


SUB16	b2v_inst101(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_95),
	.B(SYNTHESIZED_WIRE_96),
	
	.OUT(SYNTHESIZED_WIRE_37));


SUB16	b2v_inst102(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_97),
	.B(SYNTHESIZED_WIRE_98),
	
	.OUT(SYNTHESIZED_WIRE_43));


SUB16	b2v_inst103(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_99),
	.B(SYNTHESIZED_WIRE_100),
	
	.OUT(SYNTHESIZED_WIRE_79));


SUB16	b2v_inst104(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_101),
	.B(SYNTHESIZED_WIRE_102),
	
	.OUT(SYNTHESIZED_WIRE_73));


SUB16	b2v_inst105(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_103),
	.B(SYNTHESIZED_WIRE_104),
	
	.OUT(SYNTHESIZED_WIRE_67));


SUB16	b2v_inst106(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_105),
	.B(SYNTHESIZED_WIRE_106),
	
	.OUT(SYNTHESIZED_WIRE_61));


SUB16	b2v_inst107(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_107),
	.B(SYNTHESIZED_WIRE_108),
	
	.OUT(SYNTHESIZED_WIRE_55));


SUB16	b2v_inst108(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_109),
	.B(SYNTHESIZED_WIRE_110),
	
	.OUT(SYNTHESIZED_WIRE_49));


SUB16	b2v_inst11(
	.E_0(nula),
	.A(end_angle),
	.B(start_angle),
	
	.OUT(SYNTHESIZED_WIRE_115));

assign	angle_p0 = start_angle;


assign	shift5 = GDFX_TEMP_SIGNAL_0;



assign	shift3 = GDFX_TEMP_SIGNAL_1;



ConstantX	b2v_inst15(
	.DATA_OUT(nule_9));
	defparam	b2v_inst15.const = 0;
	defparam	b2v_inst15.size = 9;


ConstantX	b2v_inst16(
	.DATA_OUT(nule_3));
	defparam	b2v_inst16.const = 0;
	defparam	b2v_inst16.size = 3;


ConstantX	b2v_inst17(
	.DATA_OUT(nule_5));
	defparam	b2v_inst17.const = 0;
	defparam	b2v_inst17.size = 5;


ConstantX	b2v_inst176(
	.DATA_OUT(SYNTHESIZED_WIRE_24));
	defparam	b2v_inst176.const = 4096;
	defparam	b2v_inst176.size = 32;


ConstantX	b2v_inst18(
	.DATA_OUT(nule_8));
	defparam	b2v_inst18.const = 0;
	defparam	b2v_inst18.size = 8;


ADD32	b2v_inst19(
	.C_0(nula),
	.A(shift9),
	.B(shift8),
	
	.OUT(sum1));


SUB32	b2v_inst20(
	.E_0(nula),
	.A(sum1),
	.B(shift5),
	
	.OUT(sum2));

assign	shift9 = GDFX_TEMP_SIGNAL_2;



ADD32	b2v_inst21(
	.C_0(nula),
	.A(sum2),
	.B(shift3),
	
	.OUT(sum3));


ADD32	b2v_inst22(
	.C_0(nula),
	.A(sum3),
	.B(range32),
	
	.OUT(sum4));


ConstantX	b2v_inst23(
	.DATA_OUT(SYNTHESIZED_WIRE_91));
	defparam	b2v_inst23.const = 36000;
	defparam	b2v_inst23.size = 16;


MPX2_16BIT	b2v_inst24(
	.S(s1),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_18),
	.I1(SYNTHESIZED_WIRE_111),
	.D(angle_p_ALTERA_SYNTHESIZED1));


CMP16	b2v_inst25(
	.A(SYNTHESIZED_WIRE_111),
	.B(SYNTHESIZED_WIRE_112),
	
	.E(SYNTHESIZED_WIRE_23),
	.L(SYNTHESIZED_WIRE_22));


ConstantX	b2v_inst26(
	.DATA_OUT(SYNTHESIZED_WIRE_112));
	defparam	b2v_inst26.const = 36000;
	defparam	b2v_inst26.size = 16;

assign	s1 = SYNTHESIZED_WIRE_22 | SYNTHESIZED_WIRE_23;


ADD32	b2v_inst28(
	.C_0(nula),
	.A(SYNTHESIZED_WIRE_24),
	.B(sum4),
	
	.OUT(sum5));


MPX2_16BIT	b2v_inst29(
	.S(s2),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_25),
	.I1(SYNTHESIZED_WIRE_113),
	.D(angle_p_ALTERA_SYNTHESIZED2));


ConstantX	b2v_inst3(
	.DATA_OUT(nule_16));
	defparam	b2v_inst3.const = 0;
	defparam	b2v_inst3.size = 16;


CMP16	b2v_inst30(
	.A(SYNTHESIZED_WIRE_113),
	.B(SYNTHESIZED_WIRE_114),
	
	.E(SYNTHESIZED_WIRE_30),
	.L(SYNTHESIZED_WIRE_29));


ConstantX	b2v_inst31(
	.DATA_OUT(SYNTHESIZED_WIRE_114));
	defparam	b2v_inst31.const = 36000;
	defparam	b2v_inst31.size = 16;

assign	s2 = SYNTHESIZED_WIRE_29 | SYNTHESIZED_WIRE_30;

assign	delta = sum5[28:13];



MPX2_16BIT	b2v_inst34(
	.S(s3),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_31),
	.I1(SYNTHESIZED_WIRE_93),
	.D(angle_p_ALTERA_SYNTHESIZED3));


CMP16	b2v_inst35(
	.A(SYNTHESIZED_WIRE_93),
	.B(SYNTHESIZED_WIRE_94),
	
	.E(SYNTHESIZED_WIRE_36),
	.L(SYNTHESIZED_WIRE_35));


ConstantX	b2v_inst36(
	.DATA_OUT(SYNTHESIZED_WIRE_94));
	defparam	b2v_inst36.const = 36000;
	defparam	b2v_inst36.size = 16;

assign	s3 = SYNTHESIZED_WIRE_35 | SYNTHESIZED_WIRE_36;


MPX2_16BIT	b2v_inst39(
	.S(s4),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_37),
	.I1(SYNTHESIZED_WIRE_95),
	.D(angle_p_ALTERA_SYNTHESIZED4));


CMP16	b2v_inst40(
	.A(SYNTHESIZED_WIRE_95),
	.B(SYNTHESIZED_WIRE_96),
	
	.E(SYNTHESIZED_WIRE_42),
	.L(SYNTHESIZED_WIRE_41));


ConstantX	b2v_inst41(
	.DATA_OUT(SYNTHESIZED_WIRE_96));
	defparam	b2v_inst41.const = 36000;
	defparam	b2v_inst41.size = 16;

assign	s4 = SYNTHESIZED_WIRE_41 | SYNTHESIZED_WIRE_42;


MPX2_16BIT	b2v_inst45(
	.S(s5),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_43),
	.I1(SYNTHESIZED_WIRE_97),
	.D(angle_p_ALTERA_SYNTHESIZED5));


CMP16	b2v_inst46(
	.A(SYNTHESIZED_WIRE_97),
	.B(SYNTHESIZED_WIRE_98),
	
	.E(SYNTHESIZED_WIRE_48),
	.L(SYNTHESIZED_WIRE_47));


ConstantX	b2v_inst47(
	.DATA_OUT(SYNTHESIZED_WIRE_98));
	defparam	b2v_inst47.const = 36000;
	defparam	b2v_inst47.size = 16;

assign	s5 = SYNTHESIZED_WIRE_47 | SYNTHESIZED_WIRE_48;

assign	range32 = GDFX_TEMP_SIGNAL_3;



MPX2_16BIT	b2v_inst50(
	.S(s6),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_49),
	.I1(SYNTHESIZED_WIRE_109),
	.D(angle_p_ALTERA_SYNTHESIZED6));


CMP16	b2v_inst51(
	.A(SYNTHESIZED_WIRE_109),
	.B(SYNTHESIZED_WIRE_110),
	
	.E(SYNTHESIZED_WIRE_54),
	.L(SYNTHESIZED_WIRE_53));


ConstantX	b2v_inst52(
	.DATA_OUT(SYNTHESIZED_WIRE_110));
	defparam	b2v_inst52.const = 36000;
	defparam	b2v_inst52.size = 16;

assign	s6 = SYNTHESIZED_WIRE_53 | SYNTHESIZED_WIRE_54;


MPX2_16BIT	b2v_inst55(
	.S(s7),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_55),
	.I1(SYNTHESIZED_WIRE_107),
	.D(angle_p_ALTERA_SYNTHESIZED7));


CMP16	b2v_inst56(
	.A(SYNTHESIZED_WIRE_107),
	.B(SYNTHESIZED_WIRE_108),
	
	.E(SYNTHESIZED_WIRE_60),
	.L(SYNTHESIZED_WIRE_59));


ConstantX	b2v_inst57(
	.DATA_OUT(SYNTHESIZED_WIRE_108));
	defparam	b2v_inst57.const = 36000;
	defparam	b2v_inst57.size = 16;

assign	s7 = SYNTHESIZED_WIRE_59 | SYNTHESIZED_WIRE_60;

assign	shift8 = GDFX_TEMP_SIGNAL_4;



MPX2_16BIT	b2v_inst60(
	.S(s8),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_61),
	.I1(SYNTHESIZED_WIRE_105),
	.D(angle_p_ALTERA_SYNTHESIZED8));


CMP16	b2v_inst61(
	.A(SYNTHESIZED_WIRE_105),
	.B(SYNTHESIZED_WIRE_106),
	
	.E(SYNTHESIZED_WIRE_66),
	.L(SYNTHESIZED_WIRE_65));


ConstantX	b2v_inst62(
	.DATA_OUT(SYNTHESIZED_WIRE_106));
	defparam	b2v_inst62.const = 36000;
	defparam	b2v_inst62.size = 16;

assign	s8 = SYNTHESIZED_WIRE_65 | SYNTHESIZED_WIRE_66;


MPX2_16BIT	b2v_inst65(
	.S(s9),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_67),
	.I1(SYNTHESIZED_WIRE_103),
	.D(angle_p_ALTERA_SYNTHESIZED9));


CMP16	b2v_inst66(
	.A(SYNTHESIZED_WIRE_103),
	.B(SYNTHESIZED_WIRE_104),
	
	.E(SYNTHESIZED_WIRE_72),
	.L(SYNTHESIZED_WIRE_71));


ConstantX	b2v_inst67(
	.DATA_OUT(SYNTHESIZED_WIRE_104));
	defparam	b2v_inst67.const = 36000;
	defparam	b2v_inst67.size = 16;

assign	s9 = SYNTHESIZED_WIRE_71 | SYNTHESIZED_WIRE_72;


ADD16	b2v_inst69(
	.C_0(nula),
	.A(start_angle),
	.B(delta),
	
	.OUT(SYNTHESIZED_WIRE_111));



MPX2_16BIT	b2v_inst70(
	.S(s10),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_73),
	.I1(SYNTHESIZED_WIRE_101),
	.D(angle_p1_ALTERA_SYNTHESIZED0));


CMP16	b2v_inst71(
	.A(SYNTHESIZED_WIRE_101),
	.B(SYNTHESIZED_WIRE_102),
	
	.E(SYNTHESIZED_WIRE_78),
	.L(SYNTHESIZED_WIRE_77));


ConstantX	b2v_inst72(
	.DATA_OUT(SYNTHESIZED_WIRE_102));
	defparam	b2v_inst72.const = 36000;
	defparam	b2v_inst72.size = 16;

assign	s10 = SYNTHESIZED_WIRE_77 | SYNTHESIZED_WIRE_78;


MPX2_16BIT	b2v_inst75(
	.S(s11),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_79),
	.I1(SYNTHESIZED_WIRE_99),
	.D(angle_p1_1));


CMP16	b2v_inst76(
	.A(SYNTHESIZED_WIRE_99),
	.B(SYNTHESIZED_WIRE_100),
	
	.E(SYNTHESIZED_WIRE_84),
	.L(SYNTHESIZED_WIRE_83));


ConstantX	b2v_inst77(
	.DATA_OUT(SYNTHESIZED_WIRE_100));
	defparam	b2v_inst77.const = 36000;
	defparam	b2v_inst77.size = 16;

assign	s11 = SYNTHESIZED_WIRE_83 | SYNTHESIZED_WIRE_84;


CMP16	b2v_inst8(
	.A(end_angle),
	.B(start_angle),
	.G(s)
	
	);


ADD16	b2v_inst81(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED1),
	.B(delta),
	
	.OUT(SYNTHESIZED_WIRE_113));


ADD16	b2v_inst82(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED2),
	.B(delta),
	
	.OUT(SYNTHESIZED_WIRE_93));


ADD16	b2v_inst85(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED3),
	.B(delta),
	
	.OUT(SYNTHESIZED_WIRE_95));


ADD16	b2v_inst86(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED4),
	.B(delta),
	
	.OUT(SYNTHESIZED_WIRE_97));


ADD16	b2v_inst87(
	.C_0(nula),
	.A(angle_p1_ALTERA_SYNTHESIZED0),
	.B(delta),
	
	.OUT(SYNTHESIZED_WIRE_99));


ADD16	b2v_inst89(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED9),
	.B(delta),
	
	.OUT(SYNTHESIZED_WIRE_101));


MPX2_16BIT	b2v_inst9(
	.S(s),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_85),
	.I1(SYNTHESIZED_WIRE_115),
	.D(angle_range));


ADD16	b2v_inst90(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED8),
	.B(delta),
	
	.OUT(SYNTHESIZED_WIRE_103));


ADD16	b2v_inst94(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED7),
	.B(delta),
	
	.OUT(SYNTHESIZED_WIRE_105));


ADD16	b2v_inst95(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED6),
	.B(delta),
	
	.OUT(SYNTHESIZED_WIRE_107));


ADD16	b2v_inst96(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED5),
	.B(delta),
	
	.OUT(SYNTHESIZED_WIRE_109));


SUB16	b2v_inst97(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_111),
	.B(SYNTHESIZED_WIRE_112),
	
	.OUT(SYNTHESIZED_WIRE_18));


SUB16	b2v_inst98(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_113),
	.B(SYNTHESIZED_WIRE_114),
	
	.OUT(SYNTHESIZED_WIRE_25));


ADD16	b2v_inst99(
	.C_0(nula),
	.A(SYNTHESIZED_WIRE_91),
	.B(SYNTHESIZED_WIRE_115),
	
	.OUT(SYNTHESIZED_WIRE_85));

assign	angle_p1 = angle_p_ALTERA_SYNTHESIZED1;
assign	angle_p1_0 = angle_p1_ALTERA_SYNTHESIZED0;
assign	angle_p2 = angle_p_ALTERA_SYNTHESIZED2;
assign	angle_p3 = angle_p_ALTERA_SYNTHESIZED3;
assign	angle_p4 = angle_p_ALTERA_SYNTHESIZED4;
assign	angle_p5 = angle_p_ALTERA_SYNTHESIZED5;
assign	angle_p6 = angle_p_ALTERA_SYNTHESIZED6;
assign	angle_p7 = angle_p_ALTERA_SYNTHESIZED7;
assign	angle_p8 = angle_p_ALTERA_SYNTHESIZED8;
assign	angle_p9 = angle_p_ALTERA_SYNTHESIZED9;
assign	jedan = 1;
assign	nula = 0;

endmodule
