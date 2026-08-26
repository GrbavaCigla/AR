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
// CREATED		"Wed Aug 26 18:45:53 2026"

module UART_RX(
	clk,
	rx,
	rst_n,
	byte_ready,
	rx_data
);


input wire	clk;
input wire	rx;
input wire	rst_n;
output wire	byte_ready;
output wire	[7:0] rx_data;

wire	baud_tick;
wire	[7:0] bit_pos;
wire	busy;
wire	clr_baud;
wire	d0;
wire	d1;
wire	d2;
wire	d3;
wire	d4;
wire	d5;
wire	d6;
wire	d7;
wire	falling_edge;
wire	frame_done;
wire	frame_valid;
wire	jedan;
wire	m_startb;
wire	m_stopb;
wire	nula;
wire	[7:0] rx_data_ALTERA_SYNTHESIZED;
reg	rx_prev;
reg	rx_sync;
wire	rx_sync_n;
wire	start_bit_val;
wire	start_detact;
wire	start_ok;
wire	stop_bit_val;
wire	sys_reset;
reg	DFF_inst;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_5;
wire	[7:0] SYNTHESIZED_WIRE_6;
wire	[7:0] SYNTHESIZED_WIRE_7;
wire	[7:0] SYNTHESIZED_WIRE_8;
wire	[7:0] SYNTHESIZED_WIRE_9;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	[7:0] SYNTHESIZED_WIRE_11;
wire	[7:0] SYNTHESIZED_WIRE_12;
wire	[7:0] SYNTHESIZED_WIRE_13;
wire	[7:0] SYNTHESIZED_WIRE_14;
wire	[3:0] SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;

