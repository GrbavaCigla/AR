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
// CREATED		"Sat Sep 05 21:59:25 2026"

module LidarInterface2(
	clk,
	rst_n,
	rx,
	cs_lidar,
	lidar_ready,
	lidar_data
);


input wire	clk;
input wire	rst_n;
input wire	rx;
input wire	cs_lidar;
output wire	lidar_ready;
output wire	[31:0] lidar_data;

wire	angle_went_down;
wire	burst_done;
wire	busy;
wire	busy_clear;
wire	cnt_en;
wire	data_ready;
wire	[15:0] end_angle;
wire	first_packet;
wire	is_last;
wire	jedan;
wire	[15:0] latest_x;
wire	[15:0] latest_y;
wire	n_busy;
wire	n_is_last;
wire	new_revolution;
wire	nula;
wire	[10:0] nule_11;
wire	packet_accepted;
wire	[15:0] packet_base_seq;
wire	[15:0] packet_base_seq_next;
wire	[15:0] packet_base_seq_plus_twelve;
wire	pixel_valid;
wire	pixel_valid_cl;
wire	[3:0] point_index;
wire	[15:0] point_seq;
wire	[15:0] prev_start_angle;
wire	[7:0] q;
wire	sclr;
wire	seen_packet_reg;
wire	[15:0] seq_cur;
wire	[15:0] start_angle;
wire	sys_reset;
wire	[15:0] twelve;
wire	valid_reg;
wire	[15:0] x_pixel;
wire	[15:0] y_pixel;
wire	[15:0] zero;
wire	SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;
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
wire	[15:0] SYNTHESIZED_WIRE_13;
wire	[15:0] SYNTHESIZED_WIRE_14;
wire	[15:0] SYNTHESIZED_WIRE_15;
wire	[15:0] SYNTHESIZED_WIRE_16;
wire	[15:0] SYNTHESIZED_WIRE_17;
wire	[15:0] SYNTHESIZED_WIRE_18;
wire	[15:0] SYNTHESIZED_WIRE_19;
wire	[15:0] SYNTHESIZED_WIRE_20;
wire	[15:0] SYNTHESIZED_WIRE_21;
wire	[15:0] SYNTHESIZED_WIRE_22;
wire	[15:0] SYNTHESIZED_WIRE_23;
wire	[15:0] SYNTHESIZED_WIRE_24;
wire	[15:0] SYNTHESIZED_WIRE_25;
wire	[15:0] SYNTHESIZED_WIRE_26;
wire	[15:0] SYNTHESIZED_WIRE_27;
wire	[10:0] SYNTHESIZED_WIRE_28;

