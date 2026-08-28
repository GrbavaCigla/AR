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
// CREATED		"Fri Aug 28 16:31:07 2026"

module SevenSegBusInterface(
	CLK,
	RESET,
	bus_wr,
	cs_disp,
	bus_wdata,
	disp_ready,
	A_0,
	A_1,
	A_2,
	A_3,
	A_4,
	A_5,
	A_6,
	B_0,
	B_1,
	B_2,
	B_3,
	B_4,
	B_5,
	B_6
);


input wire	CLK;
input wire	RESET;
input wire	bus_wr;
input wire	cs_disp;
input wire	[7:0] bus_wdata;
output wire	disp_ready;
output wire	A_0;
output wire	A_1;
output wire	A_2;
output wire	A_3;
output wire	A_4;
output wire	A_5;
output wire	A_6;
output wire	B_0;
output wire	B_1;
output wire	B_2;
output wire	B_3;
output wire	B_4;
output wire	B_5;
output wire	B_6;

wire	[7:0] A;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;

assign	disp_ready = 1;
assign	SYNTHESIZED_WIRE_1 = 0;
assign	SYNTHESIZED_WIRE_2 = 1;
assign	SYNTHESIZED_WIRE_3 = 0;
assign	SYNTHESIZED_WIRE_4 = 1;




assign	SYNTHESIZED_WIRE_0 = bus_wr & cs_disp;


REG8_LD_CL	b2v_inst10(
	.LD(SYNTHESIZED_WIRE_0),
	.CL(RESET),
	.clk(CLK),
	.I(bus_wdata),
	.A(A));


SevenSegmentInterfaceDEC	b2v_inst2(
	.dot(SYNTHESIZED_WIRE_1),
	.en(SYNTHESIZED_WIRE_2),
	.x(A[3:0]),
	.a(A_0),
	.b(A_1),
	.c(A_2),
	.d(A_3),
	.e(A_4),
	.f(A_5),
	.g(A_6)
	);




SevenSegmentInterfaceDEC	b2v_inst5(
	.dot(SYNTHESIZED_WIRE_3),
	.en(SYNTHESIZED_WIRE_4),
	.x(A[7:4]),
	.a(B_0),
	.b(B_1),
	.c(B_2),
	.d(B_3),
	.e(B_4),
	.f(B_5),
	.g(B_6)
	);




endmodule
