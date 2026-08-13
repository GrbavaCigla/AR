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
// CREATED		"Thu Aug 13 20:43:22 2026"

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

wire	0;
wire	1;
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
wire	[1:0] MemToReg_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;

wire	[7:0] GDFX_TEMP_SIGNAL_13;
wire	[7:0] GDFX_TEMP_SIGNAL_15;
wire	[7:0] GDFX_TEMP_SIGNAL_17;
wire	[7:0] GDFX_TEMP_SIGNAL_3;
wire	[7:0] GDFX_TEMP_SIGNAL_5;
wire	[7:0] GDFX_TEMP_SIGNAL_11;
wire	[7:0] GDFX_TEMP_SIGNAL_9;
wire	[7:0] GDFX_TEMP_SIGNAL_7;
wire	[7:0] GDFX_TEMP_SIGNAL_1;
wire	[7:0] GDFX_TEMP_SIGNAL_0;
wire	[7:0] GDFX_TEMP_SIGNAL_2;
wire	[7:0] GDFX_TEMP_SIGNAL_4;
wire	[7:0] GDFX_TEMP_SIGNAL_6;
wire	[7:0] GDFX_TEMP_SIGNAL_8;
wire	[7:0] GDFX_TEMP_SIGNAL_10;
wire	[7:0] GDFX_TEMP_SIGNAL_12;
wire	[7:0] GDFX_TEMP_SIGNAL_14;
wire	[7:0] GDFX_TEMP_SIGNAL_16;


assign	GDFX_TEMP_SIGNAL_13 = {0,1,1,0,0,0,1,1};
assign	GDFX_TEMP_SIGNAL_15 = {0,1,1,0,1,1,1,1};
assign	GDFX_TEMP_SIGNAL_17 = {0,0,1,1,0,1,1,1};
assign	GDFX_TEMP_SIGNAL_3 = {0,1,1,0,0,1,1,1};
assign	GDFX_TEMP_SIGNAL_5 = {0,0,0,1,0,1,1,1};
assign	GDFX_TEMP_SIGNAL_11 = {0,0,1,0,0,0,1,1};
assign	GDFX_TEMP_SIGNAL_9 = {0,0,0,0,0,0,1,1};
assign	GDFX_TEMP_SIGNAL_7 = {0,0,0,1,0,0,1,1};
assign	GDFX_TEMP_SIGNAL_1 = {0,0,1,1,0,0,1,1};
assign	GDFX_TEMP_SIGNAL_0 = {0,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_2 = {0,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_4 = {0,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_6 = {0,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_8 = {0,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_10 = {0,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_12 = {0,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_14 = {0,opcode[6:0]};
assign	GDFX_TEMP_SIGNAL_16 = {0,opcode[6:0]};


CMP8	b2v_inst(
	.A(GDFX_TEMP_SIGNAL_0),
	.B(GDFX_TEMP_SIGNAL_1),
	
	.E(is_Rtype)
	);


assign	RegWrite = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;


CMP8	b2v_inst11(
	.A(GDFX_TEMP_SIGNAL_2),
	.B(GDFX_TEMP_SIGNAL_3),
	
	.E(is_JALR)
	);


CMP8	b2v_inst12(
	.A(GDFX_TEMP_SIGNAL_4),
	.B(GDFX_TEMP_SIGNAL_5),
	
	.E(is_AUIPC)
	);

assign	ALUOp_ALTERA_SYNTHESIZED[0] = is_Itype | is_LUI | is_Rtype;

assign	ALUSrcA = is_AUIPC;


assign	immSrc_ALTERA_SYNTHESIZED[2] = is_JAL & 1;

assign	MemToReg_ALTERA_SYNTHESIZED[0] = 1 & is_LW;

assign	MemToReg_ALTERA_SYNTHESIZED[1] = is_JALR | is_JAL;


assign	SYNTHESIZED_WIRE_0 = is_JALR | is_AUIPC | is_LUI;

assign	immSrc_ALTERA_SYNTHESIZED[1] = is_AUIPC | is_LUI | is_Branch;

assign	immSrc_ALTERA_SYNTHESIZED[0] = is_AUIPC | is_LUI | is_SW;

assign	ALUSrcB = is_Itype | is_SW | is_LW | is_JALR | is_LUI | is_AUIPC;

assign	ALUOp_ALTERA_SYNTHESIZED[1] = is_LUI | is_Branch;


CMP8	b2v_inst3(
	.A(GDFX_TEMP_SIGNAL_6),
	.B(GDFX_TEMP_SIGNAL_7),
	
	.E(is_Itype)
	);


CMP8	b2v_inst4(
	.A(GDFX_TEMP_SIGNAL_8),
	.B(GDFX_TEMP_SIGNAL_9),
	
	.E(is_LW)
	);


CMP8	b2v_inst5(
	.A(GDFX_TEMP_SIGNAL_10),
	.B(GDFX_TEMP_SIGNAL_11),
	
	.E(is_SW)
	);


CMP8	b2v_inst6(
	.A(GDFX_TEMP_SIGNAL_12),
	.B(GDFX_TEMP_SIGNAL_13),
	
	.E(is_Branch)
	);


CMP8	b2v_inst7(
	.A(GDFX_TEMP_SIGNAL_14),
	.B(GDFX_TEMP_SIGNAL_15),
	
	.E(is_JAL)
	);


CMP8	b2v_inst8(
	.A(GDFX_TEMP_SIGNAL_16),
	.B(GDFX_TEMP_SIGNAL_17),
	
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
assign	0 = 0;
assign	1 = 1;

endmodule
