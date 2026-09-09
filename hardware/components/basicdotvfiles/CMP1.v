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
// CREATED		"Thu Aug 13 14:17:21 2026"

module CMP1(
	A,
	B,
	Gi_1,
	Ei_1,
	Li_1,
	G,
	E,
	L
);


input wire	A;
input wire	B;
input wire	Gi_1;
input wire	Ei_1;
input wire	Li_1;
output wire	G;
output wire	E;
output wire	L;

wire	_A;
wire	_B;
wire	AeqB;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;




assign	G = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_2 = AeqB & Li_1;

assign	_A =  ~A;

assign	_B =  ~B;

assign	SYNTHESIZED_WIRE_1 = A & _B;

assign	L = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	E = AeqB & Ei_1;

assign	AeqB = A ~^ B;

assign	SYNTHESIZED_WIRE_0 = AeqB & Gi_1;

assign	SYNTHESIZED_WIRE_3 = _A & B;


endmodule
