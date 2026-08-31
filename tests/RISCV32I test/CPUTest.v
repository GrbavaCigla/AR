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
// CREATED		"Mon Aug 31 15:04:36 2026"

module CPUTest(
	clk,
	resetBtn0,
	LED0,
	LED1
);


input wire	clk;
input wire	resetBtn0;
output wire	LED0;
output wire	LED1;

wire	[31:0] addr;
wire	bus_wr;
wire	[31:0] data;
wire	j;
wire	reset;
wire	SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
reg	DFF_inst13;
reg	DFF_inst9;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;

assign	LED0 = DFF_inst9;
assign	SYNTHESIZED_WIRE_0 = 1;




riscv32iTest	b2v_inst(
	.CLK(clk),
	.RESET(reset),
	.bus_ready(SYNTHESIZED_WIRE_0),
	.bus_rdata(SYNTHESIZED_WIRE_1),
	.bus_wr(bus_wr),
	
	.bus_addr(addr),
	.bus_wdata(data));


RAM2	b2v_inst1(
	.wren(bus_wr),
	.clock(clk),
	.data(data),
	.rdaddress(addr[11:2]),
	.wraddress(addr[11:2]),
	.q(SYNTHESIZED_WIRE_1));



CMP32	b2v_inst11(
	.A(addr),
	.B(SYNTHESIZED_WIRE_2),
	
	.E(SYNTHESIZED_WIRE_4)
	);


ConstantX	b2v_inst12(
	.DATA_OUT(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst12.const = 512;
	defparam	b2v_inst12.size = 32;


always@(posedge SYNTHESIZED_WIRE_3)
begin
	begin
	DFF_inst13 <= j;
	end
end

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_4 & bus_wr;

assign	LED1 = SYNTHESIZED_WIRE_5 & DFF_inst13;

assign	SYNTHESIZED_WIRE_5 =  ~DFF_inst9;



RisingEdgeDetector	b2v_inst3(
	.IN(resetBtn0),
	.CLK(clk),
	.OUT(reset));


ConstantX	b2v_inst4(
	.DATA_OUT(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst4.const = 516;
	defparam	b2v_inst4.size = 32;


ConstantX	b2v_inst5(
	.DATA_OUT(SYNTHESIZED_WIRE_7));
	defparam	b2v_inst5.const = 2147483647;
	defparam	b2v_inst5.size = 32;


CMP32	b2v_inst6(
	.A(SYNTHESIZED_WIRE_6),
	.B(addr),
	
	.E(SYNTHESIZED_WIRE_8)
	);


CMP32	b2v_inst7(
	.A(SYNTHESIZED_WIRE_7),
	.B(data),
	
	.E(SYNTHESIZED_WIRE_9)
	);

assign	SYNTHESIZED_WIRE_10 = SYNTHESIZED_WIRE_8 & SYNTHESIZED_WIRE_9 & bus_wr;


always@(posedge SYNTHESIZED_WIRE_10)
begin
	begin
	DFF_inst9 <= j;
	end
end

assign	j = 1;

endmodule
