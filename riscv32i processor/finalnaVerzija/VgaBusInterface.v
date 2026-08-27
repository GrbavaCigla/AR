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
// CREATED		"Fri Aug 28 00:55:38 2026"

module VgaBusInterface(
	cs_vga,
	bus_wr,
	bus_wdata,
	SET_PIXEL,
	SET_BIT,
	vga_ready,
	vga_rdata,
	XIN,
	YIN
);


input wire	cs_vga;
input wire	bus_wr;
input wire	[31:0] bus_wdata;
output wire	SET_PIXEL;
output wire	SET_BIT;
output wire	vga_ready;
output wire	[31:0] vga_rdata;
output wire	[9:0] XIN;
output wire	[9:0] YIN;


assign	SET_BIT = bus_wdata[31];
assign	vga_ready = 1;
assign	vga_rdata = 32'b00000000000000000000000000000000;
assign	XIN = bus_wdata[9:0];
assign	YIN = bus_wdata[19:10];





assign	SET_PIXEL = cs_vga & bus_wr;


endmodule
