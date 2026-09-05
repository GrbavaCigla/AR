// =====================================================================
// LidarInterface_fixed.v  (module: LidarInterfaceFixed)
//
// HAND-WRITTEN reference redesign for the "1-of-12-points" sparsity
// issue. Rev 2: drops the addressed 12-slot register file + STATUS/
// CTRL/ACK handshake from rev 1 entirely, per your call - a new
// packet is allowed to overwrite the "current point" the moment it
// arrives, no CPU acknowledgement needed. Instead: a single "current
// point" output, tagged with a 10-bit sequence number that resets to
// 0 at the start of each revolution (angle wraparound) instead of
// counting across the whole run, so the CPU can tell points apart
// AND know each point's position within its own revolution, just by
// polling, with no addressing at all.
//
// Still reuses every sub-block you already have (UART_RX,
// PacketParser, AngleGenerator, CalculateXYFixed, MPX12_16BIT,
// counter_8bit, CMP4, CMP16, MPX2_16BIT, REG1_LD_CL, REG16_LD_CL,
// ADD16) plus the whole point-generation pipeline copied verbatim
// from the original file. For simulation only - see "HOW TO TEST",
// then "WHAT TO DRAW IN THE BDF" once you're happy with it.
//
// -----------------------------------------------------------------
// THE NEW ENCODING
// -----------------------------------------------------------------
// lidar_data[31]    = valid   (0 until the very first point is ever
//                      captured after reset, 1 forever after that)
// lidar_data[30]    = unused (0)
// lidar_data[29:20] = seq     (10 bits - the point's index WITHIN
//                      THE CURRENT REVOLUTION, i.e. 0 at the first
//                      point after each angle wraparound and
//                      counting up from there, NOT a global run
//                      counter. Resets to 0 again at the next
//                      wraparound. See "REVOLUTION BOUNDARY" below
//                      for exactly how that reset is detected and
//                      its one caveat.)
// lidar_data[19:10] = x_pixel[9:0]
// lidar_data[9:0]   = y_pixel[9:0]
//
// -----------------------------------------------------------------
// REVOLUTION BOUNDARY DETECTION
// -----------------------------------------------------------------
// Each packet carries its own start_angle (0.01deg units, 0..35999).
// Every time a new packet finishes parsing (data_ready), this
// module compares that packet's start_angle against the PREVIOUS
// packet's start_angle: if it went DOWN (new start_angle < previous
// one), the head just crossed back through 0deg, so this is the
// first packet of a new revolution and its 12 points get numbered
// starting from 0. Otherwise this packet continues the running
// count from wherever the previous packet left off (+12).
//
// Caveat: this can only reset the counter at PACKET boundaries (12
// points at a time), not at the exact point where the angle
// crosses 0deg - and 4000 pts/s at ~6Hz is ~666.67 points/rev,
// not a whole number, so the physical wrap essentially never lines
// up exactly with a packet boundary. In practice that means the
// last "revolution" of points before a reset can run a few points
// short or long of a clean 0..666 - expect a range like roughly
// 655..667 for the highest seq you see before it drops back to 0,
// not a single fixed maximum every time. If you need it exact to
// the point, that requires point-level angle comparison instead of
// packet-level, which is a fair bit more logic - say if you want
// that version instead.
//
// Port list SHRANK vs rev 1: bus_addr/bus_wr/bus_wdata are gone
// (nothing to address or write to any more). Only `cs_lidar` stays,
// purely so lidar_ready can report "immediately ready" to the bus
// the same way VGA/LED already do (see WHAT TO DRAW IN THE BDF for
// what to remove from MainScheme.bdf).
//
// -----------------------------------------------------------------
// WHY THIS STILL FIXES THE SPARSITY BUG
// -----------------------------------------------------------------
// The ORIGINAL LidarInterface set lidar_ready=pixel_valid, which
// only pulses ~12 clock cycles out of every ~2ms packet - so a bus
// read that happens to arrive during the other 99.99% of the time
// just blocks (BusFSM.bus_wait) until the NEXT such pulse, which is
// always point 0 of the next packet. Here lidar_ready=cs_lidar
// (always immediately ready, like VGA/LED), and `latest_x`/
// `latest_y`/`seq` are proper HOLDING registers that latch on
// pixel_valid and keep their value between pulses. So every read
// completes instantly and returns whatever the most recently
// captured point was - poll in a tight loop (points arrive roughly
// every ~8300 clock cycles at 50MHz, way slower than a few
// instructions per loop) and you'll see every seq value go by
// without needing to synchronize to the burst at all.
//
// -----------------------------------------------------------------
// HOW TO TEST
// -----------------------------------------------------------------
//   1. Compile this file plus its dependencies (AngleGenerator,
//      CalculateXYFixed, ROM_SIN, UART_RX, PacketParser,
//      counter_8bit, MPX12_16BIT, CMP4, REG1_LD_CL, REG16_LD_CL,
//      ADD16) into your simulator.
//   2. Send a packet the same way tb_LidarInterface.sv does, then
//      just watch lidar_data continuously (no bus reads needed to
//      observe it in sim, cs_lidar/lidar_ready only matter once this
//      is on the real bus): confirm x_pixel/y_pixel/seq update 12
//      times per packet, seq increments by exactly 1 each time
//      starting from 0 (since this is the first packet ever), and
//      valid goes to 1 on the very first point and never drops.
//   3. Send a second packet with a HIGHER start_angle right after
//      and confirm seq continues from +12 (not reset) - this is the
//      "same revolution, next packet" case.
//   4. Send a third packet whose start_angle is LOWER than the
//      second packet's (simulating the head crossing back through
//      0deg) and confirm seq resets to 0 for that packet's 12 points
//      - this is the actual behavior you asked for.
//   5. Once it checks out, reproduce it in the schematic - see below.
//
// -----------------------------------------------------------------
// WHAT TO DRAW IN THE BDF (LidarInterface.bdf / LidarInterfaceFixed)
// -----------------------------------------------------------------
// If you already built rev 1 (12-slot buffer + STATUS/CTRL) in the
// schematic: delete the 24 capture REG16_LD_CL's, both MPX12_16BIT
// read-select muxes, the DEC5 decoder, both CMP4 address comparators,
// the CTRL/ACK AND-gate chain, and the data_ready_reg REG1_LD_CL -
// none of that survives in this revision. Also delete the bus_addr,
// bus_wr and bus_wdata pins from the symbol (regenerate the .bsf),
// and in MainScheme.bdf remove the 3 wires feeding those pins -
// leave cs_lidar connected, that one still matters.
//
// Keep the entire existing point-generation section (UART_RX,
// PacketParser, AngleGenerator, CalculateXYFixed, both MPX12_16BIT
// angle/distance selectors, counter_8bit, the is_last/busy/
// pixel_valid REG1_LD_CL trio) exactly as-is - including PacketParser
// `ack` wired straight to `burst_done` (the "auto-unlock" wiring the
// ORIGINAL file had - if you built rev 1's cpu_ack gating, undo that
// one rewire back to how it was before). Add:
//   1. REG16_LD_CL "latest_x": LD=pixel_valid, I=x_pixel,
//      CL=sys_reset -> net "latest_x".
//   2. REG16_LD_CL "latest_y": LD=pixel_valid, I=y_pixel,
//      CL=sys_reset -> net "latest_y".
//
//   -- revolution boundary detection (once per packet, on data_ready) --
//   3. REG1_LD_CL "seen_packet_reg": LD=data_ready, I=jedan,
//      CL=sys_reset. Then a NOT gate: first_packet = ~seen_packet_reg
//      (true only for the very first packet after reset).
//   4. REG16_LD_CL "prev_start_angle": LD=data_ready, I=start_angle
//      (already on this sheet), CL=sys_reset -> net "prev_start_angle".
//   5. CMP16: A=start_angle, B=prev_start_angle (step 4, use the
//      value BEFORE this cycle's update - that's automatic, it's a
//      registered input). Use its L output ("A less than B") ->
//      net "angle_went_down".
//   6. OR gate: new_revolution = angle_went_down (step 5) OR
//      first_packet (step 3).
//
//   -- per-packet base + per-point seq (mirrors how x_pixel/y_pixel
//      already work: combinational value valid during the burst,
//      latched into a holding register on pixel_valid) --
//   7. ADD16: A=packet_base_seq (step 9, feeds back), B=constant 12
//      (ConstantX, size=16, const=12) -> net "packet_base_seq_plus12".
//   8. MPX2_16BIT: S=new_revolution (step 6), I0=packet_base_seq_plus12
//      (step 7), I1=constant 0 (ConstantX, size=16, const=0) ->
//      net "packet_base_seq_next".
//   9. REG16_LD_CL "packet_base_seq": LD=data_ready, I=packet_base_seq_next
//      (step 8), CL=sys_reset -> net "packet_base_seq" (feeds back
//      into step 7 - this is the seq value of point_index=0 for
//      whichever packet is currently streaming).
//  10. ADD16: A=packet_base_seq (step 9), B={12'b0,point_index}
//      (point_index already on this sheet, zero-extended to 16 bits)
//      -> net "point_seq" (the index of the point CURRENTLY being
//      streamed - valid throughout the burst, same timing as x_pixel).
//  11. REG16_LD_CL "seq_cur": LD=pixel_valid, I=point_seq (step 10),
//      CL=sys_reset -> net "seq_cur" (latched the same cycle as
//      latest_x/latest_y, so they always describe the same point).
//
//  12. REG1_LD_CL "valid_reg": LD=pixel_valid, I=jedan, CL=sys_reset
//      -> net "valid_reg" (latches to 1 on the first point ever and
//      never clears again except on reset).
//  13. Assemble lidar_data: bit31=valid_reg, bit30=nula,
//      bits[29:20]=seq_cur[9:0], bits[19:10]=latest_x[9:0],
//      bits[9:0]=latest_y[9:0] (plain wire concatenation, no output
//      mux needed - there's only one thing to show).
//  14. lidar_ready = cs_lidar directly.
// =====================================================================

