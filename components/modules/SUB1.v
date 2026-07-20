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
// CREATED		"Mon Jul 20 16:26:32 2026"

module SUB1(
	A,
	B,
	E_0,
	OUT,
	E
);


input wire	A;
input wire	B;
input wire	E_0;
output wire	OUT;
output wire	E;

wire	NA;
wire	NB;
wire	NE_0;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;




assign	SYNTHESIZED_WIRE_3 = NA & NB & E_0;

assign	SYNTHESIZED_WIRE_6 = NA & B & NE_0;

assign	SYNTHESIZED_WIRE_1 = B & E_0;

assign	E = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_4 = A & B & E_0;

assign	SYNTHESIZED_WIRE_5 = A & NB & NE_0;

assign	NA =  ~A;

assign	NB =  ~B;

assign	NE_0 =  ~E_0;

assign	OUT = SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_2 = NA & E_0;

assign	SYNTHESIZED_WIRE_0 = NA & B;


endmodule
