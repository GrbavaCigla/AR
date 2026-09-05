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
// CREATED		"Sat Sep 05 21:59:16 2026"

module PacketParser(
	clk,
	rst_n,
	byte_ready,
	ack,
	rx_data,
	data_ready,
	end_angle,
	point0_dist,
	point0_int,
	point10_dist,
	point10_int,
	point11_dist,
	point11_int,
	point1_dist,
	point1_int,
	point2_dist,
	point2_int,
	point3_dist,
	point3_int,
	point4_dist,
	point4_int,
	point5_dist,
	point5_int,
	point6_dist,
	point6_int,
	point7_dist,
	point7_int,
	point8_dist,
	point8_int,
	point9_dist,
	point9_int,
	speed,
	start_angle,
	timestamp
);


input wire	clk;
input wire	rst_n;
input wire	byte_ready;
input wire	ack;
input wire	[7:0] rx_data;
output wire	data_ready;
output wire	[15:0] end_angle;
output wire	[15:0] point0_dist;
output wire	[15:0] point0_int;
output wire	[15:0] point10_dist;
output wire	[15:0] point10_int;
output wire	[15:0] point11_dist;
output wire	[15:0] point11_int;
output wire	[15:0] point1_dist;
output wire	[15:0] point1_int;
output wire	[15:0] point2_dist;
output wire	[15:0] point2_int;
output wire	[15:0] point3_dist;
output wire	[15:0] point3_int;
output wire	[15:0] point4_dist;
output wire	[15:0] point4_int;
output wire	[15:0] point5_dist;
output wire	[15:0] point5_int;
output wire	[15:0] point6_dist;
output wire	[15:0] point6_int;
output wire	[15:0] point7_dist;
output wire	[15:0] point7_int;
output wire	[15:0] point8_dist;
output wire	[15:0] point8_int;
output wire	[15:0] point9_dist;
output wire	[15:0] point9_int;
output wire	[15:0] speed;
output wire	[15:0] start_angle;
output wire	[15:0] timestamp;

