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
// CREATED		"Fri Aug 14 15:54:14 2026"

module ControlWord(
	opcode,
	RegWrite,
	MemWrite,
	MemRead,
	Branch,
	Jump,
	ALUSrcB,
	ALUSrcA,
	ALUOp,
	immSrc,
	MemToReg
);


input wire	[6:0] opcode;
output wire	RegWrite;
output wire	MemWrite;
output wire	MemRead;
output wire	Branch;
output wire	Jump;
output wire	ALUSrcB;
output wire	ALUSrcA;
output wire	[1:0] ALUOp;
output wire	[2:0] immSrc;
output wire	[1:0] MemToReg;

wire	[7:0] _00000011;
wire	[7:0] _00010011;
wire	[7:0] _00010111;
wire	[7:0] _00100011;
wire	[7:0] _00110011;
wire	[7:0] _00110111;
wire	[7:0] _01100011;
wire	[7:0] _01100111;
wire	[7:0] _01101111;
wire	[1:0] ALUOp_ALTERA_SYNTHESIZED;
wire	[2:0] immSrc_ALTERA_SYNTHESIZED;
wire	is_AUIPC;
wire	is_Branch;
wire	is_Itype;
wire	is_JAL;
wire	is_JALR;
wire	is_LUI;
wire	is_LW;
wire	is_Rtype;
wire	is_SW;
wire	jedan;
wire	[1:0] MemToReg_ALTERA_SYNTHESIZED;
wire	nula;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;

wire	[7:0] GDFX_TEMP_SIGNAL_12;
wire	[7:0] GDFX_TEMP_SIGNAL_11;
wire	[7:0] GDFX_TEMP_SIGNAL_10;
wire	[7:0] GDFX_TEMP_SIGNAL_9;
wire	[7:0] GDFX_TEMP_SIGNAL_6;
wire	[7:0] GDFX_TEMP_SIGNAL_5;
wire	[7:0] GDFX_TEMP_SIGNAL_4;
wire	[7:0] GDFX_TEMP_SIGNAL_3;
wire	[7:0] GDFX_TEMP_SIGNAL_8;
wire	[7:0] GDFX_TEMP_SIGNAL_0;
wire	[7:0] GDFX_TEMP_SIGNAL_1;
wire	[7:0] GDFX_TEMP_SIGNAL_2;
wire	[7:0] GDFX_TEMP_SIGNAL_7;
wire	[7:0] GDFX_TEMP_SIGNAL_13;
wire	[7:0] GDFX_TEMP_SIGNAL_14;
wire	[7:0] GDFX_TEMP_SIGNAL_15;
wire	[7:0] GDFX_TEMP_SIGNAL_16;
wire	[7:0] GDFX_TEMP_SIGNAL_17;


