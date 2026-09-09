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
// CREATED		"Wed Sep 02 19:26:57 2026"

module SDRAM_TEST(
	clk,
	reset,
	KEY_READ,
	KEY_WRITE,
	SW,
	HEX00,
	HEX01,
	HEX02,
	HEX03,
	HEX04,
	HEX05,
	HEX06,
	HEX10,
	HEX11,
	HEX12,
	HEX13,
	HEX14,
	HEX15,
	HEX16,
	HEX20,
	HEX21,
	HEX22,
	HEX23,
	HEX24,
	HEX25,
	HEX26,
	sdram_cke,
	sdram_cs_n,
	sdram_ras_n,
	sdram_cas_n,
	sdram_we_n,
	sdram_dqml,
	sdram_dqmh,
	sdram_clk,
	sdram_addr,
	sdram_ba,
	sdram_dq
);


input wire	clk;
input wire	reset;
input wire	KEY_READ;
input wire	KEY_WRITE;
input wire	[1:0] SW;
output wire	HEX00;
output wire	HEX01;
output wire	HEX02;
output wire	HEX03;
output wire	HEX04;
output wire	HEX05;
output wire	HEX06;
output wire	HEX10;
output wire	HEX11;
output wire	HEX12;
output wire	HEX13;
output wire	HEX14;
output wire	HEX15;
output wire	HEX16;
output wire	HEX20;
output wire	HEX21;
output wire	HEX22;
output wire	HEX23;
output wire	HEX24;
output wire	HEX25;
output wire	HEX26;
output wire	sdram_cke;
output wire	sdram_cs_n;
output wire	sdram_ras_n;
output wire	sdram_cas_n;
output wire	sdram_we_n;
output wire	sdram_dqml;
output wire	sdram_dqmh;
output wire	sdram_clk;
output wire	[12:0] sdram_addr;
output wire	[1:0] sdram_ba;
inout wire	[15:0] sdram_dq;

wire	[31:0] dbus_sdram_rd;
wire	j;
wire	n;
wire	READ_ACTIVE;
wire	READ_DONE;
wire	READ_PULSE;
wire	RESET_PULSE;
wire	[31:0] SAVED_READ;
wire	[25:0] SELECTED_ADDR;
wire	[31:0] SELECTED_DATA;
wire	WRITE_PULSE;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[3:0] SYNTHESIZED_WIRE_4;
wire	[3:0] SYNTHESIZED_WIRE_5;
wire	[3:0] SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	[25:0] SYNTHESIZED_WIRE_9;
wire	[25:0] SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;

assign	sdram_clk = clk;
wire	[31:0] GDFX_TEMP_SIGNAL_1;
wire	[31:0] GDFX_TEMP_SIGNAL_2;
wire	[31:0] GDFX_TEMP_SIGNAL_3;
wire	[31:0] GDFX_TEMP_SIGNAL_4;
wire	[3:0] GDFX_TEMP_SIGNAL_0;
wire	[25:0] GDFX_TEMP_SIGNAL_7;
wire	[25:0] GDFX_TEMP_SIGNAL_8;
wire	[25:0] GDFX_TEMP_SIGNAL_5;
wire	[25:0] GDFX_TEMP_SIGNAL_6;


assign	GDFX_TEMP_SIGNAL_1 = {n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,j,n,n,n,j,n,n};
assign	GDFX_TEMP_SIGNAL_2 = {n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,j,j,n,n,j,j};
assign	GDFX_TEMP_SIGNAL_3 = {n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,j,n,n,n,j,n};
assign	GDFX_TEMP_SIGNAL_4 = {n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,j,n,n,n,j};
assign	GDFX_TEMP_SIGNAL_0 = {j,j,j,j};
assign	GDFX_TEMP_SIGNAL_7 = {n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,j,j,n,n};
assign	GDFX_TEMP_SIGNAL_8 = {n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,j,n,n,n};
assign	GDFX_TEMP_SIGNAL_5 = {n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,j,n,n};
assign	GDFX_TEMP_SIGNAL_6 = {n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n};


