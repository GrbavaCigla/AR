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
// CREATED		"Mon Aug 24 22:59:49 2026"

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

wire	[31:0] A;
wire	[15:0] angle1_p;
wire	[15:0] angle_p1_ALTERA_SYNTHESIZED0;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED2;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED3;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED4;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED5;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED6;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED7;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED8;
wire	[15:0] angle_p_ALTERA_SYNTHESIZED9;
wire	[15:0] angle_range;
wire	[31:0] B;
wire	[31:0] C;
wire	[31:0] D;
wire	[31:0] delta;
wire	jedan;
wire	nula;
wire	[15:0] nule_16;
wire	[18:0] nule_19;
wire	[31:0] P;
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
wire	[15:0] SYNTHESIZED_WIRE_92;
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
wire	[15:0] SYNTHESIZED_WIRE_18;
wire	[15:0] SYNTHESIZED_WIRE_110;
wire	[15:0] SYNTHESIZED_WIRE_111;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	[15:0] SYNTHESIZED_WIRE_24;
wire	[15:0] SYNTHESIZED_WIRE_112;
wire	[15:0] SYNTHESIZED_WIRE_113;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	[15:0] SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	[15:0] SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	[15:0] SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	[15:0] SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_53;
wire	[15:0] SYNTHESIZED_WIRE_54;
wire	SYNTHESIZED_WIRE_58;
wire	SYNTHESIZED_WIRE_59;
wire	[15:0] SYNTHESIZED_WIRE_60;
wire	SYNTHESIZED_WIRE_64;
wire	SYNTHESIZED_WIRE_65;
wire	[15:0] SYNTHESIZED_WIRE_66;
wire	SYNTHESIZED_WIRE_70;
wire	SYNTHESIZED_WIRE_71;
wire	[15:0] SYNTHESIZED_WIRE_72;
wire	SYNTHESIZED_WIRE_76;
wire	SYNTHESIZED_WIRE_77;
wire	[15:0] SYNTHESIZED_WIRE_78;
wire	SYNTHESIZED_WIRE_82;
wire	SYNTHESIZED_WIRE_83;
wire	[15:0] SYNTHESIZED_WIRE_84;
wire	[15:0] SYNTHESIZED_WIRE_114;
wire	[15:0] SYNTHESIZED_WIRE_90;

wire	[31:0] GDFX_TEMP_SIGNAL_5;
wire	[31:0] GDFX_TEMP_SIGNAL_4;
wire	[31:0] GDFX_TEMP_SIGNAL_0;
wire	[31:0] GDFX_TEMP_SIGNAL_3;
wire	[31:0] GDFX_TEMP_SIGNAL_1;
wire	[31:0] GDFX_TEMP_SIGNAL_2;


assign	GDFX_TEMP_SIGNAL_5 = {nule_19[18:0],D[31:19]};
assign	GDFX_TEMP_SIGNAL_4 = {B[23:0],nula,nula,nula,nula,nula,nula,nula,nula};
assign	GDFX_TEMP_SIGNAL_0 = {B[27:0],nula,nula,nula,nula};
assign	GDFX_TEMP_SIGNAL_3 = {nule_16[15:0],angle_range[11:0],nula,nula,nula,nula};
assign	GDFX_TEMP_SIGNAL_1 = {nule_16[15:0],angle_range[13:0],nula,nula};
assign	GDFX_TEMP_SIGNAL_2 = {nule_16[15:0],angle_range[15:0]};


ADD32	b2v_inst(
	.C_0(nula),
	.A(GDFX_TEMP_SIGNAL_0),
	.B(A),
	
	.OUT(C));




SUB16	b2v_inst100(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_92),
	.B(SYNTHESIZED_WIRE_93),
	
	.OUT(SYNTHESIZED_WIRE_30));


SUB16	b2v_inst101(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_94),
	.B(SYNTHESIZED_WIRE_95),
	
	.OUT(SYNTHESIZED_WIRE_36));


SUB16	b2v_inst102(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_96),
	.B(SYNTHESIZED_WIRE_97),
	
	.OUT(SYNTHESIZED_WIRE_42));


