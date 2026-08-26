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
// CREATED		"Wed Aug 26 18:45:37 2026"

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
wire	[31:0] B;
wire	[31:0] C;
wire	[31:0] D;
wire	[31:0] delta;
wire	jedan;
wire	nula;
wire	[9:0] nule_10;
wire	[15:0] nule_16;
wire	[18:0] nule_19;
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
wire	[15:0] SYNTHESIZED_WIRE_111;
wire	[31:0] SYNTHESIZED_WIRE_18;
wire	[31:0] SYNTHESIZED_WIRE_19;
wire	[15:0] SYNTHESIZED_WIRE_20;
wire	[15:0] SYNTHESIZED_WIRE_112;
wire	[15:0] SYNTHESIZED_WIRE_113;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	[15:0] SYNTHESIZED_WIRE_26;
wire	[15:0] SYNTHESIZED_WIRE_114;
wire	[15:0] SYNTHESIZED_WIRE_115;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	[15:0] SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	[15:0] SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	[15:0] SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_49;
wire	[15:0] SYNTHESIZED_WIRE_50;
wire	SYNTHESIZED_WIRE_54;
wire	SYNTHESIZED_WIRE_55;
wire	[15:0] SYNTHESIZED_WIRE_56;
wire	SYNTHESIZED_WIRE_60;
wire	SYNTHESIZED_WIRE_61;
wire	[15:0] SYNTHESIZED_WIRE_62;
wire	SYNTHESIZED_WIRE_66;
wire	SYNTHESIZED_WIRE_67;
wire	[15:0] SYNTHESIZED_WIRE_68;
wire	SYNTHESIZED_WIRE_72;
wire	SYNTHESIZED_WIRE_73;
wire	[15:0] SYNTHESIZED_WIRE_74;
wire	SYNTHESIZED_WIRE_78;
wire	SYNTHESIZED_WIRE_79;
wire	[15:0] SYNTHESIZED_WIRE_80;
wire	SYNTHESIZED_WIRE_84;
wire	SYNTHESIZED_WIRE_85;
wire	[15:0] SYNTHESIZED_WIRE_86;
wire	[15:0] SYNTHESIZED_WIRE_116;
wire	[15:0] SYNTHESIZED_WIRE_92;

wire	[31:0] GDFX_TEMP_SIGNAL_6;
wire	[31:0] GDFX_TEMP_SIGNAL_5;
wire	[31:0] GDFX_TEMP_SIGNAL_0;
wire	[31:0] GDFX_TEMP_SIGNAL_1;
wire	[31:0] GDFX_TEMP_SIGNAL_7;
wire	[31:0] GDFX_TEMP_SIGNAL_4;
wire	[31:0] GDFX_TEMP_SIGNAL_2;
wire	[31:0] GDFX_TEMP_SIGNAL_3;


assign	GDFX_TEMP_SIGNAL_6 = {A[27:0],nula,nula,nula,nula};
assign	GDFX_TEMP_SIGNAL_5 = {B[27:0],nula,nula,nula,nula};
assign	GDFX_TEMP_SIGNAL_0 = {B[21:0],nule_10[9:0]};
assign	GDFX_TEMP_SIGNAL_1 = {A[24:0],nula,nula,nula,nula,nula,nula,nula};
assign	GDFX_TEMP_SIGNAL_7 = {nule_19[18:0],D[31:19]};
assign	GDFX_TEMP_SIGNAL_4 = {nule_16[15:0],angle_range[11:0],nula,nula,nula,nula};
assign	GDFX_TEMP_SIGNAL_2 = {nule_16[15:0],angle_range[13:0],nula,nula};
assign	GDFX_TEMP_SIGNAL_3 = {nule_16[15:0],angle_range[15:0]};


ADD32	b2v_inst(
	.C_0(nula),
	.A(GDFX_TEMP_SIGNAL_0),
	.B(GDFX_TEMP_SIGNAL_1),
	
	.OUT(C));




SUB16	b2v_inst100(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_94),
	.B(SYNTHESIZED_WIRE_95),
	
	.OUT(SYNTHESIZED_WIRE_32));


SUB16	b2v_inst101(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_96),
	.B(SYNTHESIZED_WIRE_97),
	
	.OUT(SYNTHESIZED_WIRE_38));


SUB16	b2v_inst102(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_98),
	.B(SYNTHESIZED_WIRE_99),
	
	.OUT(SYNTHESIZED_WIRE_44));


