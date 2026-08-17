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
// CREATED		"Mon Aug 17 15:45:10 2026"

module BusDecoder(
	bus_wr,
	bus_rd,
	sdram_ready,
	lidar_ready,
	bus_addr,
	lidar_rdata,
	sdram_rdata,
	cs_sdram,
	cs_lidar,
	bus_ready,
	bus_rdata
);


input wire	bus_wr;
input wire	bus_rd;
input wire	sdram_ready;
input wire	lidar_ready;
input wire	[31:0] bus_addr;
input wire	[31:0] lidar_rdata;
input wire	[31:0] sdram_rdata;
output wire	cs_sdram;
output wire	cs_lidar;
output wire	bus_ready;
output wire	[31:0] bus_rdata;

wire	wrORrd;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_1 = 1;
assign	SYNTHESIZED_WIRE_2 = 1;



assign	SYNTHESIZED_WIRE_0 =  ~bus_addr[28];

assign	cs_sdram = wrORrd & SYNTHESIZED_WIRE_0;

assign	cs_lidar = bus_addr[28] & wrORrd;

assign	wrORrd = bus_rd | bus_wr;


MPX2_32BIT	b2v_inst4(
	.S(bus_addr[28]),
	.E(SYNTHESIZED_WIRE_1),
	.I0(sdram_rdata),
	.I1(lidar_rdata),
	.D(bus_rdata));



MPX2	b2v_inst6(
	.I0(sdram_ready),
	.I1(lidar_ready),
	.S(bus_addr[28]),
	.E(SYNTHESIZED_WIRE_2),
	.D(bus_ready));



endmodule