SUB16	b2v_inst103(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_98),
	.B(SYNTHESIZED_WIRE_99),
	
	.OUT(SYNTHESIZED_WIRE_78));


SUB16	b2v_inst104(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_100),
	.B(SYNTHESIZED_WIRE_101),
	
	.OUT(SYNTHESIZED_WIRE_72));


SUB16	b2v_inst105(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_102),
	.B(SYNTHESIZED_WIRE_103),
	
	.OUT(SYNTHESIZED_WIRE_66));


SUB16	b2v_inst106(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_104),
	.B(SYNTHESIZED_WIRE_105),
	
	.OUT(SYNTHESIZED_WIRE_60));


SUB16	b2v_inst107(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_106),
	.B(SYNTHESIZED_WIRE_107),
	
	.OUT(SYNTHESIZED_WIRE_54));


SUB16	b2v_inst108(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_108),
	.B(SYNTHESIZED_WIRE_109),
	
	.OUT(SYNTHESIZED_WIRE_48));


SUB16	b2v_inst11(
	.E_0(nula),
	.A(end_angle),
	.B(start_angle),
	
	.OUT(SYNTHESIZED_WIRE_114));

assign	angle_p0 = start_angle;



SUB32	b2v_inst2(
	.E_0(nula),
	.A(GDFX_TEMP_SIGNAL_1),
	.B(GDFX_TEMP_SIGNAL_2),
	
	.OUT(A));


ConstantX	b2v_inst23(
	.DATA_OUT(SYNTHESIZED_WIRE_90));
	defparam	b2v_inst23.const = 36000;
	defparam	b2v_inst23.size = 16;


MPX2_16BIT	b2v_inst24(
	.S(s1),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_18),
	.I1(SYNTHESIZED_WIRE_110),
	.D(angle_p1));


CMP16	b2v_inst25(
	.A(SYNTHESIZED_WIRE_110),
	.B(SYNTHESIZED_WIRE_111),
	
	.E(SYNTHESIZED_WIRE_23),
	.L(SYNTHESIZED_WIRE_22));


ConstantX	b2v_inst26(
	.DATA_OUT(SYNTHESIZED_WIRE_111));
	defparam	b2v_inst26.const = 36000;
	defparam	b2v_inst26.size = 16;

assign	s1 = SYNTHESIZED_WIRE_22 | SYNTHESIZED_WIRE_23;


MPX2_16BIT	b2v_inst29(
	.S(s2),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_24),
	.I1(SYNTHESIZED_WIRE_112),
	.D(angle_p_ALTERA_SYNTHESIZED2));


ConstantX	b2v_inst3(
	.DATA_OUT(nule_16));
	defparam	b2v_inst3.const = 0;
	defparam	b2v_inst3.size = 16;


CMP16	b2v_inst30(
	.A(SYNTHESIZED_WIRE_112),
	.B(SYNTHESIZED_WIRE_113),
	
	.E(SYNTHESIZED_WIRE_29),
	.L(SYNTHESIZED_WIRE_28));


ConstantX	b2v_inst31(
	.DATA_OUT(SYNTHESIZED_WIRE_113));
	defparam	b2v_inst31.const = 36000;
	defparam	b2v_inst31.size = 16;

assign	s2 = SYNTHESIZED_WIRE_28 | SYNTHESIZED_WIRE_29;


MPX2_16BIT	b2v_inst34(
	.S(s3),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_30),
	.I1(SYNTHESIZED_WIRE_92),
	.D(angle_p_ALTERA_SYNTHESIZED3));


CMP16	b2v_inst35(
	.A(SYNTHESIZED_WIRE_92),
	.B(SYNTHESIZED_WIRE_93),
	
	.E(SYNTHESIZED_WIRE_35),
	.L(SYNTHESIZED_WIRE_34));


ConstantX	b2v_inst36(
	.DATA_OUT(SYNTHESIZED_WIRE_93));
	defparam	b2v_inst36.const = 36000;
	defparam	b2v_inst36.size = 16;

assign	s3 = SYNTHESIZED_WIRE_34 | SYNTHESIZED_WIRE_35;


MPX2_16BIT	b2v_inst39(
	.S(s4),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_36),
	.I1(SYNTHESIZED_WIRE_94),
	.D(angle_p_ALTERA_SYNTHESIZED4));


