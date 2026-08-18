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
// CREATED		"Tue Aug 18 18:12:29 2026"

module sdram_arbiter(
	d_write,
	d_read,
	v_read,
	CLK,
	rst_n,
	sdram_ready,
	d_addr,
	d_ben,
	d_wdata,
	sdram_dbus_rd,
	v_addr,
	sdram_write,
	sdram_read,
	d_ready,
	v_ready,
	d_rdata,
	sdram_abus,
	sdram_ben,
	sdram_dbus_wr,
	v_rdata
);


input wire	d_write;
input wire	d_read;
input wire	v_read;
input wire	CLK;
input wire	rst_n;
input wire	sdram_ready;
input wire	[25:0] d_addr;
input wire	[3:0] d_ben;
input wire	[31:0] d_wdata;
input wire	[31:0] sdram_dbus_rd;
input wire	[25:0] v_addr;
output wire	sdram_write;
output wire	sdram_read;
output wire	d_ready;
output wire	v_ready;
output wire	[31:0] d_rdata;
output wire	[25:0] sdram_abus;
output wire	[3:0] sdram_ben;
output wire	[31:0] sdram_dbus_wr;
output wire	[31:0] v_rdata;

wire	ANY_REQ;
wire	busy;
wire	not_busy;
wire	owner;
wire	REQUEST;
wire	RESET_WRAPPER;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_2 = 1;
assign	SYNTHESIZED_WIRE_4 = 1;



assign	ANY_REQ = d_read | v_read | d_write;

assign	not_busy =  ~busy;


MPX2_26BIT	b2v_inst10(
	.sel(owner),
	.data0x(d_addr),
	.data1x(v_addr),
	.result(sdram_abus));

assign	sdram_read = busy & SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_1 =  ~owner;

assign	SYNTHESIZED_WIRE_3 =  ~owner;

assign	sdram_write = busy & SYNTHESIZED_WIRE_1 & d_write;


MPX2	b2v_inst16(
	.I0(d_read),
	.I1(v_read),
	.S(owner),
	.E(SYNTHESIZED_WIRE_2),
	.D(SYNTHESIZED_WIRE_0));


assign	sdram_ben = d_ben;


assign	sdram_dbus_wr = d_wdata;


assign	REQUEST = not_busy & ANY_REQ;

assign	d_ready = busy & SYNTHESIZED_WIRE_3 & sdram_ready;

assign	d_rdata = sdram_dbus_rd;


assign	v_ready = busy & owner & sdram_ready;

assign	v_rdata = sdram_dbus_rd;



REG1_LD_CL	b2v_inst3(
	.LD(REQUEST),
	.I(SYNTHESIZED_WIRE_4),
	.CL(RESET_WRAPPER),
	.clk(CLK),
	.A(busy));


assign	RESET_WRAPPER =  ~rst_n;


REG1_LD_CL	b2v_inst6(
	.LD(REQUEST),
	.I(SYNTHESIZED_WIRE_5),
	.CL(RESET_WRAPPER),
	.clk(CLK),
	.A(owner));

assign	SYNTHESIZED_WIRE_5 =  ~SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_6 = d_read | d_write;


endmodule
