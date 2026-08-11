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
// CREATED		"Wed Aug 12 00:47:30 2026"

module Riscv32i(
	CLK,
	RESET,
	N,
	Z,
	RESULT
);


input wire	CLK;
input wire	RESET;
output wire	N;
output wire	Z;
output wire	[31:0] RESULT;

wire	0;
wire	1;
wire	[31:0] A;
wire	[3:0] ALUControl;
wire	[1:0] ALUOp;
wire	ALUSrcA;
wire	ALUSrcB;
wire	[31:0] B;
wire	Branch;
wire	[31:0] IMM_OUT;
wire	[2:0] immSrc;
wire	[31:0] INSTRUCTIONS;
wire	Jump;
wire	MemRead;
wire	[1:0] MemToReg;
wire	MemWrite;
wire	[31:0] PC;
wire	[31:0] PCplus4;
wire	[31:0] READDATA;
wire	RegWrite;
wire	[31:0] RESULT_ALTERA_SYNTHESIZED;
wire	[31:0] RS1DATA;
wire	[31:0] RS2DATA;
wire	[31:0] SYNTHESIZED_WIRE_0;

wire	[31:0] GDFX_TEMP_SIGNAL_1;
wire	[31:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_1 = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0};
assign	GDFX_TEMP_SIGNAL_0 = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};


ALUDecoder	b2v_inst(
	.ALUOp(ALUOp),
	.funct3(INSTRUCTIONS[14:12]),
	.funct7(INSTRUCTIONS[29]),
	.ALUControl(ALUControl));


ImmediateGenerator	b2v_inst1(
	.IMM_SRC(immSrc),
	.INSTRUCTION(INSTRUCTIONS),
	.IMM_OUT(IMM_OUT));


DataMemory	b2v_inst10(
	.RESET(RESET),
	.MemRead(MemRead),
	.MemWrite(MemWrite),
	.CLK(CLK),
	.ADDRESS(RESULT_ALTERA_SYNTHESIZED),
	.WRITEDATA(RS2DATA),
	.READDATA(READDATA));


MPX4_32BIT	b2v_inst12(
	.data0x(RESULT_ALTERA_SYNTHESIZED),
	.data1x(READDATA),
	.data2x(PCplus4),
	.data3x(GDFX_TEMP_SIGNAL_0),
	.sel(MemToReg),
	.result(SYNTHESIZED_WIRE_0));


pc	b2v_inst13(
	.RESET(RESET),
	.CLK(CLK),
	.PC(PC));


InstructionMemory	b2v_inst15(
	.CLK(CLK),
	.ADDRESS(PC),
	.READDATA(INSTRUCTIONS));


ALU	b2v_inst2(
	.A(A),
	.ALUControl(ALUControl),
	.B(B),
	.N(N),
	.Z(Z),
	.RESULT(RESULT_ALTERA_SYNTHESIZED));


REGFILE	b2v_inst3(
	.REGWRITE(RegWrite),
	.CLK(CLK),
	.RESET(RESET),
	.RD(INSTRUCTIONS[11:7]),
	.RS1(INSTRUCTIONS[19:15]),
	.RS2(INSTRUCTIONS[24:20]),
	.WRITEDATA(SYNTHESIZED_WIRE_0),
	.RS1DATA(RS1DATA),
	.RS2DATA(RS2DATA));


MPX2_32BIT	b2v_inst4(
	.S(ALUSrcB),
	.E(1),
	.I0(RS2DATA),
	.I1(IMM_OUT),
	.D(B));


ControlWord	b2v_inst5(
	.opcode(INSTRUCTIONS[6:0]),
	.RegWrite(RegWrite),
	.MemWrite(MemWrite),
	.MemRead(MemRead),
	
	
	.ALUSrcA(ALUSrcA),
	.ALUSrcB(ALUSrcB),
	.ALUOp(ALUOp),
	.immSrc(immSrc),
	.MemToReg(MemToReg));



MPX2_32BIT	b2v_inst7(
	.S(ALUSrcA),
	.E(1),
	.I0(RS1DATA),
	.I1(PC),
	.D(A));


ADD32	b2v_inst8(
	.C_0(0),
	.A(PC),
	.B(GDFX_TEMP_SIGNAL_1),
	
	.OUT(PCplus4));


assign	RESULT = RESULT_ALTERA_SYNTHESIZED;
assign	0 = 0;
assign	1 = 1;

endmodule
