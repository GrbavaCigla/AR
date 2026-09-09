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
// CREATED		"Fri Aug 21 23:15:34 2026"

module LidarBusInterface(
	rx,
	clk,
	rst_n,
	cs_lidar,
	bus_addr,
	lidar_ready,
	dbus_lidar_rd
);


input wire	rx;
input wire	clk;
input wire	rst_n;
input wire	cs_lidar;
input wire	[31:0] bus_addr;
output wire	lidar_ready;
output wire	[31:0] dbus_lidar_rd;

wire	[511:0] data;
wire	[63:0] nula;
wire	[15:0] result_data;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_2 = 0;




CMP32	b2v_inst(
	.A(SYNTHESIZED_WIRE_0),
	.B(bus_addr),
	.G(SYNTHESIZED_WIRE_6)
	
	);


UART_RX	b2v_inst1(
	.clk(clk),
	.rst_n(rst_n),
	.rx(rx),
	.byte_ready(SYNTHESIZED_WIRE_1),
	.rx_data(SYNTHESIZED_WIRE_3));


ConstantX	b2v_inst11(
	.DATA_OUT(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst11.const = 268435456;
	defparam	b2v_inst11.size = 32;


PacketParser	b2v_inst2(
	.clk(clk),
	.rst_n(rst_n),
	.byte_ready(SYNTHESIZED_WIRE_1),
	.ack(SYNTHESIZED_WIRE_2),
	.rx_data(SYNTHESIZED_WIRE_3),
	.data_ready(data[0]),
	.end_angle(data[63:48]),
	.point0_dist(data[95:80]),
	.point0_int(data[111:96]),
	.point10_dist(data[415:400]),
	.point10_inst(data[431:416]),
	.point11_dist(data[447:432]),
	.point11_inst(data[463:448]),
	.point1_dist(data[127:112]),
	.point1_int(data[143:128]),
	.point2_dist(data[159:144]),
	.point2_inst(data[175:160]),
	.point3_dist(data[191:176]),
	.point3_inst(data[207:192]),
	.point4_dist(data[223:208]),
	.point4_inst(data[239:224]),
	.point5_dist(data[255:240]),
	.point5_inst(data[271:256]),
	.point6_dist(data[287:272]),
	.point6_inst(data[303:288]),
	.point7_dist(data[319:304]),
	.point7_inst(data[335:320]),
	.point8_dist(data[351:336]),
	.point8_inst(data[367:352]),
	.point9_dist(data[383:368]),
	.point9_inst(data[399:384]),
	.speed(data[31:16]),
	.start_angle(data[47:32]),
	.timestamp(data[79:64]));


CMP32	b2v_inst3(
	.A(bus_addr),
	.B(SYNTHESIZED_WIRE_4),
	.G(SYNTHESIZED_WIRE_5)
	
	);


ConstantX	b2v_inst4(
	.DATA_OUT(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst4.const = 268435568;
	defparam	b2v_inst4.size = 32;


ConstantX	b2v_inst44(
	.DATA_OUT(nula));
	defparam	b2v_inst44.const = 0;
	defparam	b2v_inst44.size = 64;


MUX16	b2v_inst5(
	.data(data),
	.sel(bus_addr[6:2]),
	.result(result_data));

assign	SYNTHESIZED_WIRE_7 =  ~SYNTHESIZED_WIRE_5;

assign	lidar_ready = SYNTHESIZED_WIRE_6 & cs_lidar & SYNTHESIZED_WIRE_7;


assign	dbus_lidar_rd[31:16] = nula[15:0];
assign	dbus_lidar_rd[15:0] = result_data;

endmodule