assign	lidar_ready = cs_lidar;
wire	[15:0] GDFX_TEMP_SIGNAL_1;
wire	[3:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_1 = {zero[11:0],point_index[3:0]};
assign	GDFX_TEMP_SIGNAL_0 = {jedan,nula,jedan,jedan};


AngleGenerator	b2v_inst(
	.end_angle(end_angle),
	.start_angle(start_angle),
	.angle_p0(SYNTHESIZED_WIRE_16),
	.angle_p1(SYNTHESIZED_WIRE_19),
	.angle_p1_0(SYNTHESIZED_WIRE_17),
	.angle_p1_1(SYNTHESIZED_WIRE_18),
	.angle_p2(SYNTHESIZED_WIRE_20),
	.angle_p3(SYNTHESIZED_WIRE_21),
	.angle_p4(SYNTHESIZED_WIRE_22),
	.angle_p5(SYNTHESIZED_WIRE_23),
	.angle_p6(SYNTHESIZED_WIRE_24),
	.angle_p7(SYNTHESIZED_WIRE_25),
	.angle_p8(SYNTHESIZED_WIRE_26),
	.angle_p9(SYNTHESIZED_WIRE_27));

assign	packet_accepted = data_ready & n_busy;


ConstantX	b2v_inst10(
	.DATA_OUT(SYNTHESIZED_WIRE_28));
	defparam	b2v_inst10.const = 0;
	defparam	b2v_inst10.size = 11;



REG1_LD_CL	b2v_inst12(
	.LD(data_ready),
	.I(jedan),
	.CL(busy_clear),
	.clk(clk),
	.A(busy));



assign	busy_clear = sys_reset | burst_done;

assign	point_index = q[3:0];


assign	sclr = sys_reset | n_busy;

assign	n_busy =  ~busy;

assign	n_is_last =  ~is_last;

assign	cnt_en = n_is_last & pixel_valid;


CMP4	b2v_inst20(
	.A(point_index),
	.B(GDFX_TEMP_SIGNAL_0),
	
	.E(is_last)
	);


REG1_LD_CL	b2v_inst21(
	.LD(jedan),
	.I(is_last),
	.CL(sys_reset),
	.clk(clk),
	.A(burst_done));


REG1_LD_CL	b2v_inst22(
	.LD(jedan),
	.I(busy),
	.CL(busy_clear),
	.clk(clk),
	.A(pixel_valid));


REG16_LD_CL	b2v_inst23(
	.LD(pixel_valid),
	.CL(sys_reset),
	.clk(clk),
	.I(y_pixel),
	.A(latest_y));


REG1_LD_CL	b2v_inst24(
	.LD(packet_accepted),
	.I(jedan),
	.CL(sys_reset),
	.clk(clk),
	.A(seen_packet_reg));


REG16_LD_CL	b2v_inst25(
	.LD(packet_accepted),
	.CL(sys_reset),
	.clk(clk),
	.I(start_angle),
	.A(prev_start_angle));


CMP16	b2v_inst26(
	.A(start_angle),
	.B(prev_start_angle),
	
	
	.L(angle_went_down));

assign	new_revolution = angle_went_down | first_packet;


ConstantX	b2v_inst28(
	.DATA_OUT(twelve));
	defparam	b2v_inst28.const = 12;
	defparam	b2v_inst28.size = 16;


ADD16	b2v_inst29(
	.C_0(nula),
	.A(packet_base_seq),
	.B(twelve),
	
	.OUT(packet_base_seq_plus_twelve));


PacketParser	b2v_inst3(
	.clk(clk),
	.rst_n(rst_n),
	.byte_ready(SYNTHESIZED_WIRE_0),
	.ack(burst_done),
	.rx_data(SYNTHESIZED_WIRE_1),
	.data_ready(data_ready),
	.end_angle(end_angle),
	.point0_dist(SYNTHESIZED_WIRE_4),
	
	.point10_dist(SYNTHESIZED_WIRE_5),
	
	.point11_dist(SYNTHESIZED_WIRE_6),
	
	.point1_dist(SYNTHESIZED_WIRE_7),
	
	.point2_dist(SYNTHESIZED_WIRE_8),
	
	.point3_dist(SYNTHESIZED_WIRE_9),
	
	.point4_dist(SYNTHESIZED_WIRE_10),
	
	.point5_dist(SYNTHESIZED_WIRE_11),
	
	.point6_dist(SYNTHESIZED_WIRE_12),
	
	.point7_dist(SYNTHESIZED_WIRE_13),
	
	.point8_dist(SYNTHESIZED_WIRE_14),
	
	.point9_dist(SYNTHESIZED_WIRE_15),
	
	
	.start_angle(start_angle)
	);


ConstantX	b2v_inst30(
	.DATA_OUT(zero));
	defparam	b2v_inst30.const = 0;
	defparam	b2v_inst30.size = 16;


MPX2_16BIT	b2v_inst31(
	.S(new_revolution),
	.E(jedan),
	.I0(packet_base_seq_plus_twelve),
	.I1(zero),
	.D(packet_base_seq_next));


REG16_LD_CL	b2v_inst32(
	.LD(packet_accepted),
	.CL(sys_reset),
	.clk(clk),
	.I(packet_base_seq_next),
	.A(packet_base_seq));


ADD16	b2v_inst33(
	.C_0(nula),
	.A(packet_base_seq),
	.B(GDFX_TEMP_SIGNAL_1),
	
	.OUT(point_seq));


REG16_LD_CL	b2v_inst34(
	.LD(pixel_valid),
	.CL(sys_reset),
	.clk(clk),
	.I(point_seq),
	.A(seq_cur));


REG1_LD_CL	b2v_inst35(
	.LD(pixel_valid),
	.I(jedan),
	.CL(sys_reset),
	.clk(clk),
	.A(valid_reg));

assign	first_packet =  ~seen_packet_reg;


CalculateXY2	b2v_inst37(
	.clk(clk),
	.angle(SYNTHESIZED_WIRE_2),
	.distance(SYNTHESIZED_WIRE_3),
	.x_pixel(x_pixel),
	.y_pixel(y_pixel));


MPX12_16BIT	b2v_inst4(
	.data0x(SYNTHESIZED_WIRE_4),
	.data10x(SYNTHESIZED_WIRE_5),
	.data11x(SYNTHESIZED_WIRE_6),
	.data1x(SYNTHESIZED_WIRE_7),
	.data2x(SYNTHESIZED_WIRE_8),
	.data3x(SYNTHESIZED_WIRE_9),
	.data4x(SYNTHESIZED_WIRE_10),
	.data5x(SYNTHESIZED_WIRE_11),
	.data6x(SYNTHESIZED_WIRE_12),
	.data7x(SYNTHESIZED_WIRE_13),
	.data8x(SYNTHESIZED_WIRE_14),
	.data9x(SYNTHESIZED_WIRE_15),
	.sel(point_index),
	.result(SYNTHESIZED_WIRE_3));


MPX12_16BIT	b2v_inst5(
	.data0x(SYNTHESIZED_WIRE_16),
	.data10x(SYNTHESIZED_WIRE_17),
	.data11x(SYNTHESIZED_WIRE_18),
	.data1x(SYNTHESIZED_WIRE_19),
	.data2x(SYNTHESIZED_WIRE_20),
	.data3x(SYNTHESIZED_WIRE_21),
	.data4x(SYNTHESIZED_WIRE_22),
	.data5x(SYNTHESIZED_WIRE_23),
	.data6x(SYNTHESIZED_WIRE_24),
	.data7x(SYNTHESIZED_WIRE_25),
	.data8x(SYNTHESIZED_WIRE_26),
	.data9x(SYNTHESIZED_WIRE_27),
	.sel(point_index),
	.result(SYNTHESIZED_WIRE_2));


UART_RX	b2v_inst6(
	.clk(clk),
	.rst_n(rst_n),
	.rx(rx),
	.byte_ready(SYNTHESIZED_WIRE_0),
	.rx_data(SYNTHESIZED_WIRE_1));


counter_8bit	b2v_inst7(
	.sclr(sclr),
	.clock(clk),
	.cnt_en(cnt_en),
	.q(q));


assign	sys_reset =  ~rst_n;


REG16_LD_CL	b2v_inst99(
	.LD(pixel_valid),
	.CL(sys_reset),
	.clk(clk),
	.I(x_pixel),
	.A(latest_x));

assign	lidar_data[31] = valid_reg;
assign	lidar_data[30] = nula;
assign	lidar_data[29:20] = seq_cur[9:0];
assign	lidar_data[19:10] = latest_x[9:0];
assign	lidar_data[9:0] = latest_y[9:0];
assign	jedan = 1;
assign	nula = 0;

endmodule