SUB16	b2v_inst103(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_100),
	.B(SYNTHESIZED_WIRE_101),
	
	.OUT(SYNTHESIZED_WIRE_80));


SUB16	b2v_inst104(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_102),
	.B(SYNTHESIZED_WIRE_103),
	
	.OUT(SYNTHESIZED_WIRE_74));


SUB16	b2v_inst105(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_104),
	.B(SYNTHESIZED_WIRE_105),
	
	.OUT(SYNTHESIZED_WIRE_68));


SUB16	b2v_inst106(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_106),
	.B(SYNTHESIZED_WIRE_107),
	
	.OUT(SYNTHESIZED_WIRE_62));


SUB16	b2v_inst107(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_108),
	.B(SYNTHESIZED_WIRE_109),
	
	.OUT(SYNTHESIZED_WIRE_56));


SUB16	b2v_inst108(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_110),
	.B(SYNTHESIZED_WIRE_111),
	
	.OUT(SYNTHESIZED_WIRE_50));


SUB16	b2v_inst11(
	.E_0(nula),
	.A(end_angle),
	.B(start_angle),
	
	.OUT(SYNTHESIZED_WIRE_116));

assign	angle_p0 = start_angle;



ADD32	b2v_inst12(
	.C_0(nula),
	.A(SYNTHESIZED_WIRE_18),
	.B(SYNTHESIZED_WIRE_19),
	
	.OUT(D));


ConstantX	b2v_inst13(
	.DATA_OUT(nule_10));
	defparam	b2v_inst13.const = 0;
	defparam	b2v_inst13.size = 10;


SUB32	b2v_inst2(
	.E_0(nula),
	.A(GDFX_TEMP_SIGNAL_2),
	.B(GDFX_TEMP_SIGNAL_3),
	
	.OUT(A));


ConstantX	b2v_inst23(
	.DATA_OUT(SYNTHESIZED_WIRE_92));
	defparam	b2v_inst23.const = 36000;
	defparam	b2v_inst23.size = 16;


MPX2_16BIT	b2v_inst24(
	.S(s1),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_20),
	.I1(SYNTHESIZED_WIRE_112),
	.D(angle_p_ALTERA_SYNTHESIZED1));


CMP16	b2v_inst25(
	.A(SYNTHESIZED_WIRE_112),
	.B(SYNTHESIZED_WIRE_113),
	
	.E(SYNTHESIZED_WIRE_25),
	.L(SYNTHESIZED_WIRE_24));


ConstantX	b2v_inst26(
	.DATA_OUT(SYNTHESIZED_WIRE_113));
	defparam	b2v_inst26.const = 36000;
	defparam	b2v_inst26.size = 16;

assign	s1 = SYNTHESIZED_WIRE_24 | SYNTHESIZED_WIRE_25;


MPX2_16BIT	b2v_inst29(
	.S(s2),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_26),
	.I1(SYNTHESIZED_WIRE_114),
	.D(angle_p_ALTERA_SYNTHESIZED2));


ConstantX	b2v_inst3(
	.DATA_OUT(nule_16));
	defparam	b2v_inst3.const = 0;
	defparam	b2v_inst3.size = 16;


CMP16	b2v_inst30(
	.A(SYNTHESIZED_WIRE_114),
	.B(SYNTHESIZED_WIRE_115),
	
	.E(SYNTHESIZED_WIRE_31),
	.L(SYNTHESIZED_WIRE_30));


ConstantX	b2v_inst31(
	.DATA_OUT(SYNTHESIZED_WIRE_115));
	defparam	b2v_inst31.const = 36000;
	defparam	b2v_inst31.size = 16;

assign	s2 = SYNTHESIZED_WIRE_30 | SYNTHESIZED_WIRE_31;


MPX2_16BIT	b2v_inst34(
	.S(s3),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_32),
	.I1(SYNTHESIZED_WIRE_94),
	.D(angle_p_ALTERA_SYNTHESIZED3));


CMP16	b2v_inst35(
	.A(SYNTHESIZED_WIRE_94),
	.B(SYNTHESIZED_WIRE_95),
	
	.E(SYNTHESIZED_WIRE_37),
	.L(SYNTHESIZED_WIRE_36));


ConstantX	b2v_inst36(
	.DATA_OUT(SYNTHESIZED_WIRE_95));
	defparam	b2v_inst36.const = 36000;
	defparam	b2v_inst36.size = 16;

assign	s3 = SYNTHESIZED_WIRE_36 | SYNTHESIZED_WIRE_37;


