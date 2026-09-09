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
// CREATED		"Wed Sep 02 13:51:16 2026"

module REGFILE(
	CLK,
	RESET,
	REGWRITE,
	RD,
	RS1,
	RS2,
	WRITEDATA,
	RS1DATA,
	RS2DATA
);


input wire	CLK;
input wire	RESET;
input wire	REGWRITE;
input wire	[4:0] RD;
input wire	[4:0] RS1;
input wire	[4:0] RS2;
input wire	[31:0] WRITEDATA;
output wire	[31:0] RS1DATA;
output wire	[31:0] RS2DATA;

wire	[31:0] L;
wire	[31:0] OUT0_;
wire	[31:0] OUT10_;
wire	[31:0] OUT11_;
wire	[31:0] OUT12_;
wire	[31:0] OUT13_;
wire	[31:0] OUT14_;
wire	[31:0] OUT15_;
wire	[31:0] OUT16_;
wire	[31:0] OUT17_;
wire	[31:0] OUT18_;
wire	[31:0] OUT19_;
wire	[31:0] OUT1_;
wire	[31:0] OUT20_;
wire	[31:0] OUT21_;
wire	[31:0] OUT22_;
wire	[31:0] OUT23_;
wire	[31:0] OUT24_;
wire	[31:0] OUT25_;
wire	[31:0] OUT26_;
wire	[31:0] OUT27_;
wire	[31:0] OUT28_;
wire	[31:0] OUT29_;
wire	[31:0] OUT2_;
wire	[31:0] OUT30_;
wire	[31:0] OUT31_;
wire	[31:0] OUT3_;
wire	[31:0] OUT4_;
wire	[31:0] OUT5_;
wire	[31:0] OUT6_;
wire	[31:0] OUT7_;
wire	[31:0] OUT8_;
wire	[31:0] OUT9_;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;

assign	SYNTHESIZED_WIRE_1 = 1;
assign	SYNTHESIZED_WIRE_2 = 0;
assign	SYNTHESIZED_WIRE_33 = 1;




REG32_LD_CL	b2v_inst(
	.LD(SYNTHESIZED_WIRE_0),
	.CL(SYNTHESIZED_WIRE_1),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT0_));

assign	SYNTHESIZED_WIRE_0 = L[0] & SYNTHESIZED_WIRE_2;


REG32_LD_CL	b2v_inst10(
	.LD(SYNTHESIZED_WIRE_3),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT5_));

assign	SYNTHESIZED_WIRE_3 = L[5] & REGWRITE;


REG32_LD_CL	b2v_inst12(
	.LD(SYNTHESIZED_WIRE_4),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT6_));

assign	SYNTHESIZED_WIRE_4 = L[6] & REGWRITE;


REG32_LD_CL	b2v_inst14(
	.LD(SYNTHESIZED_WIRE_5),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT7_));

assign	SYNTHESIZED_WIRE_5 = L[7] & REGWRITE;


REG32_LD_CL	b2v_inst16(
	.LD(SYNTHESIZED_WIRE_6),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT8_));

assign	SYNTHESIZED_WIRE_6 = L[8] & REGWRITE;


REG32_LD_CL	b2v_inst18(
	.LD(SYNTHESIZED_WIRE_7),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT9_));

assign	SYNTHESIZED_WIRE_7 = L[9] & REGWRITE;


REG32_LD_CL	b2v_inst2(
	.LD(SYNTHESIZED_WIRE_8),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT1_));


REG32_LD_CL	b2v_inst20(
	.LD(SYNTHESIZED_WIRE_9),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT10_));

assign	SYNTHESIZED_WIRE_9 = L[10] & REGWRITE;


REG32_LD_CL	b2v_inst22(
	.LD(SYNTHESIZED_WIRE_10),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT11_));

assign	SYNTHESIZED_WIRE_10 = L[11] & REGWRITE;


REG32_LD_CL	b2v_inst24(
	.LD(SYNTHESIZED_WIRE_11),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT12_));

assign	SYNTHESIZED_WIRE_11 = L[12] & REGWRITE;


REG32_LD_CL	b2v_inst26(
	.LD(SYNTHESIZED_WIRE_12),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT13_));

assign	SYNTHESIZED_WIRE_12 = L[13] & REGWRITE;


REG32_LD_CL	b2v_inst28(
	.LD(SYNTHESIZED_WIRE_13),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT14_));

assign	SYNTHESIZED_WIRE_13 = L[14] & REGWRITE;

assign	SYNTHESIZED_WIRE_8 = L[1] & REGWRITE;


REG32_LD_CL	b2v_inst30(
	.LD(SYNTHESIZED_WIRE_14),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT15_));

assign	SYNTHESIZED_WIRE_14 = L[15] & REGWRITE;


REG32_LD_CL	b2v_inst32(
	.LD(SYNTHESIZED_WIRE_15),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT16_));

assign	SYNTHESIZED_WIRE_15 = L[16] & REGWRITE;


REG32_LD_CL	b2v_inst34(
	.LD(SYNTHESIZED_WIRE_16),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT17_));

assign	SYNTHESIZED_WIRE_16 = L[17] & REGWRITE;


REG32_LD_CL	b2v_inst36(
	.LD(SYNTHESIZED_WIRE_17),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT18_));

assign	SYNTHESIZED_WIRE_17 = L[18] & REGWRITE;


REG32_LD_CL	b2v_inst38(
	.LD(SYNTHESIZED_WIRE_18),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT19_));


