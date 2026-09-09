// =====================================================================
// LidarInterface_fixed2.v  (module: LidarInterfaceFixed2)
//
// This is the module actually placed in MainScheme.bdf right now.
// Synced to match LidarInterface_fixed.v (module LidarInterfaceFixed)
// after the per-revolution seq redesign - same logic, only the module
// name differs, and the port list is IDENTICAL to what was already
// wired into the schematic (clk, rst_n, rx, cs_lidar -> lidar_ready,
// lidar_data), so this is a drop-in: no rewiring needed, just
// recompile. See LidarInterface_fixed.v for the full design writeup
// (revolution boundary detection, why the port list is what it is,
// simulation checklist) - not duplicated here to avoid the two
// copies drifting out of sync in the comments even when the logic
// itself is kept identical.
//
// lidar_data[31]    = valid
// lidar_data[30]    = unused (0)
// lidar_data[29:20] = seq (point index WITHIN THE CURRENT REVOLUTION,
//                      0 right after each angle wraparound)
// lidar_data[19:10] = x_pixel[9:0]
// lidar_data[9:0]   = y_pixel[9:0]
// =====================================================================

module LidarInterfaceFixed2(
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

// ---------------------------------------------------------------
// Unchanged from the original LidarInterface.v: byte reception,
// packet parsing, per-point angle interpolation and polar->pixel
// conversion. `ack` (PacketParser's unlock signal) is wired straight
// to `burst_done` again, same as the very first version - a new
// packet is free to start overwriting the "current point" registers
// the moment the previous burst finishes, no CPU involvement needed.
// ---------------------------------------------------------------
wire	busy;
wire	busy_clear;
wire	burst_done;
wire	cnt_en;
wire	data_ready;			// from PacketParser: one full packet parsed
wire	[15:0] end_angle;
wire	is_last;
wire	jedan;
wire	n_busy;
wire	n_is_last;
wire	nula;
wire	pixel_valid;
wire	[3:0] point_index;
wire	[7:0] q;
wire	sclr;
wire	[15:0] start_angle;
wire	sys_reset;
wire	[15:0] x_pixel;
wire	[15:0] y_pixel;

wire	[15:0] angle_p0, angle_p1, angle_p1_0, angle_p1_1, angle_p2, angle_p3;
wire	[15:0] angle_p4, angle_p5, angle_p6, angle_p7, angle_p8, angle_p9;

wire	[15:0] rx_data;
wire	byte_ready;

wire	[15:0] point0_dist, point1_dist, point2_dist, point3_dist, point4_dist;
wire	[15:0] point5_dist, point6_dist, point7_dist, point8_dist, point9_dist;
wire	[15:0] point10_dist, point11_dist;

wire	[15:0] selected_angle;
wire	[15:0] selected_dist;

assign	sys_reset = ~rst_n;
assign	jedan = 1;
assign	nula = 0;

UART_RX	u_uart(
	.clk(clk),
	.rst_n(rst_n),
	.rx(rx),
	.byte_ready(byte_ready),
	.rx_data(rx_data));


AngleGenerator	u_anglegen(
	.end_angle(end_angle),
	.start_angle(start_angle),
	.angle_p0(angle_p0),
	.angle_p1(angle_p1),
	.angle_p1_0(angle_p1_0),
	.angle_p1_1(angle_p1_1),
	.angle_p2(angle_p2),
	.angle_p3(angle_p3),
	.angle_p4(angle_p4),
	.angle_p5(angle_p5),
	.angle_p6(angle_p6),
	.angle_p7(angle_p7),
	.angle_p8(angle_p8),
	.angle_p9(angle_p9));


PacketParser	u_parser(
	.clk(clk),
	.rst_n(rst_n),
	.byte_ready(byte_ready),
	.ack(burst_done),				// "auto" - no CPU ack needed
	.rx_data(rx_data),
	.data_ready(data_ready),
	.end_angle(end_angle),
	.point0_dist(point0_dist),
	.point10_dist(point10_dist),
	.point11_dist(point11_dist),
	.point1_dist(point1_dist),
	.point2_dist(point2_dist),
	.point3_dist(point3_dist),
	.point4_dist(point4_dist),
	.point5_dist(point5_dist),
	.point6_dist(point6_dist),
	.point7_dist(point7_dist),
	.point8_dist(point8_dist),
	.point9_dist(point9_dist),
	.start_angle(start_angle));


MPX12_16BIT	u_distsel(
	.data0x(point0_dist),
	.data10x(point10_dist),
	.data11x(point11_dist),
	.data1x(point1_dist),
	.data2x(point2_dist),
	.data3x(point3_dist),
	.data4x(point4_dist),
	.data5x(point5_dist),
	.data6x(point6_dist),
	.data7x(point7_dist),
	.data8x(point8_dist),
	.data9x(point9_dist),
	.sel(point_index),
	.result(selected_dist));


MPX12_16BIT	u_anglesel(
	.data0x(angle_p0),
	.data10x(angle_p1_0),
	.data11x(angle_p1_1),
	.data1x(angle_p1),
	.data2x(angle_p2),
	.data3x(angle_p3),
	.data4x(angle_p4),
	.data5x(angle_p5),
	.data6x(angle_p6),
	.data7x(angle_p7),
	.data8x(angle_p8),
	.data9x(angle_p9),
	.sel(point_index),
	.result(selected_angle));


CalculateXYFixed	u_calcxy(
	.clk(clk),
	.angle(selected_angle),
	.distance(selected_dist),
	.x_pixel(x_pixel),
	.y_pixel(y_pixel));


counter_8bit	u_ptidx(
	.sclr(sclr),
	.clock(clk),
	.cnt_en(cnt_en),
	.q(q));

assign	point_index = q[3:0];
assign	sclr = sys_reset | n_busy;
assign	n_busy = ~busy;
assign	n_is_last = ~is_last;
assign	cnt_en = n_is_last & pixel_valid;

CMP4	u_islast(
	.A(point_index),
	.B(4'd11),
	.E(is_last)
	);

REG1_LD_CL	u_busy(
	.LD(data_ready),
	.I(jedan),
	.CL(busy_clear),
	.clk(clk),
	.A(busy));

assign	busy_clear = sys_reset | burst_done;

REG1_LD_CL	u_burstdone(
	.LD(jedan),
	.I(is_last),
	.CL(sys_reset),
	.clk(clk),
	.A(burst_done));

REG1_LD_CL	u_pixelvalid(
	.LD(jedan),
	.I(busy),
	.CL(busy_clear),
	.clk(clk),
	.A(pixel_valid));


// ---------------------------------------------------------------
// Single "current point" output, tagged with a per-revolution point
// index. No addressing, no ack - just holds the latest captured
// point and lets the CPU tell points apart (and tell where in the
// revolution it is) by seq.
// ---------------------------------------------------------------
wire	[15:0] latest_x;
wire	[15:0] latest_y;

REG16_LD_CL	u_latest_x(
	.LD(pixel_valid),
	.CL(sys_reset),
	.clk(clk),
	.I(x_pixel),
	.A(latest_x));

REG16_LD_CL	u_latest_y(
	.LD(pixel_valid),
	.CL(sys_reset),
	.clk(clk),
	.I(y_pixel),
	.A(latest_y));

// ---- revolution-boundary detection (once per PACKET, on data_ready) ----
wire	seen_packet_reg;
REG1_LD_CL	u_seenpacket(
	.LD(data_ready),
	.I(jedan),
	.CL(sys_reset),
	.clk(clk),
	.A(seen_packet_reg));

wire	first_packet;
assign	first_packet = ~seen_packet_reg;	// true only during the very first data_ready after reset

wire	[15:0] prev_start_angle;
wire	angle_went_down;
CMP16	u_anglecmp(
	.A(start_angle),
	.B(prev_start_angle),
	.L(angle_went_down)		// start_angle < prev_start_angle -> wrapped past 0deg
	);

wire	new_revolution;
assign	new_revolution = angle_went_down | first_packet;

REG16_LD_CL	u_prevangle(
	.LD(data_ready),
	.CL(sys_reset),
	.clk(clk),
	.I(start_angle),
	.A(prev_start_angle));

// ---- packet_base_seq: seq value of point_index=0 for the packet
//      currently streaming, updated once per packet on data_ready ----
wire	[15:0] packet_base_seq;
wire	[15:0] packet_base_seq_plus12;
wire	[15:0] const_twelve;
wire	[15:0] packet_base_seq_next;

assign	const_twelve = 16'd12;

ADD16	u_baseinc(
	.C_0(nula),
	.A(packet_base_seq),
	.B(const_twelve),

	.OUT(packet_base_seq_plus12));

MPX2_16BIT	u_basesel(
	.S(new_revolution),
	.E(jedan),
	.I0(packet_base_seq_plus12),
	.I1(16'd0),
	.D(packet_base_seq_next));

REG16_LD_CL	u_basereg(
	.LD(data_ready),
	.CL(sys_reset),
	.clk(clk),
	.I(packet_base_seq_next),
	.A(packet_base_seq));

// ---- point_seq: index of the point CURRENTLY being streamed
//      (packet_base_seq + point_index), valid throughout the burst
//      the same way x_pixel/y_pixel are, latched the same way too ----
wire	[15:0] point_seq;
ADD16	u_pointseq(
	.C_0(nula),
	.A(packet_base_seq),
	.B({12'b0, point_index}),

	.OUT(point_seq));

wire	[15:0] seq_cur;
REG16_LD_CL	u_seqreg(
	.LD(pixel_valid),
	.CL(sys_reset),
	.clk(clk),
	.I(point_seq),
	.A(seq_cur));

wire	valid_reg;
REG1_LD_CL	u_validreg(
	.LD(pixel_valid),
	.I(jedan),
	.CL(sys_reset),
	.clk(clk),
	.A(valid_reg));

assign	lidar_data[31]    = valid_reg;
assign	lidar_data[30]    = nula;
assign	lidar_data[29:20] = seq_cur[9:0];
assign	lidar_data[19:10] = latest_x[9:0];
assign	lidar_data[9:0]   = latest_y[9:0];

assign	lidar_ready = cs_lidar;

endmodule