wire	[3:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_0 = {jedan,jedan,nula,jedan};


always@(posedge clk)
begin
	begin
	DFF_inst <= rx;
	end
end


always@(posedge clk)
begin
	begin
	rx_sync <= DFF_inst;
	end
end

assign	falling_edge = rx_sync_n & rx_prev;

assign	start_detact = falling_edge & SYNTHESIZED_WIRE_0;


REG1_LD_CL	b2v_inst12(
	.LD(start_detact),
	.I(jedan),
	.CL(SYNTHESIZED_WIRE_1),
	.clk(clk),
	.A(busy));


counter_8bit	b2v_inst14(
	.sclr(SYNTHESIZED_WIRE_2),
	.clock(clk),
	.cnt_en(SYNTHESIZED_WIRE_3),
	.q(bit_pos));

assign	SYNTHESIZED_WIRE_3 = busy & baud_tick;

assign	SYNTHESIZED_WIRE_16 =  ~busy;


CMP8	b2v_inst17(
	.A(bit_pos),
	.B(SYNTHESIZED_WIRE_4),
	
	.E(m_startb)
	);


ConstantX	b2v_inst18(
	.DATA_OUT(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst18.const = 8;
	defparam	b2v_inst18.size = 8;


CMP8	b2v_inst19(
	.A(bit_pos),
	.B(SYNTHESIZED_WIRE_5),
	
	.E(d0)
	);


BAUD_GENERATOR	b2v_inst2(
	.sclr(clr_baud),
	.clock(clk),
	.cnt_en(jedan),
	.q(SYNTHESIZED_WIRE_15));


ConstantX	b2v_inst20(
	.DATA_OUT(SYNTHESIZED_WIRE_5));
	defparam	b2v_inst20.const = 24;
	defparam	b2v_inst20.size = 8;


CMP8	b2v_inst21(
	.A(bit_pos),
	.B(SYNTHESIZED_WIRE_6),
	
	.E(d1)
	);


ConstantX	b2v_inst22(
	.DATA_OUT(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst22.const = 40;
	defparam	b2v_inst22.size = 8;


CMP8	b2v_inst23(
	.A(bit_pos),
	.B(SYNTHESIZED_WIRE_7),
	
	.E(d2)
	);


ConstantX	b2v_inst24(
	.DATA_OUT(SYNTHESIZED_WIRE_7));
	defparam	b2v_inst24.const = 56;
	defparam	b2v_inst24.size = 8;


CMP8	b2v_inst25(
	.A(bit_pos),
	.B(SYNTHESIZED_WIRE_8),
	
	.E(d3)
	);


ConstantX	b2v_inst26(
	.DATA_OUT(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst26.const = 72;
	defparam	b2v_inst26.size = 8;


CMP8	b2v_inst27(
	.A(bit_pos),
	.B(SYNTHESIZED_WIRE_9),
	
	.E(d4)
	);


ConstantX	b2v_inst28(
	.DATA_OUT(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst28.const = 88;
	defparam	b2v_inst28.size = 8;


CMP8	b2v_inst29(
	.A(bit_pos),
	.B(SYNTHESIZED_WIRE_10),
	
	.E(d5)
	);


ConstantX	b2v_inst30(
	.DATA_OUT(SYNTHESIZED_WIRE_10));
	defparam	b2v_inst30.const = 104;
	defparam	b2v_inst30.size = 8;


CMP8	b2v_inst31(
	.A(bit_pos),
	.B(SYNTHESIZED_WIRE_11),
	
	.E(d6)
	);


ConstantX	b2v_inst32(
	.DATA_OUT(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst32.const = 120;
	defparam	b2v_inst32.size = 8;


CMP8	b2v_inst33(
	.A(bit_pos),
	.B(SYNTHESIZED_WIRE_12),
	
	.E(d7)
	);


ConstantX	b2v_inst34(
	.DATA_OUT(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst34.const = 136;
	defparam	b2v_inst34.size = 8;


CMP8	b2v_inst35(
	.A(bit_pos),
	.B(SYNTHESIZED_WIRE_13),
	
	.E(m_stopb)
	);


ConstantX	b2v_inst36(
	.DATA_OUT(SYNTHESIZED_WIRE_13));
	defparam	b2v_inst36.const = 152;
	defparam	b2v_inst36.size = 8;


REG1_LD_CL	b2v_inst37(
	.LD(m_startb),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(start_bit_val));


REG1_LD_CL	b2v_inst38(
	.LD(d0),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[0]));


REG1_LD_CL	b2v_inst39(
	.LD(d1),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[1]));


REG1_LD_CL	b2v_inst40(
	.LD(d2),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[2]));


REG1_LD_CL	b2v_inst41(
	.LD(d3),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[3]));


REG1_LD_CL	b2v_inst42(
	.LD(d4),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[4]));


REG1_LD_CL	b2v_inst43(
	.LD(d5),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[5]));


REG1_LD_CL	b2v_inst44(
	.LD(d6),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[6]));


REG1_LD_CL	b2v_inst45(
	.LD(d7),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[7]));


REG1_LD_CL	b2v_inst46(
	.LD(m_stopb),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(stop_bit_val));

assign	start_ok =  ~start_bit_val;

assign	frame_valid = start_ok & stop_bit_val;


CMP8	b2v_inst49(
	.A(bit_pos),
	.B(SYNTHESIZED_WIRE_14),
	
	.E(frame_done)
	);


CMP4	b2v_inst5(
	.A(SYNTHESIZED_WIRE_15),
	.B(GDFX_TEMP_SIGNAL_0),
	
	.E(baud_tick)
	);


ConstantX	b2v_inst50(
	.DATA_OUT(SYNTHESIZED_WIRE_14));
	defparam	b2v_inst50.const = 159;
	defparam	b2v_inst50.size = 8;

assign	byte_ready = frame_done & frame_valid;

assign	SYNTHESIZED_WIRE_0 =  ~busy;

assign	sys_reset =  ~rst_n;

assign	SYNTHESIZED_WIRE_1 = frame_done | sys_reset;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_16 | sys_reset;

assign	clr_baud = sys_reset | baud_tick;




always@(posedge clk)
begin
	begin
	rx_prev <= rx_sync;
	end
end

assign	rx_sync_n =  ~rx_sync;

assign	rx_data = rx_data_ALTERA_SYNTHESIZED;
assign	jedan = 1;
assign	nula = 0;

endmodule
