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
// CREATED		"Mon Aug 31 11:33:04 2026"

module InstrctionMemory2(
	CLK,
	bus_wait,
	RESET,
	ADDRESS,
	READDATA
);


input wire	CLK;
input wire	bus_wait;
input wire	RESET;
input wire	[31:0] ADDRESS;
output wire	[31:0] READDATA;

wire	SYNTHESIZED_WIRE_0;




assign	SYNTHESIZED_WIRE_0 =  ~bus_wait;


ROM_CPU	b2v_inst1(
	.rden(SYNTHESIZED_WIRE_0),
	.clock(CLK),
	.address(ADDRESS[11:2]),
	.q(READDATA));


endmodule
