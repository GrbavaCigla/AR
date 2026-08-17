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
// CREATED		"Mon Aug 17 21:37:34 2026"

module riscv32i_2(
	CLK,
	RESET,
	N,
	Z,
	sdram_cke,
	sdram_cs_n,
	sdram_ras_n,
	sdram_cas_n,
	sdram_we_n,
	sdram_dqml,
	dsram_dqmh,
	RESULT,
	sdram_addr,
	sdram_ba,
	sdram_dq
);


input wire	CLK;
input wire	RESET;
output wire	N;
output wire	Z;
output wire	sdram_cke;
output wire	sdram_cs_n;
output wire	sdram_ras_n;
output wire	sdram_cas_n;
output wire	sdram_we_n;
output wire	sdram_dqml;
output wire	dsram_dqmh;
output wire	[31:0] RESULT;
output wire	[12:0] sdram_addr;
output wire	[1:0] sdram_ba;
output wire	[15:0] sdram_dq;

wire	[7:0] _01100111;
wire	[31:0] A;
wire	[3:0] ALUControl;
wire	[1:0] ALUOp;
wire	ALUSrcA;
wire	ALUSrcB;
wire	[31:0] B;
wire	beq;
wire	bge;
wire	bgeu;
wire	blt;
wire	bltu;
wire	bne;
wire	Branch;
wire	branch_taken;
wire	[31:0] bus_rdata;
wire	bus_ready;
wire	bus_wait;
wire	[31:0] cetiri;
wire	cs_lidar;
wire	cs_sdram;
wire	[31:0] dbus_sdram_rd;
wire	[31:0] IMM_OUT;
wire	[2:0] immSrc;
wire	[31:0] INSTRUCTIONS;
wire	is_JAL;
wire	is_JALR;
wire	[31:0] JALR_SUM;
wire	jedan;
wire	Jump;
wire	MemRead;
wire	[1:0] MemToReg;
wire	MemWrite;
wire	[31:0] NEXT_PC;
wire	nula;
wire	[31:0] nula32BITS;
wire	[31:0] PC;
wire	[1:0] pc_sel;
wire	[31:0] PCplus4;
wire	[31:0] PCplusIMM;
wire	realRegWrite;
wire	RegWrite;
wire	[31:0] RESULT_ALTERA_SYNTHESIZED;
wire	[31:0] RS1DATA;
wire	[31:0] RS2DATA;
wire	sdram_ready;
wire	Z_ALTERA_SYNTHESIZED;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;

wire	[3:0] GDFX_TEMP_SIGNAL_5;
wire	[31:0] GDFX_TEMP_SIGNAL_1;
wire	[7:0] GDFX_TEMP_SIGNAL_6;
wire	[31:0] GDFX_TEMP_SIGNAL_0;
wire	[31:0] GDFX_TEMP_SIGNAL_4;
wire	[31:0] GDFX_TEMP_SIGNAL_3;
wire	[7:0] GDFX_TEMP_SIGNAL_2;


assign	GDFX_TEMP_SIGNAL_5 = {jedan,jedan,jedan,jedan};
assign	GDFX_TEMP_SIGNAL_1 = {JALR_SUM[31:1],nula};
assign	GDFX_TEMP_SIGNAL_6 = {nula,INSTRUCTIONS[6:0]};
assign	GDFX_TEMP_SIGNAL_0 = {nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula};
assign	GDFX_TEMP_SIGNAL_4 = {nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula};
assign	GDFX_TEMP_SIGNAL_3 = {nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,nula,jedan,nula,nula};
assign	GDFX_TEMP_SIGNAL_2 = {nula,jedan,jedan,nula,nula,jedan,jedan,jedan};


ALUDecoder	b2v_inst(
	.ALUOp(ALUOp),
	.funct3(INSTRUCTIONS[14:12]),
	.funct7(INSTRUCTIONS[30]),
	.INSTRUCTIONS(INSTRUCTIONS[5]),
	.ALUControl(ALUControl));


ImmediateGenerator	b2v_inst1(
	.IMM_SRC(immSrc),
	.INSTRUCTION(INSTRUCTIONS),
	.IMM_OUT(IMM_OUT));


BusDecoder	b2v_inst10(
	.bus_wr(MemWrite),
	.bus_rd(MemRead),
	.sdram_ready(sdram_ready),
	.lidar_ready(nula),
	.bus_addr(RESULT_ALTERA_SYNTHESIZED),
	.lidar_rdata(GDFX_TEMP_SIGNAL_0),
	.sdram_rdata(dbus_sdram_rd),
	.cs_sdram(cs_sdram),
	
	.bus_ready(bus_ready),
	.bus_rdata(bus_rdata));


ADD32	b2v_inst11(
	.C_0(nula),
	.A(PC),
	.B(IMM_OUT),
	
	.OUT(PCplusIMM));


MPX4_32BIT	b2v_inst12(
	.data0x(RESULT_ALTERA_SYNTHESIZED),
	.data1x(bus_rdata),
	.data2x(PCplus4),
	.data3x(nula32BITS),
	.sel(MemToReg),
	.result(SYNTHESIZED_WIRE_5));


pc	b2v_inst13(
	.RESET(RESET),
	.CLK(CLK),
	.NEXT_PC(SYNTHESIZED_WIRE_0),
	.PC(PC));


