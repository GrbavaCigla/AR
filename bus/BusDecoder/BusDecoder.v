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
// CREATED		"Wed Sep 02 14:02:49 2026"

module BusDecoder(
	bus_wr,
	bus_rd,
	sdram_ready,
	lidar_ready,
	vga_ready,
	bus_addr,
	lidar_rdata,
	sdram_rdata,
	vga_rdata,
	cs_sdram,
	cs_lidar,
	bus_ready,
	cs_vga,
	bus_rdata
);


input wire	bus_wr;
input wire	bus_rd;
input wire	sdram_ready;
input wire	lidar_ready;
input wire	vga_ready;
input wire	[31:0] bus_addr;
input wire	[31:0] lidar_rdata;
input wire	[31:0] sdram_rdata;
input wire	[31:0] vga_rdata;
output wire	cs_sdram;
output wire	cs_lidar;
output wire	bus_ready;
output wire	cs_vga;
output wire	[31:0] bus_rdata;

wire	wrORrd;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_5 = 0;
wire	[1:0] GDFX_TEMP_SIGNAL_0;
wire	[1:0] GDFX_TEMP_SIGNAL_1;


assign	GDFX_TEMP_SIGNAL_0 = {bus_addr[29],bus_addr[28]};
assign	GDFX_TEMP_SIGNAL_1 = {bus_addr[29],bus_addr[28]};

assign	SYNTHESIZED_WIRE_7 =  ~bus_addr[28];

assign	cs_sdram = wrORrd & SYNTHESIZED_WIRE_0;

assign	cs_vga = SYNTHESIZED_WIRE_1 & wrORrd;

assign	SYNTHESIZED_WIRE_2 =  ~bus_addr[29];

assign	SYNTHESIZED_WIRE_6 = bus_addr[28] & SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_3 =  ~bus_addr[28];

assign	SYNTHESIZED_WIRE_1 = bus_addr[29] & SYNTHESIZED_WIRE_3;


MPX4_32BIT	b2v_inst15(
	.data0x(sdram_rdata),
	.data1x(lidar_rdata),
	.data2x(vga_rdata),
	.data3x(SYNTHESIZED_WIRE_4),
	.sel(GDFX_TEMP_SIGNAL_0),
	.result(bus_rdata));


MPX4	b2v_inst16(
	.data3(SYNTHESIZED_WIRE_5),
	.data2(vga_ready),
	.data1(lidar_ready),
	.data0(sdram_ready),
	.sel(GDFX_TEMP_SIGNAL_1),
	.result(bus_ready));


ConstantX	b2v_inst17(
	.DATA_OUT(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst17.const = 0;
	defparam	b2v_inst17.size = 32;


assign	cs_lidar = SYNTHESIZED_WIRE_6 & wrORrd;

assign	wrORrd = bus_rd | bus_wr;

assign	SYNTHESIZED_WIRE_8 =  ~bus_addr[29];

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_7 & SYNTHESIZED_WIRE_8;


endmodule
