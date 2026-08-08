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
// CREATED		"Fri Aug 07 22:23:36 2026"

module sdram_controller(
	CLK,
	RESET,
	STATE_PALL,
	STATE_INIT
);


input wire	CLK;
input wire	RESET;
output wire	STATE_PALL;
output wire	STATE_INIT;

wire	[15:0] desethiljada;
wire	INIT_DONE;
wire	jedan;
wire	nula;
wire	[15:0] nula16bitna;
wire	SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_1;





REG16_LD_CL_INC_DEC	b2v_inst(
	.LD(nula),
	.C0(jedan),
	.INC(jedan),
	.E0(nula),
	.DEC(nula),
	.CL(SYNTHESIZED_WIRE_0),
	.clk(CLK),
	.I(nula16bitna),
	
	
	.A(SYNTHESIZED_WIRE_1));


CONST_10000_16b	b2v_inst1(
	.result(desethiljada));


CONST_0_16b	b2v_inst2(
	.result(nula16bitna));


CMP16	b2v_inst3(
	.A(SYNTHESIZED_WIRE_1),
	.B(desethiljada),
	
	.E(INIT_DONE)
	);

assign	SYNTHESIZED_WIRE_0 = INIT_DONE | RESET;




REG1_LD_CL	b2v_REG_STATE_INIT(
	.LD(RESET),
	.I(jedan),
	.CL(INIT_DONE),
	.clk(CLK),
	.A(STATE_INIT));


REG1_LD_CL	b2v_REG_STATE_PALL(
	.LD(INIT_DONE),
	.I(jedan),
	.CL(RESET),
	.clk(CLK),
	.A(STATE_PALL));

assign	jedan = 1;
assign	nula = 0;

endmodule
