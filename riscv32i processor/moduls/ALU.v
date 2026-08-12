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
// CREATED		"Tue Aug 11 19:53:51 2026"

module ALU(
	A,
	ALUControl,
	B,
	Z,
	N,
	RESULT
);


input wire	[31:0] A;
input wire	[3:0] ALUControl;
input wire	[31:0] B;
output wire	Z;
output wire	N;
output wire	[31:0] RESULT;

wire	[31:0] addRESULT;
wire	[31:0] andRESULT;
wire	jedan;
wire	nula;
wire	[31:0] orRESULT;
wire	[31:0] RESULT_ALTERA_SYNTHESIZED;
wire	[31:0] sllRESULT;
wire	SLT;
wire	SLTU;
wire	[31:0] sraRESULT;
wire	[31:0] srlRESULT;
wire	[31:0] subRESULT;
wire	[31:0] xorRESULT;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;

wire	[31:0] GDFX_TEMP_SIGNAL_0;
wire	[31:0] GDFX_TEMP_SIGNAL_1;


assign	GDFX_TEMP_SIGNAL_0 = {31'b0, SLT};
assign	GDFX_TEMP_SIGNAL_1 = {31'b0, SLTU};


ADD32	b2v_inst(
	.C_0(nula),
	.A(A),
	.B(B),
	
	.OUT(addRESULT));


SUB32	b2v_inst1(
	.E_0(nula),
	.A(A),
	.B(B),
	
	.OUT(subRESULT));


SL5_32BIT	b2v_inst10(
	.A(A),
	.B(B[4:0]),
	.X(sllRESULT));

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_0 & SLTU;


SRA_SRL_32BIT	b2v_inst12(
	.MODE(nula),
	.A(A),
	.B(B[4:0]),
	.X(srlRESULT));


SRA_SRL_32BIT	b2v_inst13(
	.MODE(jedan),
	.A(A),
	.B(B[4:0]),
	.X(sraRESULT));


MPX16_32BIT	b2v_inst14(
	.data0x(addRESULT),
	.data10x(B),
	.data11x(A),
	.data12x(A),
	.data13x(A),
	.data14x(A),
	.data15x(A),
	.data1x(subRESULT),
	.data2x(andRESULT),
	.data3x(orRESULT),
	.data4x(xorRESULT),
	.data5x(sllRESULT),
	.data6x(srlRESULT),
	.data7x(sraRESULT),
	.data8x(GDFX_TEMP_SIGNAL_0),
	.data9x(GDFX_TEMP_SIGNAL_1),
	.sel(ALUControl),
	.result(RESULT_ALTERA_SYNTHESIZED));

assign	N = RESULT_ALTERA_SYNTHESIZED[31];


assign	SYNTHESIZED_WIRE_7 = ~B[31];

assign	SLT = SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_4 = ~A[31];


assign	SYNTHESIZED_WIRE_5 = ~B[31];

assign	SYNTHESIZED_WIRE_8 = SYNTHESIZED_WIRE_4 & SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_0 = A[31] & B[31];


AND32	b2v_inst24(
	.IN(SYNTHESIZED_WIRE_6),
	.OUT(Z));

assign	SYNTHESIZED_WIRE_6 = ~RESULT_ALTERA_SYNTHESIZED;


CMP32	b2v_inst3(
	.A(A),
	.B(B),
	
	.L(SLTU));



AND2_32BIT	b2v_inst5(
	.A(A),
	.B(B),
	.C(andRESULT));


OR2_32BIT	b2v_inst6(
	.A(A),
	.B(B),
	.C(orRESULT));


XOR2_32BIT	b2v_inst7(
	.A(A),
	.B(B),
	.C(xorRESULT));

assign	SYNTHESIZED_WIRE_3 = A[31] & SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_8 & SLTU;

assign	RESULT = RESULT_ALTERA_SYNTHESIZED;
assign	jedan = 1'b1;
assign	nula = 1'b0;

endmodule