SUB32	b2v_inst4(
	.E_0(nula),
	.A(GDFX_TEMP_SIGNAL_3),
	.B(A),
	
	.OUT(B));


CMP16	b2v_inst40(
	.A(SYNTHESIZED_WIRE_94),
	.B(SYNTHESIZED_WIRE_95),
	
	.E(SYNTHESIZED_WIRE_41),
	.L(SYNTHESIZED_WIRE_40));


ConstantX	b2v_inst41(
	.DATA_OUT(SYNTHESIZED_WIRE_95));
	defparam	b2v_inst41.const = 36000;
	defparam	b2v_inst41.size = 16;

assign	s4 = SYNTHESIZED_WIRE_40 | SYNTHESIZED_WIRE_41;


ADD32	b2v_inst44(
	.C_0(nula),
	.A(GDFX_TEMP_SIGNAL_4),
	.B(C),
	
	.OUT(D));


MPX2_16BIT	b2v_inst45(
	.S(s5),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_42),
	.I1(SYNTHESIZED_WIRE_96),
	.D(angle_p_ALTERA_SYNTHESIZED5));


CMP16	b2v_inst46(
	.A(SYNTHESIZED_WIRE_96),
	.B(SYNTHESIZED_WIRE_97),
	
	.E(SYNTHESIZED_WIRE_47),
	.L(SYNTHESIZED_WIRE_46));


ConstantX	b2v_inst47(
	.DATA_OUT(SYNTHESIZED_WIRE_97));
	defparam	b2v_inst47.const = 36000;
	defparam	b2v_inst47.size = 16;

assign	s5 = SYNTHESIZED_WIRE_46 | SYNTHESIZED_WIRE_47;


SUB32	b2v_inst5(
	.E_0(nula),
	.A(D),
	.B(B)
	
	);


MPX2_16BIT	b2v_inst50(
	.S(s6),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_48),
	.I1(SYNTHESIZED_WIRE_108),
	.D(angle_p_ALTERA_SYNTHESIZED6));


CMP16	b2v_inst51(
	.A(SYNTHESIZED_WIRE_108),
	.B(SYNTHESIZED_WIRE_109),
	
	.E(SYNTHESIZED_WIRE_53),
	.L(SYNTHESIZED_WIRE_52));


ConstantX	b2v_inst52(
	.DATA_OUT(SYNTHESIZED_WIRE_109));
	defparam	b2v_inst52.const = 36000;
	defparam	b2v_inst52.size = 16;

assign	s6 = SYNTHESIZED_WIRE_52 | SYNTHESIZED_WIRE_53;


MPX2_16BIT	b2v_inst55(
	.S(s7),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_54),
	.I1(SYNTHESIZED_WIRE_106),
	.D(angle_p_ALTERA_SYNTHESIZED7));


CMP16	b2v_inst56(
	.A(SYNTHESIZED_WIRE_106),
	.B(SYNTHESIZED_WIRE_107),
	
	.E(SYNTHESIZED_WIRE_59),
	.L(SYNTHESIZED_WIRE_58));


ConstantX	b2v_inst57(
	.DATA_OUT(SYNTHESIZED_WIRE_107));
	defparam	b2v_inst57.const = 36000;
	defparam	b2v_inst57.size = 16;

assign	s7 = SYNTHESIZED_WIRE_58 | SYNTHESIZED_WIRE_59;

assign	delta = GDFX_TEMP_SIGNAL_5;



MPX2_16BIT	b2v_inst60(
	.S(s8),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_60),
	.I1(SYNTHESIZED_WIRE_104),
	.D(angle_p_ALTERA_SYNTHESIZED8));


CMP16	b2v_inst61(
	.A(SYNTHESIZED_WIRE_104),
	.B(SYNTHESIZED_WIRE_105),
	
	.E(SYNTHESIZED_WIRE_65),
	.L(SYNTHESIZED_WIRE_64));


ConstantX	b2v_inst62(
	.DATA_OUT(SYNTHESIZED_WIRE_105));
	defparam	b2v_inst62.const = 36000;
	defparam	b2v_inst62.size = 16;