assign	GDFX_TEMP_SIGNAL_12 = {nula,nula,nula,jedan,nula,jedan,jedan,jedan};
assign	GDFX_TEMP_SIGNAL_11 = {nula,jedan,jedan,nula,nula,jedan,jedan,jedan};
assign	GDFX_TEMP_SIGNAL_10 = {nula,nula,jedan,jedan,nula,jedan,jedan,jedan};
assign	GDFX_TEMP_SIGNAL_9 = {nula,jedan,jedan,nula,jedan,jedan,jedan,jedan};
assign	GDFX_TEMP_SIGNAL_6 = {nula,nula,jedan,nula,nula,nula,jedan,jedan};
assign	GDFX_TEMP_SIGNAL_5 = {nula,nula,nula,nula,nula,nula,jedan,jedan};
assign	GDFX_TEMP_SIGNAL_4 = {nula,nula,nula,jedan,nula,nula,jedan,jedan};
assign	GDFX_TEMP_SIGNAL_3 = {nula,nula,jedan,jedan,nula,nula,jedan,jedan};
assign	GDFX_TEMP_SIGNAL_8 = {nula,jedan,jedan,nula,nula,nula,jedan,jedan};
assign	GDFX_TEMP_SIGNAL_0 = {nula,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_1 = {nula,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_2 = {nula,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_7 = {nula,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_13 = {nula,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_14 = {nula,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_15 = {nula,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_16 = {nula,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_17 = {nula,opcode[6:0]};


CMP8	b2v_inst(
	.A(GDFX_TEMP_SIGNAL_0),
	.B(_00110011),
	
	.E(is_Rtype)
	);


assign	RegWrite = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;


CMP8	b2v_inst11(
	.A(GDFX_TEMP_SIGNAL_1),
	.B(_01100111),
	
	.E(is_JALR)
	);


CMP8	b2v_inst12(
	.A(GDFX_TEMP_SIGNAL_2),
	.B(_00010111),
	
	.E(is_AUIPC)
	);

assign	ALUOp_ALTERA_SYNTHESIZED[0] = is_Itype | is_LUI | is_Rtype;

assign	ALUSrcA = is_AUIPC;


assign	immSrc_ALTERA_SYNTHESIZED[2] = is_JAL & jedan;

assign	MemToReg_ALTERA_SYNTHESIZED[0] = jedan & is_LW;

assign	MemToReg_ALTERA_SYNTHESIZED[1] = is_JALR | is_JAL;


assign	SYNTHESIZED_WIRE_0 = is_JALR | is_AUIPC | is_LUI;

assign	immSrc_ALTERA_SYNTHESIZED[1] = is_AUIPC | is_LUI | is_Branch;

assign	immSrc_ALTERA_SYNTHESIZED[0] = is_AUIPC | is_LUI | is_SW;

assign	ALUSrcB = is_Itype | is_SW | is_LW | is_JALR | is_LUI | is_AUIPC;

assign	ALUOp_ALTERA_SYNTHESIZED[1] = is_LUI | is_Branch;

assign	_00110011 = GDFX_TEMP_SIGNAL_3;


assign	_00010011 = GDFX_TEMP_SIGNAL_4;


assign	_00000011 = GDFX_TEMP_SIGNAL_5;


assign	_00100011 = GDFX_TEMP_SIGNAL_6;



CMP8	b2v_inst3(
	.A(GDFX_TEMP_SIGNAL_7),
	.B(_00010011),
	
	.E(is_Itype)
	);

assign	_01100011 = GDFX_TEMP_SIGNAL_8;


assign	_01101111 = GDFX_TEMP_SIGNAL_9;


assign	_00110111 = GDFX_TEMP_SIGNAL_10;


assign	_01100111 = GDFX_TEMP_SIGNAL_11;


assign	_00010111 = GDFX_TEMP_SIGNAL_12;



CMP8	b2v_inst4(
	.A(GDFX_TEMP_SIGNAL_13),
	.B(_00000011),
	
	.E(is_LW)
	);


CMP8	b2v_inst5(
	.A(GDFX_TEMP_SIGNAL_14),
	.B(_00100011),
	
	.E(is_SW)
	);


CMP8	b2v_inst6(
	.A(GDFX_TEMP_SIGNAL_15),
	.B(_01100011),
	
	.E(is_Branch)
	);


CMP8	b2v_inst7(
	.A(GDFX_TEMP_SIGNAL_16),
	.B(_01101111),
	
	.E(is_JAL)
	);


CMP8	b2v_inst8(
	.A(GDFX_TEMP_SIGNAL_17),
	.B(_00110111),
	
	.E(is_LUI)
	);

assign	SYNTHESIZED_WIRE_1 = is_Rtype | is_LW | is_JAL | is_Itype;

assign	MemWrite = is_SW;
assign	MemRead = is_LW;
assign	Branch = is_Branch;
assign	Jump = MemToReg_ALTERA_SYNTHESIZED[1];
assign	ALUOp = ALUOp_ALTERA_SYNTHESIZED;
assign	immSrc = immSrc_ALTERA_SYNTHESIZED;
assign	MemToReg = MemToReg_ALTERA_SYNTHESIZED;
assign	jedan = 1;
assign	nula = 0;

endmodule
