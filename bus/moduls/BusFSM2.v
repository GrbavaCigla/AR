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
// CREATED		"Tue Aug 18 01:18:52 2026"

module BusFSM2(
	mem_read,
	mem_write,
	bus_ready,
	bus_wait
);


input wire	mem_read;
input wire	mem_write;
input wire	bus_ready;
output wire	bus_wait;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;




assign	SYNTHESIZED_WIRE_0 = mem_write | mem_read;

assign	SYNTHESIZED_WIRE_1 =  ~bus_ready;

assign	bus_wait = SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_1;


endmodule