assign	s8 = SYNTHESIZED_WIRE_64 | SYNTHESIZED_WIRE_65;


MPX2_16BIT	b2v_inst65(
	.S(s9),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_66),
	.I1(SYNTHESIZED_WIRE_102),
	.D(angle_p_ALTERA_SYNTHESIZED9));


CMP16	b2v_inst66(
	.A(SYNTHESIZED_WIRE_102),
	.B(SYNTHESIZED_WIRE_103),
	
	.E(SYNTHESIZED_WIRE_71),
	.L(SYNTHESIZED_WIRE_70));


ConstantX	b2v_inst67(
	.DATA_OUT(SYNTHESIZED_WIRE_103));
	defparam	b2v_inst67.const = 36000;
	defparam	b2v_inst67.size = 16;

assign	s9 = SYNTHESIZED_WIRE_70 | SYNTHESIZED_WIRE_71;


ADD16	b2v_inst69(
	.C_0(nula),
	.A(start_angle),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_110));


ConstantX	b2v_inst7(
	.DATA_OUT(nule_19));
	defparam	b2v_inst7.const = 0;
	defparam	b2v_inst7.size = 19;


MPX2_16BIT	b2v_inst70(
	.S(s10),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_72),
	.I1(SYNTHESIZED_WIRE_100),
	.D(angle_p1_ALTERA_SYNTHESIZED0));


CMP16	b2v_inst71(
	.A(SYNTHESIZED_WIRE_100),
	.B(SYNTHESIZED_WIRE_101),
	
	.E(SYNTHESIZED_WIRE_77),
	.L(SYNTHESIZED_WIRE_76));


ConstantX	b2v_inst72(
	.DATA_OUT(SYNTHESIZED_WIRE_101));
	defparam	b2v_inst72.const = 36000;
	defparam	b2v_inst72.size = 16;

assign	s10 = SYNTHESIZED_WIRE_76 | SYNTHESIZED_WIRE_77;


MPX2_16BIT	b2v_inst75(
	.S(s11),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_78),
	.I1(SYNTHESIZED_WIRE_98),
	.D(angle_p1_1));


CMP16	b2v_inst76(
	.A(SYNTHESIZED_WIRE_98),
	.B(SYNTHESIZED_WIRE_99),
	
	.E(SYNTHESIZED_WIRE_83),
	.L(SYNTHESIZED_WIRE_82));


ConstantX	b2v_inst77(
	.DATA_OUT(SYNTHESIZED_WIRE_99));
	defparam	b2v_inst77.const = 36000;
	defparam	b2v_inst77.size = 16;

assign	s11 = SYNTHESIZED_WIRE_82 | SYNTHESIZED_WIRE_83;


CMP16	b2v_inst8(
	.A(end_angle),
	.B(start_angle),
	.G(s)
	
	);


ADD16	b2v_inst81(
	.C_0(nula),
	.A(angle1_p),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_112));


ADD16	b2v_inst82(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED2),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_92));


ADD16	b2v_inst85(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED3),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_94));


ADD16	b2v_inst86(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED4),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_96));


ADD16	b2v_inst87(
	.C_0(nula),
	.A(angle_p1_ALTERA_SYNTHESIZED0),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_98));


ADD16	b2v_inst89(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED9),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_100));


MPX2_16BIT	b2v_inst9(
	.S(s),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_84),
	.I1(SYNTHESIZED_WIRE_114),
	.D(angle_range));


ADD16	b2v_inst90(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED8),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_102));


ADD16	b2v_inst94(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED7),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_104));


ADD16	b2v_inst95(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED6),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_106));


ADD16	b2v_inst96(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED5),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_108));


SUB16	b2v_inst97(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_110),
	.B(SYNTHESIZED_WIRE_111),
	
	.OUT(SYNTHESIZED_WIRE_18));


SUB16	b2v_inst98(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_112),
	.B(SYNTHESIZED_WIRE_113),
	
	.OUT(SYNTHESIZED_WIRE_24));


ADD16	b2v_inst99(
	.C_0(nula),
	.A(SYNTHESIZED_WIRE_90),
	.B(SYNTHESIZED_WIRE_114),
	
	.OUT(SYNTHESIZED_WIRE_84));

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
