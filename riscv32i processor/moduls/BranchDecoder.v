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
// CREATED		"Thu Aug 13 23:36:58 2026"

module BranchDecoder(
	z,
	funct3,
	result,
	BEQ,
	BNE,
	BLT,
	BGE,
	BLTU,
	BGEU
);


input wire	z;
input wire	[2:0] funct3;
input wire	[31:0] result;
output wire	BEQ;
output wire	BNE;
output wire	BLT;
output wire	BGE;
output wire	BLTU;
output wire	BGEU;

wire	0;
wire	1;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;

wire	[3:0] GDFX_TEMP_SIGNAL_7;
wire	[3:0] GDFX_TEMP_SIGNAL_3;
wire	[3:0] GDFX_TEMP_SIGNAL_1;
wire	[3:0] GDFX_TEMP_SIGNAL_11;
wire	[3:0] GDFX_TEMP_SIGNAL_9;
wire	[3:0] GDFX_TEMP_SIGNAL_5;
wire	[3:0] GDFX_TEMP_SIGNAL_0;
wire	[3:0] GDFX_TEMP_SIGNAL_2;
wire	[3:0] GDFX_TEMP_SIGNAL_4;
wire	[3:0] GDFX_TEMP_SIGNAL_6;
wire	[3:0] GDFX_TEMP_SIGNAL_8;
wire	[3:0] GDFX_TEMP_SIGNAL_10;


assign	GDFX_TEMP_SIGNAL_7 = {0,0,0,0};
assign	GDFX_TEMP_SIGNAL_3 = {0,1,1,1};
assign	GDFX_TEMP_SIGNAL_1 = {0,1,1,0};
assign	GDFX_TEMP_SIGNAL_11 = {0,1,0,1};
assign	GDFX_TEMP_SIGNAL_9 = {0,1,0,0};
assign	GDFX_TEMP_SIGNAL_5 = {0,0,0,1};
assign	GDFX_TEMP_SIGNAL_0 = {0,funct3[2:0]};
assign	GDFX_TEMP_SIGNAL_2 = {0,funct3[2:0]};
assign	GDFX_TEMP_SIGNAL_4 = {0,funct3[2:0]};
assign	GDFX_TEMP_SIGNAL_6 = {0,funct3[2:0]};
assign	GDFX_TEMP_SIGNAL_8 = {0,funct3[2:0]};
assign	GDFX_TEMP_SIGNAL_10 = {0,funct3[2:0]};

assign	BEQ = z & SYNTHESIZED_WIRE_0;

assign	BNE = SYNTHESIZED_WIRE_1 & SYNTHESIZED_WIRE_2;


CMP4	b2v_inst10(
	.A(GDFX_TEMP_SIGNAL_0),
	.B(GDFX_TEMP_SIGNAL_1),
	
	.E(SYNTHESIZED_WIRE_8)
	);

assign	BGEU = SYNTHESIZED_WIRE_3 & SYNTHESIZED_WIRE_4;


CMP4	b2v_inst12(
	.A(GDFX_TEMP_SIGNAL_2),
	.B(GDFX_TEMP_SIGNAL_3),
	
	.E(SYNTHESIZED_WIRE_4)
	);



assign	SYNTHESIZED_WIRE_3 =  ~result[0];

assign	SYNTHESIZED_WIRE_1 =  ~z;


CMP4	b2v_inst3(
	.A(GDFX_TEMP_SIGNAL_4),
	.B(GDFX_TEMP_SIGNAL_5),
	
	.E(SYNTHESIZED_WIRE_2)
	);

assign	BLT = result[0] & SYNTHESIZED_WIRE_5;


CMP4	b2v_inst44(
	.A(GDFX_TEMP_SIGNAL_6),
	.B(GDFX_TEMP_SIGNAL_7),
	
	.E(SYNTHESIZED_WIRE_0)
	);


CMP4	b2v_inst5(
	.A(GDFX_TEMP_SIGNAL_8),
	.B(GDFX_TEMP_SIGNAL_9),
	
	.E(SYNTHESIZED_WIRE_5)
	);

assign	BGE = SYNTHESIZED_WIRE_6 & SYNTHESIZED_WIRE_7;


CMP4	b2v_inst7(
	.A(GDFX_TEMP_SIGNAL_10),
	.B(GDFX_TEMP_SIGNAL_11),
	
	.E(SYNTHESIZED_WIRE_7)
	);

assign	SYNTHESIZED_WIRE_6 =  ~result[0];

assign	BLTU = result[0] & SYNTHESIZED_WIRE_8;

assign	0 = 0;
assign	1 = 1;

endmodule