wire	[7:0] byte_pos;
wire	data_ready_ALTERA_SYNTHESIZED;
wire	[15:0] end_angle_ALTERA_SYNTHESIZED;
wire	endangle_end;
wire	header_match;
wire	in_packet;
wire	jedan;
wire	p0_dist;
wire	p0_int;
wire	p10_dist;
wire	p10_int;
wire	p11_dist;
wire	p11_int;
wire	p1_dist;
wire	p1_int;
wire	p2_dist;
wire	p2_int;
wire	p3_dist;
wire	p3_int;
wire	p4_dist;
wire	p4_int;
wire	p5_dist;
wire	p5_int;
wire	p6_dist;
wire	p6_int;
wire	p7_dist;
wire	p7_int;
wire	p8_dist;
wire	p8_int;
wire	p9_dist;
wire	p9_int;
wire	pkt_done;
wire	pkt_start;
wire	[15:0] point0_dist_ALTERA_SYNTHESIZED;
wire	[15:0] point0_int_ALTERA_SYNTHESIZED;
wire	[15:0] point10_dist_ALTERA_SYNTHESIZED;
wire	[15:0] point10_int_ALTERA_SYNTHESIZED;
wire	[15:0] point11_dist_ALTERA_SYNTHESIZED;
wire	[15:0] point11_int_ALTERA_SYNTHESIZED;
wire	[15:0] point1_dist_ALTERA_SYNTHESIZED;
wire	[15:0] point1_int_ALTERA_SYNTHESIZED;
wire	[15:0] point2_dist_ALTERA_SYNTHESIZED;
wire	[15:0] point2_int_ALTERA_SYNTHESIZED;
wire	[15:0] point3_dist_ALTERA_SYNTHESIZED;
wire	[15:0] point3_int_ALTERA_SYNTHESIZED;
wire	[15:0] point4_dist_ALTERA_SYNTHESIZED;
wire	[15:0] point4_int_ALTERA_SYNTHESIZED;
wire	[15:0] point5_dist_ALTERA_SYNTHESIZED;
wire	[15:0] point5_int_ALTERA_SYNTHESIZED;
wire	[15:0] point6_dist_ALTERA_SYNTHESIZED;
wire	[15:0] point6_int_ALTERA_SYNTHESIZED;
wire	[15:0] point7_dist_ALTERA_SYNTHESIZED;
wire	[15:0] point7_int_ALTERA_SYNTHESIZED;
wire	[15:0] point8_dist_ALTERA_SYNTHESIZED;
wire	[15:0] point8_int_ALTERA_SYNTHESIZED;
wire	[15:0] point9_dist_ALTERA_SYNTHESIZED;
wire	[15:0] point9_int_ALTERA_SYNTHESIZED;
wire	[15:0] prev_byte;
wire	[15:0] prev_byte_le;
wire	[15:0] speed_ALTERA_SYNTHESIZED;
wire	speed_end;
wire	[15:0] start_angle_ALTERA_SYNTHESIZED;
wire	startangle_end;
wire	sys_reset;
wire	[15:0] timestamp_ALTERA_SYNTHESIZED;
wire	timestamp_end;
wire	verlen_fail;
wire	verlen_match;
wire	[7:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[7:0] SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[7:0] SYNTHESIZED_WIRE_8;
wire	[7:0] SYNTHESIZED_WIRE_9;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	[7:0] SYNTHESIZED_WIRE_11;
wire	[7:0] SYNTHESIZED_WIRE_12;
wire	[7:0] SYNTHESIZED_WIRE_13;
wire	[7:0] SYNTHESIZED_WIRE_14;
wire	[7:0] SYNTHESIZED_WIRE_15;
wire	[7:0] SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	[7:0] SYNTHESIZED_WIRE_18;
wire	[7:0] SYNTHESIZED_WIRE_19;
wire	[7:0] SYNTHESIZED_WIRE_20;
wire	[7:0] SYNTHESIZED_WIRE_21;
wire	[7:0] SYNTHESIZED_WIRE_22;
wire	[7:0] SYNTHESIZED_WIRE_23;
wire	[7:0] SYNTHESIZED_WIRE_24;
wire	[7:0] SYNTHESIZED_WIRE_25;
wire	[7:0] SYNTHESIZED_WIRE_26;
wire	[7:0] SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	[7:0] SYNTHESIZED_WIRE_30;
wire	[7:0] SYNTHESIZED_WIRE_31;
wire	[7:0] SYNTHESIZED_WIRE_32;
wire	[7:0] SYNTHESIZED_WIRE_33;
wire	[7:0] SYNTHESIZED_WIRE_34;
wire	[7:0] SYNTHESIZED_WIRE_35;
wire	[7:0] SYNTHESIZED_WIRE_36;
wire	[7:0] SYNTHESIZED_WIRE_37;
wire	[7:0] SYNTHESIZED_WIRE_38;
wire	[7:0] SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	[7:0] SYNTHESIZED_WIRE_41;




assign	SYNTHESIZED_WIRE_40 = verlen_fail | sys_reset | pkt_done;

assign	sys_reset =  ~rst_n;


CMP8	b2v_inst10(
	.A(rx_data),
	.B(SYNTHESIZED_WIRE_0),
	
	.E(verlen_match)
	);


REG8_LD_CL	b2v_inst100(
	.LD(p3_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point3_int_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst101(
	.LD(p3_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point3_int_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst102(
	.LD(p4_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point4_dist_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst103(
	.LD(p4_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point4_dist_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst104(
	.LD(p4_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point4_int_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst105(
	.LD(p4_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point4_int_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst106(
	.LD(p5_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point5_dist_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst107(
	.LD(p5_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point5_dist_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst108(
	.LD(p5_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point5_int_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst109(
	.LD(p5_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point5_int_ALTERA_SYNTHESIZED[7:0]));


ConstantX	b2v_inst11(
	.DATA_OUT(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst11.const = 44;
	defparam	b2v_inst11.size = 8;


REG8_LD_CL	b2v_inst110(
	.LD(p6_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point6_dist_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst111(
	.LD(p6_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point6_dist_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst112(
	.LD(p6_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point6_int_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst113(
	.LD(p6_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point6_int_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst114(
	.LD(p7_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point7_dist_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst115(
	.LD(p7_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point7_dist_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst116(
	.LD(p7_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point7_int_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst117(
	.LD(p7_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point7_int_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst118(
	.LD(p8_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point8_dist_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst119(
	.LD(p8_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point8_dist_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst120(
	.LD(p8_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point8_int_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst121(
	.LD(p8_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point8_int_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst122(
	.LD(p9_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point9_dist_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst123(
	.LD(p9_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point9_dist_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst124(
	.LD(p9_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point9_int_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst125(
	.LD(p9_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point9_int_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst126(
	.LD(p10_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point10_dist_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst127(
	.LD(p10_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point10_dist_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst128(
	.LD(p10_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point10_int_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst129(
	.LD(p10_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point10_int_ALTERA_SYNTHESIZED[7:0]));

assign	SYNTHESIZED_WIRE_2 =  ~verlen_match;


REG8_LD_CL	b2v_inst130(
	.LD(p11_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point11_dist_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst131(
	.LD(p11_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point11_dist_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst132(
	.LD(p11_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point11_int_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst133(
	.LD(p11_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point11_int_ALTERA_SYNTHESIZED[7:0]));


REG1_LD_CL	b2v_inst134(
	.LD(pkt_done),
	.I(jedan),
	.CL(SYNTHESIZED_WIRE_1),
	.clk(clk),
	.A(data_ready_ALTERA_SYNTHESIZED));

assign	SYNTHESIZED_WIRE_1 = sys_reset | ack;

assign	prev_byte[15:8] = prev_byte_le[7:0];


assign	prev_byte[7:0] = prev_byte_le[15:8];


assign	verlen_fail = SYNTHESIZED_WIRE_2 & in_packet & SYNTHESIZED_WIRE_3 & byte_ready;


REG8_LD_CL	b2v_inst14(
	.LD(speed_end),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(speed_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst15(
	.LD(speed_end),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(speed_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst16(
	.LD(startangle_end),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(start_angle_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst17(
	.LD(startangle_end),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(start_angle_ALTERA_SYNTHESIZED[7:0]));


counter_8bit	b2v_inst18(
	.sclr(SYNTHESIZED_WIRE_4),
	.clock(clk),
	.cnt_en(SYNTHESIZED_WIRE_5),
	.q(byte_pos));

assign	SYNTHESIZED_WIRE_5 = in_packet & byte_ready;


CMP8	b2v_inst2(
	.A(rx_data),
	.B(SYNTHESIZED_WIRE_6),
	
	.E(header_match)
	);

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_7 | sys_reset;


REG8_LD_CL	b2v_inst200(
	.LD(byte_ready),
	.CL(sys_reset),
	.clk(clk),
	.I(rx_data),
	.A(prev_byte_le[7:0]));


REG8_LD_CL	b2v_inst201(
	.LD(byte_ready),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte_le[7:0]),
	.A(prev_byte_le[15:8]));

assign	SYNTHESIZED_WIRE_7 =  ~in_packet;


CMP8	b2v_inst22(
	.A(SYNTHESIZED_WIRE_8),
	.B(byte_pos),
	
	.E(speed_end)
	);


ConstantX	b2v_inst23(
	.DATA_OUT(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst23.const = 3;
	defparam	b2v_inst23.size = 8;


CMP8	b2v_inst24(
	.A(byte_pos),
	.B(SYNTHESIZED_WIRE_9),
	
	.E(SYNTHESIZED_WIRE_3)
	);


ConstantX	b2v_inst25(
	.DATA_OUT(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst25.const = 0;
	defparam	b2v_inst25.size = 8;


CMP8	b2v_inst26(
	.A(SYNTHESIZED_WIRE_10),
	.B(byte_pos),
	
	.E(startangle_end)
	);


ConstantX	b2v_inst27(
	.DATA_OUT(SYNTHESIZED_WIRE_10));
	defparam	b2v_inst27.const = 5;
	defparam	b2v_inst27.size = 8;


CMP8	b2v_inst28(
	.A(SYNTHESIZED_WIRE_11),
	.B(byte_pos),
	
	.E(p0_dist)
	);


ConstantX	b2v_inst29(
	.DATA_OUT(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst29.const = 7;
	defparam	b2v_inst29.size = 8;


ConstantX	b2v_inst3(
	.DATA_OUT(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst3.const = 84;
	defparam	b2v_inst3.size = 8;


CMP8	b2v_inst30(
	.A(SYNTHESIZED_WIRE_12),
	.B(byte_pos),
	
	.E(p0_int)
	);


ConstantX	b2v_inst31(
	.DATA_OUT(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst31.const = 8;
	defparam	b2v_inst31.size = 8;


CMP8	b2v_inst32(
	.A(SYNTHESIZED_WIRE_13),
	.B(byte_pos),
	
	.E(p1_dist)
	);


ConstantX	b2v_inst33(
	.DATA_OUT(SYNTHESIZED_WIRE_13));
	defparam	b2v_inst33.const = 10;
	defparam	b2v_inst33.size = 8;


CMP8	b2v_inst34(
	.A(SYNTHESIZED_WIRE_14),
	.B(byte_pos),
	
	.E(p1_int)
	);


ConstantX	b2v_inst35(
	.DATA_OUT(SYNTHESIZED_WIRE_14));
	defparam	b2v_inst35.const = 11;
	defparam	b2v_inst35.size = 8;


CMP8	b2v_inst36(
	.A(SYNTHESIZED_WIRE_15),
	.B(byte_pos),
	
	.E(p2_dist)
	);


ConstantX	b2v_inst37(
	.DATA_OUT(SYNTHESIZED_WIRE_15));
	defparam	b2v_inst37.const = 13;
	defparam	b2v_inst37.size = 8;


CMP8	b2v_inst38(
	.A(SYNTHESIZED_WIRE_16),
	.B(byte_pos),
	
	.E(p2_int)
	);


ConstantX	b2v_inst39(
	.DATA_OUT(SYNTHESIZED_WIRE_16));
	defparam	b2v_inst39.const = 14;
	defparam	b2v_inst39.size = 8;

assign	SYNTHESIZED_WIRE_28 = byte_ready & header_match & SYNTHESIZED_WIRE_17;


CMP8	b2v_inst40(
	.A(SYNTHESIZED_WIRE_18),
	.B(byte_pos),
	
	.E(p3_dist)
	);


ConstantX	b2v_inst41(
	.DATA_OUT(SYNTHESIZED_WIRE_18));
	defparam	b2v_inst41.const = 16;
	defparam	b2v_inst41.size = 8;


CMP8	b2v_inst42(
	.A(SYNTHESIZED_WIRE_19),
	.B(byte_pos),
	
	.E(p3_int)
	);


ConstantX	b2v_inst43(
	.DATA_OUT(SYNTHESIZED_WIRE_19));
	defparam	b2v_inst43.const = 17;
	defparam	b2v_inst43.size = 8;


CMP8	b2v_inst44(
	.A(SYNTHESIZED_WIRE_20),
	.B(byte_pos),
	
	.E(p4_dist)
	);


ConstantX	b2v_inst45(
	.DATA_OUT(SYNTHESIZED_WIRE_20));
	defparam	b2v_inst45.const = 19;
	defparam	b2v_inst45.size = 8;


CMP8	b2v_inst46(
	.A(SYNTHESIZED_WIRE_21),
	.B(byte_pos),
	
	.E(p4_int)
	);


ConstantX	b2v_inst47(
	.DATA_OUT(SYNTHESIZED_WIRE_21));
	defparam	b2v_inst47.const = 20;
	defparam	b2v_inst47.size = 8;


CMP8	b2v_inst48(
	.A(SYNTHESIZED_WIRE_22),
	.B(byte_pos),
	
	.E(p5_dist)
	);


ConstantX	b2v_inst49(
	.DATA_OUT(SYNTHESIZED_WIRE_22));
	defparam	b2v_inst49.const = 22;
	defparam	b2v_inst49.size = 8;

assign	SYNTHESIZED_WIRE_17 =  ~in_packet;


CMP8	b2v_inst50(
	.A(SYNTHESIZED_WIRE_23),
	.B(byte_pos),
	
	.E(p5_int)
	);


ConstantX	b2v_inst51(
	.DATA_OUT(SYNTHESIZED_WIRE_23));
	defparam	b2v_inst51.const = 23;
	defparam	b2v_inst51.size = 8;


CMP8	b2v_inst52(
	.A(SYNTHESIZED_WIRE_24),
	.B(byte_pos),
	
	.E(p6_dist)
	);


ConstantX	b2v_inst53(
	.DATA_OUT(SYNTHESIZED_WIRE_24));
	defparam	b2v_inst53.const = 25;
	defparam	b2v_inst53.size = 8;


CMP8	b2v_inst54(
	.A(SYNTHESIZED_WIRE_25),
	.B(byte_pos),
	
	.E(p6_int)
	);


ConstantX	b2v_inst55(
	.DATA_OUT(SYNTHESIZED_WIRE_25));
	defparam	b2v_inst55.const = 26;
	defparam	b2v_inst55.size = 8;


CMP8	b2v_inst56(
	.A(SYNTHESIZED_WIRE_26),
	.B(byte_pos),
	
	.E(p7_dist)
	);


ConstantX	b2v_inst57(
	.DATA_OUT(SYNTHESIZED_WIRE_26));
	defparam	b2v_inst57.const = 28;
	defparam	b2v_inst57.size = 8;


CMP8	b2v_inst58(
	.A(SYNTHESIZED_WIRE_27),
	.B(byte_pos),
	
	.E(p7_int)
	);


ConstantX	b2v_inst59(
	.DATA_OUT(SYNTHESIZED_WIRE_27));
	defparam	b2v_inst59.const = 29;
	defparam	b2v_inst59.size = 8;

assign	pkt_start = SYNTHESIZED_WIRE_28 & SYNTHESIZED_WIRE_29;


CMP8	b2v_inst60(
	.A(SYNTHESIZED_WIRE_30),
	.B(byte_pos),
	
	.E(p8_dist)
	);


ConstantX	b2v_inst61(
	.DATA_OUT(SYNTHESIZED_WIRE_30));
	defparam	b2v_inst61.const = 31;
	defparam	b2v_inst61.size = 8;


CMP8	b2v_inst62(
	.A(SYNTHESIZED_WIRE_31),
	.B(byte_pos),
	
	.E(p8_int)
	);


ConstantX	b2v_inst63(
	.DATA_OUT(SYNTHESIZED_WIRE_31));
	defparam	b2v_inst63.const = 32;
	defparam	b2v_inst63.size = 8;


CMP8	b2v_inst64(
	.A(SYNTHESIZED_WIRE_32),
	.B(byte_pos),
	
	.E(p9_dist)
	);


ConstantX	b2v_inst65(
	.DATA_OUT(SYNTHESIZED_WIRE_32));
	defparam	b2v_inst65.const = 34;
	defparam	b2v_inst65.size = 8;


CMP8	b2v_inst66(
	.A(SYNTHESIZED_WIRE_33),
	.B(byte_pos),
	
	.E(p9_int)
	);


ConstantX	b2v_inst67(
	.DATA_OUT(SYNTHESIZED_WIRE_33));
	defparam	b2v_inst67.const = 35;
	defparam	b2v_inst67.size = 8;


CMP8	b2v_inst68(
	.A(SYNTHESIZED_WIRE_34),
	.B(byte_pos),
	
	.E(p10_dist)
	);


ConstantX	b2v_inst69(
	.DATA_OUT(SYNTHESIZED_WIRE_34));
	defparam	b2v_inst69.const = 37;
	defparam	b2v_inst69.size = 8;

assign	SYNTHESIZED_WIRE_29 =  ~data_ready_ALTERA_SYNTHESIZED;


CMP8	b2v_inst70(
	.A(SYNTHESIZED_WIRE_35),
	.B(byte_pos),
	
	.E(p10_int)
	);


ConstantX	b2v_inst71(
	.DATA_OUT(SYNTHESIZED_WIRE_35));
	defparam	b2v_inst71.const = 38;
	defparam	b2v_inst71.size = 8;


CMP8	b2v_inst72(
	.A(SYNTHESIZED_WIRE_36),
	.B(byte_pos),
	
	.E(p11_dist)
	);


ConstantX	b2v_inst73(
	.DATA_OUT(SYNTHESIZED_WIRE_36));
	defparam	b2v_inst73.const = 40;
	defparam	b2v_inst73.size = 8;


CMP8	b2v_inst74(
	.A(SYNTHESIZED_WIRE_37),
	.B(byte_pos),
	
	.E(p11_int)
	);


ConstantX	b2v_inst75(
	.DATA_OUT(SYNTHESIZED_WIRE_37));
	defparam	b2v_inst75.const = 41;
	defparam	b2v_inst75.size = 8;


CMP8	b2v_inst76(
	.A(SYNTHESIZED_WIRE_38),
	.B(byte_pos),
	
	.E(endangle_end)
	);


ConstantX	b2v_inst77(
	.DATA_OUT(SYNTHESIZED_WIRE_38));
	defparam	b2v_inst77.const = 43;
	defparam	b2v_inst77.size = 8;


CMP8	b2v_inst78(
	.A(SYNTHESIZED_WIRE_39),
	.B(byte_pos),
	
	.E(timestamp_end)
	);


ConstantX	b2v_inst79(
	.DATA_OUT(SYNTHESIZED_WIRE_39));
	defparam	b2v_inst79.const = 45;
	defparam	b2v_inst79.size = 8;


REG1_LD_CL	b2v_inst8(
	.LD(pkt_start),
	.I(jedan),
	.CL(SYNTHESIZED_WIRE_40),
	.clk(clk),
	.A(in_packet));


CMP8	b2v_inst80(
	.A(SYNTHESIZED_WIRE_41),
	.B(byte_pos),
	
	.E(pkt_done)
	);


ConstantX	b2v_inst81(
	.DATA_OUT(SYNTHESIZED_WIRE_41));
	defparam	b2v_inst81.const = 45;
	defparam	b2v_inst81.size = 8;


REG8_LD_CL	b2v_inst82(
	.LD(endangle_end),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(end_angle_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst83(
	.LD(endangle_end),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(end_angle_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst84(
	.LD(timestamp_end),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(timestamp_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst85(
	.LD(timestamp_end),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(timestamp_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst86(
	.LD(p0_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point0_dist_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst87(
	.LD(p0_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point0_dist_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst88(
	.LD(p0_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point0_int_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst89(
	.LD(p0_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point0_int_ALTERA_SYNTHESIZED[7:0]));



REG8_LD_CL	b2v_inst90(
	.LD(p1_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point1_dist_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst91(
	.LD(p1_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point1_dist_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst92(
	.LD(p1_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point1_int_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst93(
	.LD(p1_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point1_int_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst94(
	.LD(p2_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point2_dist_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst95(
	.LD(p2_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point2_dist_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst96(
	.LD(p2_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point2_int_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst97(
	.LD(p2_int),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point2_int_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_CL	b2v_inst98(
	.LD(p3_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[15:8]),
	.A(point3_dist_ALTERA_SYNTHESIZED[15:8]));


REG8_LD_CL	b2v_inst99(
	.LD(p3_dist),
	.CL(sys_reset),
	.clk(clk),
	.I(prev_byte[7:0]),
	.A(point3_dist_ALTERA_SYNTHESIZED[7:0]));

assign	data_ready = data_ready_ALTERA_SYNTHESIZED;
assign	end_angle = end_angle_ALTERA_SYNTHESIZED;
assign	point0_dist = point0_dist_ALTERA_SYNTHESIZED;
assign	point0_int = point0_int_ALTERA_SYNTHESIZED;
assign	point10_dist = point10_dist_ALTERA_SYNTHESIZED;
assign	point10_int = point10_int_ALTERA_SYNTHESIZED;
assign	point11_dist = point11_dist_ALTERA_SYNTHESIZED;
assign	point11_int = point11_int_ALTERA_SYNTHESIZED;
assign	point1_dist = point1_dist_ALTERA_SYNTHESIZED;
assign	point1_int = point1_int_ALTERA_SYNTHESIZED;
assign	point2_dist = point2_dist_ALTERA_SYNTHESIZED;
assign	point2_int = point2_int_ALTERA_SYNTHESIZED;
assign	point3_dist = point3_dist_ALTERA_SYNTHESIZED;
assign	point3_int = point3_int_ALTERA_SYNTHESIZED;
assign	point4_dist = point4_dist_ALTERA_SYNTHESIZED;
assign	point4_int = point4_int_ALTERA_SYNTHESIZED;
assign	point5_dist = point5_dist_ALTERA_SYNTHESIZED;
assign	point5_int = point5_int_ALTERA_SYNTHESIZED;
assign	point6_dist = point6_dist_ALTERA_SYNTHESIZED;
assign	point6_int = point6_int_ALTERA_SYNTHESIZED;
assign	point7_dist = point7_dist_ALTERA_SYNTHESIZED;
assign	point7_int = point7_int_ALTERA_SYNTHESIZED;
assign	point8_dist = point8_dist_ALTERA_SYNTHESIZED;
assign	point8_int = point8_int_ALTERA_SYNTHESIZED;
assign	point9_dist = point9_dist_ALTERA_SYNTHESIZED;
assign	point9_int = point9_int_ALTERA_SYNTHESIZED;
assign	speed = speed_ALTERA_SYNTHESIZED;
assign	start_angle = start_angle_ALTERA_SYNTHESIZED;
assign	timestamp = timestamp_ALTERA_SYNTHESIZED;
assign	jedan = 1;

endmodule