MPX2_16BIT	b2v_inst39(
	.S(s4),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_38),
	.I1(SYNTHESIZED_WIRE_96),
	.D(angle_p_ALTERA_SYNTHESIZED4));


SUB32	b2v_inst4(
	.E_0(nula),
	.A(GDFX_TEMP_SIGNAL_4),
	.B(A),
	
	.OUT(B));


CMP16	b2v_inst40(
	.A(SYNTHESIZED_WIRE_96),
	.B(SYNTHESIZED_WIRE_97),
	
	.E(SYNTHESIZED_WIRE_43),
	.L(SYNTHESIZED_WIRE_42));


ConstantX	b2v_inst41(
	.DATA_OUT(SYNTHESIZED_WIRE_97));
	defparam	b2v_inst41.const = 36000;
	defparam	b2v_inst41.size = 16;

assign	s4 = SYNTHESIZED_WIRE_42 | SYNTHESIZED_WIRE_43;


ADD32	b2v_inst44(
	.C_0(nula),
	.A(A),
	.B(C),
	
	.OUT(SYNTHESIZED_WIRE_18));


MPX2_16BIT	b2v_inst45(
	.S(s5),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_44),
	.I1(SYNTHESIZED_WIRE_98),
	.D(angle_p_ALTERA_SYNTHESIZED5));


CMP16	b2v_inst46(
	.A(SYNTHESIZED_WIRE_98),
	.B(SYNTHESIZED_WIRE_99),
	
	.E(SYNTHESIZED_WIRE_49),
	.L(SYNTHESIZED_WIRE_48));


ConstantX	b2v_inst47(
	.DATA_OUT(SYNTHESIZED_WIRE_99));
	defparam	b2v_inst47.const = 36000;
	defparam	b2v_inst47.size = 16;

assign	s5 = SYNTHESIZED_WIRE_48 | SYNTHESIZED_WIRE_49;


ADD32	b2v_inst49(
	.C_0(nula),
	.A(GDFX_TEMP_SIGNAL_5),
	.B(GDFX_TEMP_SIGNAL_6),
	
	.OUT(SYNTHESIZED_WIRE_19));


MPX2_16BIT	b2v_inst50(
	.S(s6),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_50),
	.I1(SYNTHESIZED_WIRE_110),
	.D(angle_p_ALTERA_SYNTHESIZED6));


CMP16	b2v_inst51(
	.A(SYNTHESIZED_WIRE_110),
	.B(SYNTHESIZED_WIRE_111),
	
	.E(SYNTHESIZED_WIRE_55),
	.L(SYNTHESIZED_WIRE_54));


ConstantX	b2v_inst52(
	.DATA_OUT(SYNTHESIZED_WIRE_111));
	defparam	b2v_inst52.const = 36000;
	defparam	b2v_inst52.size = 16;

assign	s6 = SYNTHESIZED_WIRE_54 | SYNTHESIZED_WIRE_55;


MPX2_16BIT	b2v_inst55(
	.S(s7),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_56),
	.I1(SYNTHESIZED_WIRE_108),
	.D(angle_p_ALTERA_SYNTHESIZED7));


CMP16	b2v_inst56(
	.A(SYNTHESIZED_WIRE_108),
	.B(SYNTHESIZED_WIRE_109),
	
	.E(SYNTHESIZED_WIRE_61),
	.L(SYNTHESIZED_WIRE_60));


ConstantX	b2v_inst57(
	.DATA_OUT(SYNTHESIZED_WIRE_109));
	defparam	b2v_inst57.const = 36000;
	defparam	b2v_inst57.size = 16;

assign	s7 = SYNTHESIZED_WIRE_60 | SYNTHESIZED_WIRE_61;

assign	delta = GDFX_TEMP_SIGNAL_7;



MPX2_16BIT	b2v_inst60(
	.S(s8),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_62),
	.I1(SYNTHESIZED_WIRE_106),
	.D(angle_p_ALTERA_SYNTHESIZED8));


CMP16	b2v_inst61(
	.A(SYNTHESIZED_WIRE_106),
	.B(SYNTHESIZED_WIRE_107),
	
	.E(SYNTHESIZED_WIRE_67),
	.L(SYNTHESIZED_WIRE_66));


ConstantX	b2v_inst62(
	.DATA_OUT(SYNTHESIZED_WIRE_107));
	defparam	b2v_inst62.const = 36000;
	defparam	b2v_inst62.size = 16;

