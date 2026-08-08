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
// CREATED		"Sat Aug 08 14:57:54 2026"

module sdram_controller(
	CLK,
	CS,
	RD,
	WR,
	STATE_PALL,
	STATE_INIT,
	STATE_ACTIVE,
	CKE,
	CS_N,
	RAS_N,
	CAS_N,
	WE_N,
	DQML,
	DQMH,
	A,
	BA,
	DQ
);


input wire	CLK;
input wire	CS;
input wire	RD;
input wire	WR;
output wire	STATE_PALL;
output wire	STATE_INIT;
output wire	STATE_ACTIVE;
output wire	CKE;
output wire	CS_N;
output wire	RAS_N;
output wire	CAS_N;
output wire	WE_N;
output wire	DQML;
output wire	DQMH;
output wire	[12:0] A;
output wire	[1:0] BA;
inout wire	[15:0] DQ;

wire	0;
wire	1;
wire	[15:0] 3;
wire	[15:0] 389;
wire	[10:10] A_ALTERA_SYNTHESIZED;
wire	[15:0] CMD;
wire	[15:0] desethiljada;
wire	INIT_DONE;
wire	jedan;
wire	nula;
wire	[15:0] nula16bitna;
wire	RC_DONE;
wire	READ;
wire	REFRESH_ACTIVE;
wire	REFRESH_DUE;
wire	RESET;
wire	STATE_ACTIVE_ALTERA_SYNTHESIZED;
wire	STATE_REFRESH;
wire	STATE_REFRESH_PALL;
wire	STATE_REFRESH_WAIT_RC;
wire	STATE_REFRESH_WAIT_RP;
wire	WRITE;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[15:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[15:0] SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	[15:0] SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;





REG16_LD_CL_INC_DEC	b2v_inst(
	.LD(nula),
	.C0(jedan),
	.INC(jedan),
	.E0(nula),
	.DEC(nula),
	.CL(SYNTHESIZED_WIRE_0),
	.clk(CLK),
	.I(nula16bitna),
	
	
	.A(SYNTHESIZED_WIRE_7));


CONST_10000_16b	b2v_inst1(
	.result(desethiljada));

assign	WRITE = WR & CS;

assign	READ = CS & RD;

assign	SYNTHESIZED_WIRE_1 = STATE_REFRESH_PALL | RESET;

assign	CS_N =  ~CS;


REG1_LD_CL	b2v_inst14(
	.LD(RESET),
	.I(jedan),
	.CL(INIT_DONE),
	.clk(CLK),
	.A(STATE_INIT));


REG1_LD_CL	b2v_inst15(
	.LD(INIT_DONE),
	.I(jedan),
	.CL(RESET),
	.clk(CLK),
	.A(STATE_PALL));


REG1_LD_CL	b2v_inst16(
	.LD(REFRESH_DUE),
	.I(1),
	.CL(SYNTHESIZED_WIRE_1),
	.clk(CLK),
	.A(STATE_REFRESH_PALL));


REG16_LD_CL	b2v_inst17(
	
	
	
	
	.A(CMD));


REG1_LD_CL	b2v_inst18(
	.LD(STATE_REFRESH_PALL),
	.I(1),
	.CL(SYNTHESIZED_WIRE_2),
	.clk(CLK),
	.A(STATE_REFRESH_WAIT_RP));


REG1_LD_CL	b2v_inst19(
	.LD(STATE_REFRESH_WAIT_RP),
	.I(1),
	.CL(SYNTHESIZED_WIRE_3),
	.clk(CLK),
	.A(STATE_REFRESH));


CONST_0_16b	b2v_inst2(
	.result(nula16bitna));

assign	SYNTHESIZED_WIRE_2 = STATE_REFRESH_WAIT_RP | RESET;

assign	SYNTHESIZED_WIRE_3 = STATE_REFRESH | RESET;


REG16_LD_CL_INC_DEC	b2v_inst22(
	.LD(0),
	.C0(1),
	.INC(STATE_REFRESH_WAIT_RC),
	.E0(0),
	.DEC(0),
	.CL(SYNTHESIZED_WIRE_4),
	.clk(CLK),
	.I(nula16bitna),
	
	
	.A(SYNTHESIZED_WIRE_5));

assign	SYNTHESIZED_WIRE_4 = RC_DONE | RESET;


CMP16	b2v_inst24(
	.A(SYNTHESIZED_WIRE_5),
	.B(3),
	
	.E(RC_DONE)
	);


REG1_LD_CL	b2v_inst25(
	.LD(STATE_REFRESH),
	.I(1),
	.CL(SYNTHESIZED_WIRE_6),
	.clk(CLK),
	.A(STATE_REFRESH_WAIT_RC));

assign	SYNTHESIZED_WIRE_6 = RC_DONE | RESET;

assign	SYNTHESIZED_WIRE_10 = RC_DONE | RESET;



CMP16	b2v_inst3(
	.A(SYNTHESIZED_WIRE_7),
	.B(desethiljada),
	
	.E(INIT_DONE)
	);

assign	SYNTHESIZED_WIRE_0 = INIT_DONE | RESET;


REG1_LD_CL	b2v_inst5(
	.LD(READ),
	.I(jedan),
	.CL(SYNTHESIZED_WIRE_8),
	.clk(CLK),
	.A(STATE_ACTIVE_ALTERA_SYNTHESIZED));

assign	RESET = READ & WRITE;

assign	SYNTHESIZED_WIRE_8 = RESET | STATE_ACTIVE_ALTERA_SYNTHESIZED;


CMP16	b2v_inst7(
	.A(SYNTHESIZED_WIRE_9),
	.B(389),
	
	.E(REFRESH_DUE)
	);




REG16_LD_CL_INC_DEC	b2v_REFRESH_COUNTER(
	.LD(0),
	.C0(1),
	.INC(1),
	.E0(0),
	.DEC(0),
	.CL(SYNTHESIZED_WIRE_10),
	.clk(CLK),
	.I(nula16bitna),
	
	
	.A(SYNTHESIZED_WIRE_9));

assign	STATE_ACTIVE = STATE_ACTIVE_ALTERA_SYNTHESIZED;
assign	RAS_N = CMD[8];
assign	CAS_N = CMD[7];
assign	WE_N = CMD[6];
assign	A = A_ALTERA_SYNTHESIZED;
assign	BA[1:0] = CMD[5:4];
assign	jedan = 1;
assign	nula = 0;

endmodule