sdram_wrapper	b2v_inst(
	.clk(clk),
	.rst_n(SYNTHESIZED_WIRE_0),
	.wr(WRITE_PULSE),
	.rd(READ_PULSE),
	.cs_sdram(SYNTHESIZED_WIRE_1),
	.abus(SELECTED_ADDR),
	.ben(GDFX_TEMP_SIGNAL_0),
	.dbus_wr(SELECTED_DATA),
	.sdram_dq(sdram_dq),
	.sdram_cke(sdram_cke),
	.sdram_cs_n(sdram_cs_n),
	.sdram_ras_n(sdram_ras_n),
	.sdram_cas_n(sdram_cas_n),
	.sdram_we_n(sdram_we_n),
	.sdram_dqml(sdram_dqml),
	.sdram_dqmh(sdram_dqmh),
	.ready_sdram(SYNTHESIZED_WIRE_8),
	.dbus_sdram_rd(dbus_sdram_rd),
	.sdram_addr(sdram_addr),
	.sdram_ba(sdram_ba)
	);

assign	SYNTHESIZED_WIRE_11 =  ~reset;


RisingEdgeDetector	b2v_inst10(
	.IN(SYNTHESIZED_WIRE_2),
	.CLK(clk),
	.OUT(WRITE_PULSE));


RisingEdgeDetector	b2v_inst11(
	.IN(SYNTHESIZED_WIRE_3),
	.CLK(clk),
	.OUT(READ_PULSE));

assign	SYNTHESIZED_WIRE_2 =  ~KEY_WRITE;

assign	SYNTHESIZED_WIRE_3 =  ~KEY_READ;

assign	SYNTHESIZED_WIRE_1 = READ_PULSE | WRITE_PULSE;


Binary2BCD	b2v_inst191(
	.input(SAVED_READ[7:0]),
	.bcd_hundreds(SYNTHESIZED_WIRE_6),
	.bcd_tens(SYNTHESIZED_WIRE_5),
	.bcd_units(SYNTHESIZED_WIRE_4));


MPX4_32BIT	b2v_inst2(
	.data0x(GDFX_TEMP_SIGNAL_1),
	.data1x(GDFX_TEMP_SIGNAL_2),
	.data2x(GDFX_TEMP_SIGNAL_3),
	.data3x(GDFX_TEMP_SIGNAL_4),
	.sel(SW),
	.result(SELECTED_DATA));


SevenSegmentInterfaceDEC	b2v_inst20(
	
	.en(j),
	.x(SYNTHESIZED_WIRE_4),
	.a(HEX00),
	.b(HEX01),
	.c(HEX02),
	.d(HEX03),
	.e(HEX04),
	.f(HEX05),
	.g(HEX06)
	);


SevenSegmentInterfaceDEC	b2v_inst21(
	
	.en(j),
	.x(SYNTHESIZED_WIRE_5),
	.a(HEX10),
	.b(HEX11),
	.c(HEX12),
	.d(HEX13),
	.e(HEX14),
	.f(HEX15),
	.g(HEX16)
	);


SevenSegmentInterfaceDEC	b2v_inst22(
	
	.en(j),
	.x(SYNTHESIZED_WIRE_6),
	.a(HEX20),
	.b(HEX21),
	.c(HEX22),
	.d(HEX23),
	.e(HEX24),
	.f(HEX25),
	.g(HEX26)
	);


REG1_LD_CL	b2v_inst23(
	.LD(READ_PULSE),
	.I(j),
	.CL(SYNTHESIZED_WIRE_7),
	.clk(clk),
	.A(READ_ACTIVE));

assign	SYNTHESIZED_WIRE_7 = READ_DONE | RESET_PULSE;

assign	READ_DONE = READ_ACTIVE & SYNTHESIZED_WIRE_8;


REG32_LD_CL	b2v_inst26(
	.LD(READ_DONE),
	.CL(RESET_PULSE),
	.clk(clk),
	.I(dbus_sdram_rd),
	.A(SAVED_READ));

assign	SYNTHESIZED_WIRE_0 =  ~RESET_PULSE;


MPX2_26BIT	b2v_inst4(
	.sel(SW[0]),
	.data0x(GDFX_TEMP_SIGNAL_5),
	.data1x(GDFX_TEMP_SIGNAL_6),
	.result(SYNTHESIZED_WIRE_10));


MPX2_26BIT	b2v_inst5(
	.sel(SW[1]),
	.data0x(SYNTHESIZED_WIRE_9),
	.data1x(SYNTHESIZED_WIRE_10),
	.result(SELECTED_ADDR));


MPX2_26BIT	b2v_inst6(
	.sel(SW[0]),
	.data0x(GDFX_TEMP_SIGNAL_7),
	.data1x(GDFX_TEMP_SIGNAL_8),
	.result(SYNTHESIZED_WIRE_9));




RisingEdgeDetector	b2v_inst9(
	.IN(SYNTHESIZED_WIRE_11),
	.CLK(clk),
	.OUT(RESET_PULSE));

assign	j = 1;
assign	n = 0;

endmodule
