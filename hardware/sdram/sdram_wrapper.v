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
// CREATED		"Wed Sep 02 22:02:35 2026"

module sdram_wrapper(
	rst_n,
	wr,
	rd,
	cs_sdram,
	clk,
	abus,
	ben,
	dbus_wr,
	ready_sdram,
	sdram_cke,
	sdram_cs_n,
	sdram_ras_n,
	sdram_cas_n,
	sdram_we_n,
	sdram_dqml,
	sdram_dqmh,
	dbus_sdram_rd,
	sdram_addr,
	sdram_ba,
	sdram_dq
);


input wire	rst_n;
input wire	wr;
input wire	rd;
input wire	cs_sdram;
input wire	clk;
input wire	[25:0] abus;
input wire	[3:0] ben;
input wire	[31:0] dbus_wr;
output wire	ready_sdram;
output wire	sdram_cke;
output wire	sdram_cs_n;
output wire	sdram_ras_n;
output wire	sdram_cas_n;
output wire	sdram_we_n;
output wire	sdram_dqml;
output wire	sdram_dqmh;
output wire	[31:0] dbus_sdram_rd;
output wire	[12:0] sdram_addr;
output wire	[1:0] sdram_ba;
inout wire	[15:0] sdram_dq;

wire	ACCESS_DONE;
wire	BUSY;
wire	BYTE_MASK_H;
wire	BYTE_MASK_L;
wire	CTRL_DQMH;
wire	CTRL_DQML;
wire	jedan;
wire	nula;
wire	[15:0] READ_HIGH;
wire	[15:0] READ_LOW;
wire	READY_SDRAM_ALTERA_SYNTHESIZED;
wire	REQ_RD;
wire	REQ_WR;
wire	REQUEST;
wire	RESET_WRAPPER;
wire	[24:0] SAVED_ADDR;
wire	[3:0] SAVED_BEN;
wire	[31:0] SAVED_DATA;
wire	SECOND_DONE;
wire	SECOND_HALF;
wire	SEND_ACCESS;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[24:0] SYNTHESIZED_WIRE_2;
wire	[15:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	[15:0] SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	[24:0] SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	[24:0] SYNTHESIZED_WIRE_25;





sdram_controller	b2v_inst(
	.RD(SYNTHESIZED_WIRE_0),
	.WR(SYNTHESIZED_WIRE_1),
	.CS(SEND_ACCESS),
	.RESET(RESET_WRAPPER),
	.CLK(clk),
	.ADDR(SYNTHESIZED_WIRE_2),
	.DATA_IN(SYNTHESIZED_WIRE_3),
	.DQ(sdram_dq),
	.CKE(sdram_cke),
	.CS_N(sdram_cs_n),
	.RAS_N(sdram_ras_n),
	.CAS_N(sdram_cas_n),
	.WE_N(sdram_we_n),
	.DQML(CTRL_DQML),
	.DQMH(CTRL_DQMH),
	.ACCESS_DONE(ACCESS_DONE),
	.A(sdram_addr),
	.BA(sdram_ba),
	.DATA_OUT(SYNTHESIZED_WIRE_26)
	);

assign	RESET_WRAPPER =  ~rst_n;

assign	REQUEST = cs_sdram & SYNTHESIZED_WIRE_4 & SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_4 =  ~BUSY;


REG1_LD_CL	b2v_inst13(
	.LD(REQUEST),
	.I(rd),
	.CL(SYNTHESIZED_WIRE_6),
	.clk(clk),
	.A(REQ_RD));


REG1_LD_CL	b2v_inst14(
	.LD(REQUEST),
	.I(wr),
	.CL(SYNTHESIZED_WIRE_7),
	.clk(clk),
	.A(REQ_WR));


REG1_LD_CL	b2v_inst15(
	.LD(REQUEST),
	.I(jedan),
	.CL(SYNTHESIZED_WIRE_8),
	.clk(clk),
	.A(BUSY));

assign	SYNTHESIZED_WIRE_8 = READY_SDRAM_ALTERA_SYNTHESIZED | RESET_WRAPPER;


REG1_LD_CL	b2v_inst17(
	.LD(SYNTHESIZED_WIRE_9),
	.I(jedan),
	.CL(SYNTHESIZED_WIRE_10),
	.clk(clk),
	.A(SECOND_HALF));

assign	SYNTHESIZED_WIRE_10 = READY_SDRAM_ALTERA_SYNTHESIZED | RESET_WRAPPER;


REG1_LD_CL	b2v_inst19(
	.LD(SECOND_DONE),
	.I(jedan),
	.CL(SYNTHESIZED_WIRE_11),
	.clk(clk),
	.A(READY_SDRAM_ALTERA_SYNTHESIZED));


REG25_LD_CL	b2v_inst2(
	.LD(REQUEST),
	.CL(RESET_WRAPPER),
	.CLK(clk),
	.I(abus[25:1]),
	.A(SAVED_ADDR));

assign	SYNTHESIZED_WIRE_9 = ACCESS_DONE & BUSY & SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_12 =  ~SECOND_HALF;

assign	SECOND_DONE = BUSY & ACCESS_DONE & SECOND_HALF;

assign	SYNTHESIZED_WIRE_23 =  ~ACCESS_DONE;

assign	SYNTHESIZED_WIRE_1 = REQ_WR & SEND_ACCESS;

assign	SYNTHESIZED_WIRE_0 = REQ_RD & SEND_ACCESS;


REG16_LD_CL	b2v_inst27(
	.LD(SYNTHESIZED_WIRE_13),
	.CL(RESET_WRAPPER),
	.clk(clk),
	.I(SYNTHESIZED_WIRE_26),
	.A(READ_LOW));


REG16_LD_CL	b2v_inst28(
	.LD(SYNTHESIZED_WIRE_15),
	.CL(RESET_WRAPPER),
	.clk(clk),
	.I(SYNTHESIZED_WIRE_26),
	.A(READ_HIGH));

assign	SYNTHESIZED_WIRE_13 = ACCESS_DONE & BUSY & REQ_RD & SYNTHESIZED_WIRE_17;


assign	SYNTHESIZED_WIRE_17 =  ~SECOND_HALF;


MPX2	b2v_inst31(
	.I0(SAVED_BEN[0]),
	.I1(SAVED_BEN[2]),
	.S(SECOND_HALF),
	.E(jedan),
	.D(SYNTHESIZED_WIRE_18));


MPX2	b2v_inst32(
	.I0(SAVED_BEN[1]),
	.I1(SAVED_BEN[3]),
	.S(SECOND_HALF),
	.E(jedan),
	.D(SYNTHESIZED_WIRE_19));

assign	BYTE_MASK_L =  ~SYNTHESIZED_WIRE_18;

assign	BYTE_MASK_H =  ~SYNTHESIZED_WIRE_19;

assign	sdram_dqml = CTRL_DQML | SYNTHESIZED_WIRE_20;

assign	SYNTHESIZED_WIRE_20 = REQ_WR & BYTE_MASK_L;

assign	sdram_dqmh = CTRL_DQMH | SYNTHESIZED_WIRE_21;

assign	SYNTHESIZED_WIRE_21 = REQ_WR & BYTE_MASK_H;


MPX2_25BIT	b2v_inst39(
	.S(SECOND_HALF),
	.E(jedan),
	.I0(SAVED_ADDR),
	.I1(SYNTHESIZED_WIRE_22),
	.D(SYNTHESIZED_WIRE_2));


assign	SYNTHESIZED_WIRE_15 = ACCESS_DONE & BUSY & REQ_RD & SECOND_HALF;

assign	SYNTHESIZED_WIRE_11 = READY_SDRAM_ALTERA_SYNTHESIZED | RESET_WRAPPER;

assign	SEND_ACCESS = SYNTHESIZED_WIRE_23 & SYNTHESIZED_WIRE_24 & BUSY;

assign	SYNTHESIZED_WIRE_24 =  ~READY_SDRAM_ALTERA_SYNTHESIZED;

assign	SYNTHESIZED_WIRE_7 = READY_SDRAM_ALTERA_SYNTHESIZED | RESET_WRAPPER;

assign	SYNTHESIZED_WIRE_6 = READY_SDRAM_ALTERA_SYNTHESIZED | RESET_WRAPPER;

assign	SYNTHESIZED_WIRE_5 = rd ^ wr;


REG32_LD_CL	b2v_inst5(
	.LD(REQUEST),
	.CL(RESET_WRAPPER),
	.clk(clk),
	.I(dbus_wr),
	.A(SAVED_DATA));


ADD25	b2v_inst6(
	.C_0(nula),
	.A(SAVED_ADDR),
	.B(SYNTHESIZED_WIRE_25),
	
	.OUT(SYNTHESIZED_WIRE_22));


REG4_LD_CL	b2v_inst7(
	.LD(REQUEST),
	.CL(RESET_WRAPPER),
	.clk(clk),
	.I(ben),
	.A(SAVED_BEN));


CONST_1_25b	b2v_inst8(
	.result(SYNTHESIZED_WIRE_25));


MPX2_16BIT	b2v_inst9(
	.S(SECOND_HALF),
	.E(jedan),
	.I0(SAVED_DATA[15:0]),
	.I1(SAVED_DATA[31:16]),
	.D(SYNTHESIZED_WIRE_3));

assign	ready_sdram = READY_SDRAM_ALTERA_SYNTHESIZED;
assign	dbus_sdram_rd[31:16] = READ_HIGH;
assign	dbus_sdram_rd[15:0] = READ_LOW;
assign	jedan = 1;
assign	nula = 0;

endmodule
