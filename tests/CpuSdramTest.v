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
// CREATED		"Fri Aug 28 20:08:14 2026"

module CpuSdramTest(
	clk,
	reset,
	sdram_cke,
	sdram_cs_n,
	sdram_ras_n,
	sdram_cas_n,
	sdram_we_n,
	sdram_dqml,
	sdram_dqmh,
	sdram_clk,
	HEX0,
	HEX1,
	sdram_addr,
	sdram_ba,
	sdram_dq
);


input wire	clk;
input wire	reset;
output wire	sdram_cke;
output wire	sdram_cs_n;
output wire	sdram_ras_n;
output wire	sdram_cas_n;
output wire	sdram_we_n;
output wire	sdram_dqml;
output wire	sdram_dqmh;
output wire	sdram_clk;
output wire	[6:0] HEX0;
output wire	[6:0] HEX1;
output wire	[12:0] sdram_addr;
output wire	[1:0] sdram_ba;
output wire	[15:0] sdram_dq;

wire	[31:0] bus_addr;
wire	bus_rd;
wire	[31:0] bus_rdata;
wire	bus_ready;
wire	[31:0] bus_wdata;
wire	bus_wr;
wire	cs_disp;
wire	cs_sdram;
wire	disp_ready;
wire	[6:0] HEX_ALTERA_SYNTHESIZED0;
wire	[6:0] HEX_ALTERA_SYNTHESIZED1;
wire	jedan;
wire	[31:0] sdram_rdata;
wire	sdram_ready;
wire	wrORrd;
wire	SYNTHESIZED_WIRE_0;

assign	sdram_clk = clk;
wire	[3:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_0 = {jedan,jedan,jedan,jedan};

assign	SYNTHESIZED_WIRE_0 =  ~bus_addr[28];

assign	cs_sdram = wrORrd & SYNTHESIZED_WIRE_0;

assign	bus_rdata = sdram_rdata;


assign	cs_disp = wrORrd & bus_addr[28];


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


riscvi32i_4	b2v_inst5(
	.CLK(clk),
	.RESET(reset),
	.bus_ready(bus_ready),
	.bus_rdata(bus_rdata),
	.bus_wr(bus_wr),
	.bus_rd(bus_rd),
	.bus_addr(bus_addr),
	.bus_wdata(bus_wdata));


assign	wrORrd = bus_rd | bus_wr;


SevenSegBusInterface	b2v_inst8(
	.CLK(clk),
	.bus_wr(bus_wr),
	.RESET(reset),
	.cs_disp(cs_disp),
	.bus_wdata(bus_wdata[7:0]),
	.disp_ready(disp_ready),
	.A_0(HEX_ALTERA_SYNTHESIZED0[0]),
	.B_0(HEX_ALTERA_SYNTHESIZED1[0]),
	.A_1(HEX_ALTERA_SYNTHESIZED0[1]),
	.B_1(HEX_ALTERA_SYNTHESIZED1[1]),
	.A_2(HEX_ALTERA_SYNTHESIZED0[2]),
	.B_2(HEX_ALTERA_SYNTHESIZED1[2]),
	.A_3(HEX_ALTERA_SYNTHESIZED0[3]),
	.B_3(HEX_ALTERA_SYNTHESIZED1[3]),
	.A_4(HEX_ALTERA_SYNTHESIZED0[4]),
	.B_4(HEX_ALTERA_SYNTHESIZED1[4]),
	.A_5(HEX_ALTERA_SYNTHESIZED0[5]),
	.B_5(HEX_ALTERA_SYNTHESIZED1[5]),
	.A_6(HEX_ALTERA_SYNTHESIZED0[6]),
	.B_6(HEX_ALTERA_SYNTHESIZED1[6]));


MPX2	b2v_inst9(
	.I0(sdram_ready),
	.I1(disp_ready),
	.S(bus_addr[28]),
	.E(jedan),
	.D(bus_ready));

assign	HEX0 = HEX_ALTERA_SYNTHESIZED0;
assign	HEX1 = HEX_ALTERA_SYNTHESIZED1;
assign	jedan = 1;

endmodule
