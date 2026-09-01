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
// CREATED		"Tue Sep 01 18:40:23 2026"

module CPU_KVADRAT_TEST(
	clk,
	reset,
	rx,
	sdram_cke,
	sdram_cs_n,
	sdram_ras_n,
	sdram_cas_n,
	sdram_we_n,
	sdram_dqml,
	sdram_dqmh,
	hs,
	vs,
	sdram_clk,
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
	B,
	G,
	R,
	sdram_addr,
	sdram_ba,
	sdram_dq
);


input wire	clk;
input wire	reset;
input wire	rx;
output wire	sdram_cke;
output wire	sdram_cs_n;
output wire	sdram_ras_n;
output wire	sdram_cas_n;
output wire	sdram_we_n;
output wire	sdram_dqml;
output wire	sdram_dqmh;
output wire	hs;
output wire	vs;
output wire	sdram_clk;
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
output wire	[3:0] B;
output wire	[3:0] G;
output wire	[3:0] R;
output wire	[12:0] sdram_addr;
output wire	[1:0] sdram_ba;
output wire	[15:0] sdram_dq;

wire	[31:0] bus_addr;
wire	bus_rd;
wire	[31:0] bus_rdata;
wire	bus_ready;
wire	[31:0] bus_wdata;
wire	bus_wr;
wire	cs_lidar;
wire	cs_sdram;
wire	cs_vga;
wire	FB_SEL;
wire	jedan;
wire	[31:0] pc;
wire	PIXEL_CHANGED;
wire	[31:0] sdram_rdata;
wire	sdram_ready;
wire	SET_BIT;
wire	SET_PIXEL;
wire	[31:0] vga_rdata;
wire	vga_ready;
wire	[9:0] XIN;
wire	[9:0] YIN;
wire	[3:0] SYNTHESIZED_WIRE_0;
wire	[3:0] SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_2;

assign	sdram_clk = clk;
wire	[3:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_0 = {jedan,jedan,jedan,jedan};


riscv32iTest	b2v_inst(
	.CLK(clk),
	.RESET(reset),
	.bus_ready(bus_ready),
	.bus_rdata(bus_rdata),
	.bus_wr(bus_wr),
	.bus_rd(bus_rd),
	.bus_addr(bus_addr),
	.bus_wdata(bus_wdata),
	.PC(pc));


Monitor	b2v_inst1(
	.clk(clk),
	.SET_PIXEL(SET_PIXEL),
	.SET_BIT(SET_BIT),
	.FB_SEL(FB_SEL),
	.XIN(XIN),
	.YIN(YIN),
	
	.hs(hs),
	.vs(vs),
	
	.B(B),
	.G(G),
	
	.R(R));


Binary2BCD	b2v_inst191(
	.input(pc[7:0]),
	.bcd_hundreds(SYNTHESIZED_WIRE_2),
	.bcd_tens(SYNTHESIZED_WIRE_1),
	.bcd_units(SYNTHESIZED_WIRE_0));


VgaBusInterface	b2v_inst2(
	.cs_vga(cs_vga),
	.bus_wr(bus_wr),
	.bus_wdata(bus_wdata),
	.SET_PIXEL(SET_PIXEL),
	.SET_BIT(SET_BIT),
	.SEL(FB_SEL),
	.vga_ready(vga_ready),
	.vga_rdata(vga_rdata),
	.XIN(XIN),
	.YIN(YIN));


SevenSegmentInterfaceDEC	b2v_inst20(
	
	.en(jedan),
	.x(SYNTHESIZED_WIRE_0),
	.a(HEX00),
	.b(HEX01),
	.c(HEX02),
	.d(HEX03),
	.e(HEX04),
	.f(HEX05),
	.g(HEX06)
	);


SevenSegmentInterfaceDEC	b2v_inst21(
	
	.en(jedan),
	.x(SYNTHESIZED_WIRE_1),
	.a(HEX10),
	.b(HEX11),
	.c(HEX12),
	.d(HEX13),
	.e(HEX14),
	.f(HEX15),
	.g(HEX16)
	);


SevenSegmentInterfaceDEC	b2v_inst22(
	
	.en(jedan),
	.x(SYNTHESIZED_WIRE_2),
	.a(HEX20),
	.b(HEX21),
	.c(HEX22),
	.d(HEX23),
	.e(HEX24),
	.f(HEX25),
	.g(HEX26)
	);


sdram_wrapper	b2v_inst4(
	.clk(clk),
	.rst_n(reset),
	.wr(bus_wr),
	.rd(bus_rd),
	.cs_sdram(cs_sdram),
	.abus(bus_addr[25:0]),
	.ben(GDFX_TEMP_SIGNAL_0),
	.dbus_wr(bus_wdata),
	.sdram_dq(sdram_dq),
	.sdram_cke(sdram_cke),
	.sdram_cs_n(sdram_cs_n),
	.sdram_ras_n(sdram_ras_n),
	.sdram_cas_n(sdram_cas_n),
	.sdram_we_n(sdram_we_n),
	.sdram_dqml(sdram_dqml),
	.sdram_dqmh(sdram_dqmh),
	.ready_sdram(sdram_ready),
	.dbus_sdram_rd(sdram_rdata),
	.sdram_addr(sdram_addr),
	.sdram_ba(sdram_ba)
	);



BusDecoder	b2v_inst7(
	.bus_wr(bus_wr),
	.bus_rd(bus_rd),
	.sdram_ready(sdram_ready),
	
	.vga_ready(vga_ready),
	.bus_addr(bus_addr),
	
	.sdram_rdata(sdram_rdata),
	.vga_rdata(vga_rdata),
	.cs_sdram(cs_sdram),
	
	.cs_vga(cs_vga),
	.bus_ready(bus_ready),
	.bus_rdata(bus_rdata));

assign	jedan = 1;

endmodule