assign	s8 = SYNTHESIZED_WIRE_66 | SYNTHESIZED_WIRE_67;


MPX2_16BIT	b2v_inst65(
	.S(s9),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_68),
	.I1(SYNTHESIZED_WIRE_104),
	.D(angle_p_ALTERA_SYNTHESIZED9));


CMP16	b2v_inst66(
	.A(SYNTHESIZED_WIRE_104),
	.B(SYNTHESIZED_WIRE_105),
	
	.E(SYNTHESIZED_WIRE_73),
	.L(SYNTHESIZED_WIRE_72));


ConstantX	b2v_inst67(
	.DATA_OUT(SYNTHESIZED_WIRE_105));
	defparam	b2v_inst67.const = 36000;
	defparam	b2v_inst67.size = 16;

assign	s9 = SYNTHESIZED_WIRE_72 | SYNTHESIZED_WIRE_73;


ADD16	b2v_inst69(
	.C_0(nula),
	.A(start_angle),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_112));


ConstantX	b2v_inst7(
	.DATA_OUT(nule_19));
	defparam	b2v_inst7.const = 0;
	defparam	b2v_inst7.size = 19;


MPX2_16BIT	b2v_inst70(
	.S(s10),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_74),
	.I1(SYNTHESIZED_WIRE_102),
	.D(angle_p1_ALTERA_SYNTHESIZED0));


CMP16	b2v_inst71(
	.A(SYNTHESIZED_WIRE_102),
	.B(SYNTHESIZED_WIRE_103),
	
	.E(SYNTHESIZED_WIRE_79),
	.L(SYNTHESIZED_WIRE_78));


ConstantX	b2v_inst72(
	.DATA_OUT(SYNTHESIZED_WIRE_103));
	defparam	b2v_inst72.const = 36000;
	defparam	b2v_inst72.size = 16;

assign	s10 = SYNTHESIZED_WIRE_78 | SYNTHESIZED_WIRE_79;


MPX2_16BIT	b2v_inst75(
	.S(s11),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_80),
	.I1(SYNTHESIZED_WIRE_100),
	.D(angle_p1_1));


CMP16	b2v_inst76(
	.A(SYNTHESIZED_WIRE_100),
	.B(SYNTHESIZED_WIRE_101),
	
	.E(SYNTHESIZED_WIRE_85),
	.L(SYNTHESIZED_WIRE_84));


ConstantX	b2v_inst77(
	.DATA_OUT(SYNTHESIZED_WIRE_101));
	defparam	b2v_inst77.const = 36000;
	defparam	b2v_inst77.size = 16;

assign	s11 = SYNTHESIZED_WIRE_84 | SYNTHESIZED_WIRE_85;


CMP16	b2v_inst8(
	.A(end_angle),
	.B(start_angle),
	.G(s)
	
	);


ADD16	b2v_inst81(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED1),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_114));


ADD16	b2v_inst82(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED2),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_94));


ADD16	b2v_inst85(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED3),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_96));


ADD16	b2v_inst86(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED4),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_98));


ADD16	b2v_inst87(
	.C_0(nula),
	.A(angle_p1_ALTERA_SYNTHESIZED0),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_100));


ADD16	b2v_inst89(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED9),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_102));


MPX2_16BIT	b2v_inst9(
	.S(s),
	.E(jedan),
	.I0(SYNTHESIZED_WIRE_86),
	.I1(SYNTHESIZED_WIRE_116),
	.D(angle_range));


ADD16	b2v_inst90(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED8),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_104));


ADD16	b2v_inst94(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED7),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_106));


ADD16	b2v_inst95(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED6),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_108));


ADD16	b2v_inst96(
	.C_0(nula),
	.A(angle_p_ALTERA_SYNTHESIZED5),
	.B(delta[15:0]),
	
	.OUT(SYNTHESIZED_WIRE_110));


SUB16	b2v_inst97(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_112),
	.B(SYNTHESIZED_WIRE_113),
	
	.OUT(SYNTHESIZED_WIRE_20));


SUB16	b2v_inst98(
	.E_0(nula),
	.A(SYNTHESIZED_WIRE_114),
	.B(SYNTHESIZED_WIRE_115),
	
	.OUT(SYNTHESIZED_WIRE_26));


ADD16	b2v_inst99(
	.C_0(nula),
	.A(SYNTHESIZED_WIRE_92),
	.B(SYNTHESIZED_WIRE_116),
	
	.OUT(SYNTHESIZED_WIRE_86));

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
