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
// CREATED		"Wed Aug 26 18:45:21 2026"

module LidarInterface(
	clk,
	rst_n,
	rx,
	pixel_valid,
	x_pixel,
	y_pixel
);


input wire	clk;
input wire	rst_n;
input wire	rx;
output wire	pixel_valid;
output wire	[15:0] x_pixel;
output wire	[15:0] y_pixel;

wire	ack;
wire	busy;
wire	busy_clear;
wire	cnt_en;
wire	data_ready;
wire	[15:0] end_angle;
wire	is_last;
wire	jedan;
wire	n_busy;
wire	n_is_last;
wire	nula;
wire	[3:0] point_index;
wire	[7:0] q;
wire	sclr;
wire	[15:0] start_angle;
wire	sys_reset;
wire	[15:0] SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;
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

wire	[3:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_0 = {jedan,nula,jedan,jedan};


anglegenerator	b2v_inst(
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


CalculateXY	b2v_inst1(
	.clk(clk),
	.angle(SYNTHESIZED_WIRE_0),
	.distance(SYNTHESIZED_WIRE_1),
	.x_pixel(x_pixel),
	.y_pixel(y_pixel));


REG1_LD_CL	b2v_inst12(
	.LD(data_ready),
	.I(jedan),
	.CL(busy_clear),
	.clk(clk),
	.A(busy));



assign	busy_clear = sys_reset | ack;

assign	point_index = q[3:0];


assign	sclr = sys_reset | n_busy;

assign	n_busy =  ~busy;

assign	n_is_last =  ~is_last;

assign	cnt_en = n_is_last & busy;


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
	.A(ack));


REG1_LD_CL	b2v_inst22(
	.LD(jedan),
	.I(busy),
	.CL(sys_reset),
	.clk(clk),
	.A(pixel_valid));


PacketParser	b2v_inst3(
	.clk(clk),
	.rst_n(rst_n),
	.byte_ready(SYNTHESIZED_WIRE_2),
	.ack(ack),
	.rx_data(SYNTHESIZED_WIRE_3),
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
	.result(SYNTHESIZED_WIRE_1));


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
	.result(SYNTHESIZED_WIRE_0));


UART_RX	b2v_inst6(
	.clk(clk),
	.rst_n(rst_n),
	.rx(rx),
	.byte_ready(SYNTHESIZED_WIRE_2),
	.rx_data(SYNTHESIZED_WIRE_3));


counter_8bit	b2v_inst7(
	.sclr(sclr),
	.clock(clk),
	.cnt_en(cnt_en),
	.q(q));

assign	sys_reset =  ~rst_n;

assign	jedan = 1;
assign	nula = 0;

endmodule
