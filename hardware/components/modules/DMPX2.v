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
// CREATED		"Tue Aug 04 22:52:34 2026"

module DMPX2(
	E,
	I0,
	S,
	D0,
	D1
);


input wire	E;
input wire	I0;
input wire	S;
output wire	D0;
output wire	D1;

wire	I;
wire	nS;




assign	D0 = I & E & nS;

assign	D1 = I & E & S;

assign	nS =  ~S;

assign	I = I0;

endmodule