module LidarInterfaceFixed(
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
	.ack(burst_done),				// back to "auto" - no CPU ack needed
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
// NEW: single "current point" output, tagged with a per-revolution
// point index. No addressing, no ack - just holds the latest
// captured point and lets the CPU tell points apart by seq.
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

// =====================================================================
// Suggested firmware/src/lidar.h to match this encoding.
// -----------------------------------------------------------------
// #pragma once
// #include "common.h"
//
// #define LIDAR_DWORD MMIO_REG(LIDAR_DWORD_ADDRESS)
//
// #define LIDAR_VALID_BIT ((dword_t)1 << 31)
// #define LIDAR_IS_VALID(word) ((bool_t)(((word) & LIDAR_VALID_BIT) != 0))
// #define LIDAR_GET_SEQ(word) ((word_t)(((word) >> 20) & 0x3FFu))
// #define LIDAR_GET_X(word)   ((word_t)(((word) >> 10) & 0x3FFu))
// #define LIDAR_GET_Y(word)   ((word_t)((word) & 0x3FFu))
//
// main.c's loop becomes, roughly (poll fast, skip repeats by seq):
//
//   register word_t last_seq = 0xFFFF;   // impossible seq, forces
//                                         // the first read to count
//   register dword_t lidar;
//   while (1) {
//       lidar = LIDAR_DWORD;
//       if (LIDAR_IS_VALID(lidar)) {
//           word_t seq = LIDAR_GET_SEQ(lidar);
//           if (seq != last_seq) {
//               if (seq < last_seq) {
//                   // seq just dropped back down -> a new revolution
//                   // started, i.e. a full sweep just finished. Good
//                   // spot to VGA_SWAP() instead of the old i>24 timer.
//                   VGA_SWAP();
//               }
//               last_seq = seq;
//               VGA_WRITE_PIXEL(LIDAR_GET_X(lidar), LIDAR_GET_Y(lidar), 1);
//           }
//       }
//   }
// =====================================================================
