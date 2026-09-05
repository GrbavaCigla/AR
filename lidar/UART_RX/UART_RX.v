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
// CREATED		"Sat Sep 05 21:59:10 2026"

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

wire	busy;
wire	busy_clear;
wire	count_done;
wire	counter_clear;
wire	falling_edge;
wire	frame_done;
wire	frame_valid;
wire	jedan;
wire	nula;
wire	[15:0] nule_16;
wire	[7:0] rx_data_ALTERA_SYNTHESIZED;
reg	rx_prev;
reg	rx_sync;
wire	rx_sync_n;
wire	sample_d0;
wire	sample_d1;
wire	sample_d2;
wire	sample_d3;
wire	sample_d4;
wire	sample_d5;
wire	sample_d6;
wire	sample_d7;
wire	sample_done;
wire	sample_start;
wire	sample_stop;
wire	start_bit_val;
wire	start_detect;
wire	start_ok;
wire	stop_bit_val;
wire	sys_reset;
wire	[11:0] time_count;
reg	DFF_inst;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[15:0] SYNTHESIZED_WIRE_2;
wire	[15:0] SYNTHESIZED_WIRE_3;
wire	[15:0] SYNTHESIZED_WIRE_4;
wire	[15:0] SYNTHESIZED_WIRE_5;
wire	[15:0] SYNTHESIZED_WIRE_6;
wire	[15:0] SYNTHESIZED_WIRE_7;
wire	[15:0] SYNTHESIZED_WIRE_8;
wire	[15:0] SYNTHESIZED_WIRE_9;
wire	[15:0] SYNTHESIZED_WIRE_10;
wire	[15:0] SYNTHESIZED_WIRE_11;
wire	[15:0] SYNTHESIZED_WIRE_12;

wire	[15:0] GDFX_TEMP_SIGNAL_0;
wire	[15:0] GDFX_TEMP_SIGNAL_1;
wire	[15:0] GDFX_TEMP_SIGNAL_2;
wire	[15:0] GDFX_TEMP_SIGNAL_3;
wire	[15:0] GDFX_TEMP_SIGNAL_4;
wire	[15:0] GDFX_TEMP_SIGNAL_5;
wire	[15:0] GDFX_TEMP_SIGNAL_6;
wire	[15:0] GDFX_TEMP_SIGNAL_7;
wire	[15:0] GDFX_TEMP_SIGNAL_8;
wire	[15:0] GDFX_TEMP_SIGNAL_9;
wire	[15:0] GDFX_TEMP_SIGNAL_10;


assign	GDFX_TEMP_SIGNAL_0 = {nule_16[3:0],time_count[11:0]};
assign	GDFX_TEMP_SIGNAL_1 = {nule_16[3:0],time_count[11:0]};
assign	GDFX_TEMP_SIGNAL_2 = {nule_16[3:0],time_count[11:0]};
assign	GDFX_TEMP_SIGNAL_3 = {nule_16[3:0],time_count[11:0]};
assign	GDFX_TEMP_SIGNAL_4 = {nule_16[3:0],time_count[11:0]};
assign	GDFX_TEMP_SIGNAL_5 = {nule_16[3:0],time_count[11:0]};
assign	GDFX_TEMP_SIGNAL_6 = {nule_16[3:0],time_count[11:0]};
assign	GDFX_TEMP_SIGNAL_7 = {nule_16[3:0],time_count[11:0]};
assign	GDFX_TEMP_SIGNAL_8 = {nule_16[3:0],time_count[11:0]};
assign	GDFX_TEMP_SIGNAL_9 = {nule_16[3:0],time_count[11:0]};
assign	GDFX_TEMP_SIGNAL_10 = {nule_16[3:0],time_count[11:0]};


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

assign	start_detect = falling_edge & SYNTHESIZED_WIRE_0;


REG1_LD_CL	b2v_inst12(
	.LD(start_detect),
	.I(jedan),
	.CL(SYNTHESIZED_WIRE_1),
	.clk(clk),
	.A(busy));

assign	counter_clear = start_detect | frame_done | sys_reset;


CMP16	b2v_inst16(
	.A(GDFX_TEMP_SIGNAL_0),
	.B(SYNTHESIZED_WIRE_2),
	
	.E(sample_start)
	);


ConstantX	b2v_inst17(
	.DATA_OUT(nule_16));
	defparam	b2v_inst17.const = 0;
	defparam	b2v_inst17.size = 16;