ADD32	b2v_inst14(
	.C_0(nula),
	.A(RS1DATA),
	.B(IMM_OUT),
	
	.OUT(JALR_SUM));


InstructionMemory	b2v_inst15(
	.CLK(CLK),
	.ADDRESS(PC),
	.READDATA(INSTRUCTIONS));


MPX4_32BIT	b2v_inst16(
	.data0x(PCplus4),
	.data1x(PCplusIMM),
	.data2x(GDFX_TEMP_SIGNAL_1),
	.data3x(nula32BITS),
	.sel(pc_sel),
	.result(NEXT_PC));

assign	SYNTHESIZED_WIRE_1 = beq | blt | bne | bge | bltu | bgeu;

assign	branch_taken = SYNTHESIZED_WIRE_1 & Branch;


ControlWord	b2v_inst19(
	.opcode(INSTRUCTIONS[6:0]),
	.RegWrite(RegWrite),
	.MemWrite(MemWrite),
	.MemRead(MemRead),
	.Branch(Branch),
	.Jump(Jump),
	.ALUSrcA(ALUSrcA),
	.ALUSrcB(ALUSrcB),
	.ALUOp(ALUOp),
	.immSrc(immSrc),
	.MemToReg(MemToReg));


ALU	b2v_inst2(
	.A(A),
	.ALUControl(ALUControl),
	.B(B),
	.N(N),
	.Z(Z_ALTERA_SYNTHESIZED),
	.RESULT(RESULT_ALTERA_SYNTHESIZED));

assign	pc_sel[1] = is_JALR;


assign	SYNTHESIZED_WIRE_3 =  ~is_JALR;

assign	is_JAL = Jump & SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_2 =  ~is_JALR;

assign	pc_sel[0] = SYNTHESIZED_WIRE_3 & SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_4 = branch_taken | is_JAL;

assign	_01100111 = GDFX_TEMP_SIGNAL_2;


assign	cetiri = GDFX_TEMP_SIGNAL_3;


assign	nula32BITS = GDFX_TEMP_SIGNAL_4;



BusFSM	b2v_inst29(
	.mem_read(MemRead),
	.mem_write(MemWrite),
	.bus_ready(bus_ready),
	.clk(CLK),
	.bus_wait(bus_wait));


REGFILE	b2v_inst3(
	.REGWRITE(realRegWrite),
	.CLK(CLK),
	.RESET(RESET),
	.RD(INSTRUCTIONS[11:7]),
	.RS1(INSTRUCTIONS[19:15]),
	.RS2(INSTRUCTIONS[24:20]),
	.WRITEDATA(SYNTHESIZED_WIRE_5),
	.RS1DATA(RS1DATA),
	.RS2DATA(RS2DATA));


sdram_wrapper	b2v_inst30(
	.clk(CLK),
	.rst_n(jedan),
	.wr(MemWrite),
	.rd(SYNTHESIZED_WIRE_6),
	.cs_sdram(cs_sdram),
	.abus(RESULT_ALTERA_SYNTHESIZED[25:0]),
	.ben(GDFX_TEMP_SIGNAL_5),
	.dbus_wr(RS2DATA),
	.sdram_dq(sdram_dq),
	.sdram_cke(sdram_cke),
	.sdram_cs_n(sdram_cs_n),
	.sdram_ras_n(sdram_ras_n),
	.sdram_cas_n(sdram_cas_n),
	.sdram_we_n(sdram_we_n),
	.sdram_dqml(sdram_dqml),
	.sdram_dqmh(dsram_dqmh),
	.ready_sdram(sdram_ready),
	.dbus_sdram_rd(dbus_sdram_rd),
	.sdram_addr(sdram_addr),
	.sdram_ba(sdram_ba)
	);


MPX2_32BIT	b2v_inst31(
	.S(bus_wait),
	.E(jedan),
	.I0(NEXT_PC),
	.I1(PC),
	.D(SYNTHESIZED_WIRE_0));

assign	realRegWrite = RegWrite & SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_7 =  ~bus_wait;

assign	SYNTHESIZED_WIRE_6 = cs_sdram & MemWrite;


MPX2_32BIT	b2v_inst4(
	.S(ALUSrcB),
	.E(jedan),
	.I0(RS2DATA),
	.I1(IMM_OUT),
	.D(B));


BranchDecoder	b2v_inst5(
	.z(Z_ALTERA_SYNTHESIZED),
	.funct3(INSTRUCTIONS[14:12]),
	.result(RESULT_ALTERA_SYNTHESIZED),
	.BEQ(beq),
	.BNE(bne),
	.BLT(blt),
	.BGE(bge),
	.BLTU(bltu),
	.BGEU(bgeu));



MPX2_32BIT	b2v_inst7(
	.S(ALUSrcA),
	.E(jedan),
	.I0(RS1DATA),
	.I1(PC),
	.D(A));


CMP8	b2v_inst77(
	.A(GDFX_TEMP_SIGNAL_6),
	.B(_01100111),
	
	.E(is_JALR)
	);


ADD32	b2v_inst8(
	.C_0(nula),
	.A(PC),
	.B(cetiri),
	
	.OUT(PCplus4));


assign	Z = Z_ALTERA_SYNTHESIZED;
assign	RESULT = RESULT_ALTERA_SYNTHESIZED;
assign	jedan = 1;
assign	nula = 0;

endmodule