MPX32_32bit	b2v_inst39(
	.data0x(OUT0_),
	.data10x(OUT10_),
	.data11x(OUT11_),
	.data12x(OUT12_),
	.data13x(OUT13_),
	.data14x(OUT14_),
	.data15x(OUT15_),
	.data16x(OUT16_),
	.data17x(OUT17_),
	.data18x(OUT18_),
	.data19x(OUT19_),
	.data1x(OUT1_),
	.data20x(OUT20_),
	.data21x(OUT21_),
	.data22x(OUT22_),
	.data23x(OUT23_),
	.data24x(OUT24_),
	.data25x(OUT25_),
	.data26x(OUT26_),
	.data27x(OUT27_),
	.data28x(OUT28_),
	.data29x(OUT29_),
	.data2x(OUT2_),
	.data30x(OUT30_),
	.data31x(OUT31_),
	.data3x(OUT3_),
	.data4x(OUT4_),
	.data5x(OUT5_),
	.data6x(OUT6_),
	.data7x(OUT7_),
	.data8x(OUT8_),
	.data9x(OUT9_),
	.sel(RS1),
	.result(RS1DATA));


REG32_LD_CL	b2v_inst4(
	.LD(SYNTHESIZED_WIRE_19),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT2_));


REG32_LD_CL	b2v_inst40(
	.LD(SYNTHESIZED_WIRE_20),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT20_));

assign	SYNTHESIZED_WIRE_20 = L[20] & REGWRITE;


REG32_LD_CL	b2v_inst42(
	.LD(SYNTHESIZED_WIRE_21),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT21_));

assign	SYNTHESIZED_WIRE_21 = L[21] & REGWRITE;


REG32_LD_CL	b2v_inst44(
	.LD(SYNTHESIZED_WIRE_22),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT22_));

assign	SYNTHESIZED_WIRE_22 = L[22] & REGWRITE;


REG32_LD_CL	b2v_inst46(
	.LD(SYNTHESIZED_WIRE_23),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT23_));

assign	SYNTHESIZED_WIRE_23 = L[23] & REGWRITE;


REG32_LD_CL	b2v_inst48(
	.LD(SYNTHESIZED_WIRE_24),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT24_));

assign	SYNTHESIZED_WIRE_24 = L[24] & REGWRITE;

assign	SYNTHESIZED_WIRE_19 = L[2] & REGWRITE;


REG32_LD_CL	b2v_inst50(
	.LD(SYNTHESIZED_WIRE_25),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT25_));

assign	SYNTHESIZED_WIRE_25 = L[25] & REGWRITE;


REG32_LD_CL	b2v_inst52(
	.LD(SYNTHESIZED_WIRE_26),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT26_));

assign	SYNTHESIZED_WIRE_26 = L[26] & REGWRITE;


REG32_LD_CL	b2v_inst54(
	.LD(SYNTHESIZED_WIRE_27),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT27_));

assign	SYNTHESIZED_WIRE_27 = L[27] & REGWRITE;


REG32_LD_CL	b2v_inst56(
	.LD(SYNTHESIZED_WIRE_28),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT28_));

assign	SYNTHESIZED_WIRE_28 = L[28] & REGWRITE;


REG32_LD_CL	b2v_inst58(
	.LD(SYNTHESIZED_WIRE_29),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT29_));

assign	SYNTHESIZED_WIRE_29 = L[29] & REGWRITE;


REG32_LD_CL	b2v_inst6(
	.LD(SYNTHESIZED_WIRE_30),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT3_));


REG32_LD_CL	b2v_inst60(
	.LD(SYNTHESIZED_WIRE_31),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT30_));

assign	SYNTHESIZED_WIRE_31 = L[30] & REGWRITE;


REG32_LD_CL	b2v_inst62(
	.LD(SYNTHESIZED_WIRE_32),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT31_));

assign	SYNTHESIZED_WIRE_32 = L[31] & REGWRITE;


DEC5	b2v_inst64(
	.E(SYNTHESIZED_WIRE_33),
	.IN(RD),
	.OUT(L));



MPX32_32bit_2	b2v_inst66(
	.data0x(OUT0_),
	.data10x(OUT10_),
	.data11x(OUT11_),
	.data12x(OUT12_),
	.data13x(OUT13_),
	.data14x(OUT14_),
	.data15x(OUT15_),
	.data16x(OUT16_),
	.data17x(OUT17_),
	.data18x(OUT18_),
	.data19x(OUT19_),
	.data1x(OUT1_),
	.data20x(OUT20_),
	.data21x(OUT21_),
	.data22x(OUT22_),
	.data23x(OUT23_),
	.data24x(OUT24_),
	.data25x(OUT25_),
	.data26x(OUT26_),
	.data27x(OUT27_),
	.data28x(OUT28_),
	.data29x(OUT29_),
	.data2x(OUT2_),
	.data30x(OUT30_),
	.data31x(OUT31_),
	.data3x(OUT3_),
	.data4x(OUT4_),
	.data5x(OUT5_),
	.data6x(OUT6_),
	.data7x(OUT7_),
	.data8x(OUT8_),
	.data9x(OUT9_),
	.sel(RS2),
	.result(RS2DATA));



assign	SYNTHESIZED_WIRE_30 = L[3] & REGWRITE;


REG32_LD_CL	b2v_inst8(
	.LD(SYNTHESIZED_WIRE_34),
	.CL(RESET),
	.clk(CLK),
	.I(WRITEDATA),
	.A(OUT4_));

assign	SYNTHESIZED_WIRE_18 = L[19] & REGWRITE;

assign	SYNTHESIZED_WIRE_34 = L[4] & REGWRITE;


endmodule
