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
// CREATED		"Thu Aug 13 21:12:21 2026"

module ALUDecoder(
	ALUOp,
	funct3,
	funct7,
	ALUControl
);


input wire	[1:0] ALUOp;
input wire	[2:0] funct3;
input wire	[5:5] funct7;
output wire	[3:0] ALUControl;

wire	nula;
wire	jedan;
wire	[3:0] ALUControl_arith;
wire	[3:0] ALUControl_branch;
wire	is_f3_000;
wire	is_f3_001;
wire	is_f3_010;
wire	is_f3_011;
wire	is_f3_100;
wire	is_f3_101;
wire	is_f3_110;
wire	is_f3_111;
wire	sel_AND;
wire	sel_branch_SLT;
wire	sel_branch_SLTU;
wire	sel_branch_SUB;
wire	sel_OR;
wire	sel_SLL;
wire	sel_SLT;
wire	sel_SLTU;
wire	sel_SRA;
wire	sel_SRL;
wire	sel_SUB;
wire	sel_XOR;
wire	SYNTHESIZED_WIRE_0;

wire	[3:0] GDFX_TEMP_SIGNAL_11;
wire	[3:0] GDFX_TEMP_SIGNAL_17;
wire	[3:0] GDFX_TEMP_SIGNAL_13;
wire	[3:0] GDFX_TEMP_SIGNAL_15;
wire	[3:0] GDFX_TEMP_SIGNAL_9;
wire	[3:0] GDFX_TEMP_SIGNAL_7;
wire	[3:0] GDFX_TEMP_SIGNAL_5;
wire	[3:0] GDFX_TEMP_SIGNAL_3;
wire	[3:0] GDFX_TEMP_SIGNAL_1;
wire	[3:0] GDFX_TEMP_SIGNAL_10;
wire	[3:0] GDFX_TEMP_SIGNAL_0;
wire	[3:0] GDFX_TEMP_SIGNAL_2;
wire	[3:0] GDFX_TEMP_SIGNAL_4;
wire	[3:0] GDFX_TEMP_SIGNAL_6;
wire	[3:0] GDFX_TEMP_SIGNAL_8;
wire	[3:0] GDFX_TEMP_SIGNAL_12;
wire	[3:0] GDFX_TEMP_SIGNAL_14;
wire	[3:0] GDFX_TEMP_SIGNAL_16;


assign	GDFX_TEMP_SIGNAL_11 = {jedan,nula,jedan,nula};
assign	GDFX_TEMP_SIGNAL_17 = {nula,jedan,jedan,jedan};
assign	GDFX_TEMP_SIGNAL_13 = {nula,jedan,jedan,nula};
assign	GDFX_TEMP_SIGNAL_15 = {nula,jedan,nula,jedan};
assign	GDFX_TEMP_SIGNAL_9 = {nula,jedan,nula,nula};
assign	GDFX_TEMP_SIGNAL_7 = {nula,nula,jedan,jedan};
assign	GDFX_TEMP_SIGNAL_5 = {nula,nula,jedan,nula};
assign	GDFX_TEMP_SIGNAL_3 = {nula,nula,nula,jedan};
assign	GDFX_TEMP_SIGNAL_1 = {nula,nula,nula,nula};
assign	GDFX_TEMP_SIGNAL_10 = {nula,nula,nula,nula};
assign	GDFX_TEMP_SIGNAL_0 = {nula,funct3[2:0]};
assign	GDFX_TEMP_SIGNAL_2 = {nula,funct3[2:0]};
assign	GDFX_TEMP_SIGNAL_4 = {nula,funct3[2:0]};
assign	GDFX_TEMP_SIGNAL_6 = {nula,funct3[2:0]};
assign	GDFX_TEMP_SIGNAL_8 = {nula,funct3[2:0]};
assign	GDFX_TEMP_SIGNAL_12 = {nula,funct3[2:0]};
assign	GDFX_TEMP_SIGNAL_14 = {nula,funct3[2:0]};
assign	GDFX_TEMP_SIGNAL_16 = {nula,funct3[2:0]};


CMP4	b2v_inst(
	.A(GDFX_TEMP_SIGNAL_0),
	.B(GDFX_TEMP_SIGNAL_1),
	
	.E(is_f3_000)
	);


CMP4	b2v_inst1(
	.A(GDFX_TEMP_SIGNAL_2),
	.B(GDFX_TEMP_SIGNAL_3),
	
	.E(is_f3_001)
	);

assign	sel_SUB = is_f3_000 & funct7;

assign	sel_OR = is_f3_110;


assign	sel_XOR = is_f3_100;


assign	sel_SLL = is_f3_001;


assign	sel_SRL = is_f3_101 & SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_0 =  ~funct7;

assign	sel_SRA = is_f3_101 & funct7;

assign	sel_SLT = is_f3_010;


assign	sel_SLTU = is_f3_011;



CMP4	b2v_inst2(
	.A(GDFX_TEMP_SIGNAL_4),
	.B(GDFX_TEMP_SIGNAL_5),
	
	.E(is_f3_010)
	);

assign	ALUControl_arith[3] = sel_SLTU | sel_SLT;

assign	ALUControl_arith[2] = sel_XOR | sel_SRL | sel_SRA | sel_SLL;

assign	ALUControl_arith[1] = sel_AND | sel_SRL | sel_SRA | sel_OR;

assign	ALUControl_arith[0] = sel_SUB | sel_SLL | sel_OR | sel_SRA | sel_SLTU | nula;

assign	sel_branch_SUB = is_f3_001 | is_f3_000;

assign	sel_branch_SLT = is_f3_101 | is_f3_100;

assign	sel_branch_SLTU = is_f3_111 | is_f3_110;

assign	ALUControl_branch[3] = sel_branch_SLTU | sel_branch_SLT;

assign	ALUControl_branch[1] = nula;


assign	ALUControl_branch[2] = nula;



CMP4	b2v_inst3(
	.A(GDFX_TEMP_SIGNAL_6),
	.B(GDFX_TEMP_SIGNAL_7),
	
	.E(is_f3_011)
	);

assign	ALUControl_branch[0] = sel_branch_SLTU | sel_branch_SUB;


CMP4	b2v_inst4(
	.A(GDFX_TEMP_SIGNAL_8),
	.B(GDFX_TEMP_SIGNAL_9),
	
	.E(is_f3_100)
	);


MPX4_4bit	b2v_inst40(
	.data0x(GDFX_TEMP_SIGNAL_10),
	.data1x(ALUControl_arith),
	.data2x(ALUControl_branch),
	.data3x(GDFX_TEMP_SIGNAL_11),
	.sel(ALUOp),
	.result(ALUControl));




CMP4	b2v_inst5(
	.A(GDFX_TEMP_SIGNAL_12),
	.B(GDFX_TEMP_SIGNAL_13),
	
	.E(is_f3_110)
	);


CMP4	b2v_inst6(
	.A(GDFX_TEMP_SIGNAL_14),
	.B(GDFX_TEMP_SIGNAL_15),
	
	.E(is_f3_101)
	);


CMP4	b2v_inst7(
	.A(GDFX_TEMP_SIGNAL_16),
	.B(GDFX_TEMP_SIGNAL_17),
	
	.E(is_f3_111)
	);

assign	sel_AND = is_f3_111;


assign	nula = 1'b0;
assign	jedan = 1'b1;

endmodule