ConstantX	b2v_inst18(
	.DATA_OUT(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst18.const = 108;
	defparam	b2v_inst18.size = 16;


CMP16	b2v_inst19(
	.A(GDFX_TEMP_SIGNAL_1),
	.B(SYNTHESIZED_WIRE_3),
	
	.E(sample_d0)
	);


ConstantX	b2v_inst20(
	.DATA_OUT(SYNTHESIZED_WIRE_3));
	defparam	b2v_inst20.const = 325;
	defparam	b2v_inst20.size = 16;


CMP16	b2v_inst21(
	.A(GDFX_TEMP_SIGNAL_2),
	.B(SYNTHESIZED_WIRE_4),
	
	.E(sample_d1)
	);


ConstantX	b2v_inst22(
	.DATA_OUT(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst22.const = 542;
	defparam	b2v_inst22.size = 16;


CMP16	b2v_inst23(
	.A(GDFX_TEMP_SIGNAL_3),
	.B(SYNTHESIZED_WIRE_5),
	
	.E(sample_d2)
	);


ConstantX	b2v_inst24(
	.DATA_OUT(SYNTHESIZED_WIRE_5));
	defparam	b2v_inst24.const = 759;
	defparam	b2v_inst24.size = 16;


CMP16	b2v_inst25(
	.A(GDFX_TEMP_SIGNAL_4),
	.B(SYNTHESIZED_WIRE_6),
	
	.E(sample_d3)
	);


ConstantX	b2v_inst26(
	.DATA_OUT(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst26.const = 976;
	defparam	b2v_inst26.size = 16;


CMP16	b2v_inst27(
	.A(GDFX_TEMP_SIGNAL_5),
	.B(SYNTHESIZED_WIRE_7),
	
	.E(sample_d4)
	);


ConstantX	b2v_inst28(
	.DATA_OUT(SYNTHESIZED_WIRE_7));
	defparam	b2v_inst28.const = 1193;
	defparam	b2v_inst28.size = 16;


CMP16	b2v_inst29(
	.A(GDFX_TEMP_SIGNAL_6),
	.B(SYNTHESIZED_WIRE_8),
	
	.E(sample_d5)
	);


counter_12bit	b2v_inst3(
	.sclr(counter_clear),
	.clock(clk),
	.cnt_en(busy),
	.q(time_count));


ConstantX	b2v_inst30(
	.DATA_OUT(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst30.const = 1410;
	defparam	b2v_inst30.size = 16;


CMP16	b2v_inst31(
	.A(GDFX_TEMP_SIGNAL_7),
	.B(SYNTHESIZED_WIRE_9),
	
	.E(sample_d6)
	);


ConstantX	b2v_inst32(
	.DATA_OUT(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst32.const = 1627;
	defparam	b2v_inst32.size = 16;


CMP16	b2v_inst33(
	.A(GDFX_TEMP_SIGNAL_8),
	.B(SYNTHESIZED_WIRE_10),
	
	.E(sample_d7)
	);


ConstantX	b2v_inst34(
	.DATA_OUT(SYNTHESIZED_WIRE_10));
	defparam	b2v_inst34.const = 1844;
	defparam	b2v_inst34.size = 16;


CMP16	b2v_inst35(
	.A(GDFX_TEMP_SIGNAL_9),
	.B(SYNTHESIZED_WIRE_11),
	
	.E(sample_stop)
	);


ConstantX	b2v_inst36(
	.DATA_OUT(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst36.const = 2061;
	defparam	b2v_inst36.size = 16;


CMP16	b2v_inst37(
	.A(GDFX_TEMP_SIGNAL_10),
	.B(SYNTHESIZED_WIRE_12),
	
	.E(sample_done)
	);


ConstantX	b2v_inst38(
	.DATA_OUT(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst38.const = 2062;
	defparam	b2v_inst38.size = 16;

assign	frame_done = busy & sample_done;



REG1_LD_CL	b2v_inst40(
	.LD(sample_start),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(start_bit_val));


REG1_LD_CL	b2v_inst41(
	.LD(sample_d0),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[0]));


REG1_LD_CL	b2v_inst42(
	.LD(sample_d1),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[1]));


REG1_LD_CL	b2v_inst43(
	.LD(sample_d2),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[2]));


REG1_LD_CL	b2v_inst44(
	.LD(sample_d3),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[3]));


REG1_LD_CL	b2v_inst45(
	.LD(sample_d4),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[4]));


REG1_LD_CL	b2v_inst46(
	.LD(sample_d5),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[5]));


REG1_LD_CL	b2v_inst47(
	.LD(sample_d6),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[6]));


REG1_LD_CL	b2v_inst48(
	.LD(sample_d7),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(rx_data_ALTERA_SYNTHESIZED[7]));


REG1_LD_CL	b2v_inst49(
	.LD(sample_stop),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk),
	.A(stop_bit_val));

assign	start_ok =  ~start_bit_val;

assign	byte_ready = frame_done & frame_valid;

assign	SYNTHESIZED_WIRE_0 =  ~busy;

assign	sys_reset =  ~rst_n;

assign	SYNTHESIZED_WIRE_1 = frame_done | sys_reset;

assign	frame_valid = start_ok & stop_bit_val;


REG1_LD_CL	b2v_inst56(
	.LD(sample_done),
	.I(rx_sync),
	.CL(sys_reset),
	.clk(clk)
	);




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
