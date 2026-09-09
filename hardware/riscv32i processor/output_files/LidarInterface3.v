// LD14P polling interface with a one-point mailbox (no FIFO).
//
// This module uses the existing project blocks:
//   UART_RX, PacketParser, AngleGenerator and CalculateXY2.
//
// PacketParser holds all 12 distances until parser_ack.  Therefore this
// controller can calculate and expose one point at a time.  point_data is held
// stable until the CPU executes LW from 0x1000_0004.  That read acts as ACK for
// the point; no bus write and no interrupt are required.
//
// Register offsets selected by bus_addr[3:2]:
//   2'b00 (+0x0): STATUS
//                  bit 0 point_ready
//                  bit 1 parser has a packet
//                  bit 2 controller is processing a packet
//   2'b01 (+0x4): DATA; reading consumes the current point
//   2'b10 (+0x8): zero/reserved
//   2'b11 (+0xC): zero/reserved

module LidarInterface3 (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        rx,

    input  wire        cs_lidar,
    input  wire        bus_rd,
    input  wire [3:2]  bus_addr,

    output wire        lidar_ready,
    output reg  [31:0] lidar_data
);

    localparam [1:0] STATE_IDLE   = 2'd0;
    localparam [1:0] STATE_SETTLE = 2'd1;
    localparam [1:0] STATE_READY  = 2'd2;

    wire       sys_reset = ~rst_n;
    wire       byte_ready;
    wire [7:0] rx_data;

    wire        parser_data_ready;
    reg         parser_ack;
    wire [15:0] start_angle;
    wire [15:0] end_angle;
    wire [15:0] speed_unused;
    wire [15:0] timestamp_unused;

    wire [15:0] dist0;
    wire [15:0] dist1;
    wire [15:0] dist2;
    wire [15:0] dist3;
    wire [15:0] dist4;
    wire [15:0] dist5;
    wire [15:0] dist6;
    wire [15:0] dist7;
    wire [15:0] dist8;
    wire [15:0] dist9;
    wire [15:0] dist10;
    wire [15:0] dist11;

    wire [15:0] angle0;
    wire [15:0] angle1;
    wire [15:0] angle2;
    wire [15:0] angle3;
    wire [15:0] angle4;
    wire [15:0] angle5;
    wire [15:0] angle6;
    wire [15:0] angle7;
    wire [15:0] angle8;
    wire [15:0] angle9;
    wire [15:0] angle10;
    wire [15:0] angle11;

    reg  [3:0]  point_index;
    reg  [1:0]  settle_count;
    reg  [1:0]  state;

    reg          seen_packet;
    reg  [15:0]  previous_start_angle;
    reg  [15:0]  scan_base;
    reg  [15:0]  next_scan_base;

    reg  [31:0]  point_data;
    reg          point_ready;

    reg  [15:0]  selected_angle;
    reg  [15:0]  selected_distance;
    reg  [15:0]  scaled_distance;

    wire [15:0] x_pixel;
    wire [15:0] y_pixel;
    wire [15:0] point_sequence = scan_base + {12'b0, point_index};

    wire controller_busy = (state != STATE_IDLE);
    wire data_selected = (~bus_addr[3]) & bus_addr[2];
    wire data_read = cs_lidar & bus_rd & data_selected & point_ready;

    // Bus transactions themselves complete immediately.  Availability of a
    // point is reported separately in STATUS[0].
    assign lidar_ready = cs_lidar;

    always @(*) begin
        case (bus_addr)
            2'b00: lidar_data = {29'b0, controller_busy,
                                  parser_data_ready, point_ready};
            2'b01: lidar_data = point_data;
            default: lidar_data = 32'b0;
        endcase
    end

    UART_RX uart_rx_inst (
        .clk        (clk),
        .rx         (rx),
        .rst_n      (rst_n),
        .byte_ready (byte_ready),
        .rx_data    (rx_data)
    );

    PacketParser parser_inst (
        .clk          (clk),
        .rst_n        (rst_n),
        .byte_ready   (byte_ready),
        .ack          (parser_ack),
        .rx_data      (rx_data),
        .data_ready   (parser_data_ready),
        .end_angle    (end_angle),
        .point0_dist  (dist0),
        .point0_int   (),
        .point1_dist  (dist1),
        .point1_int   (),
        .point2_dist  (dist2),
        .point2_int   (),
        .point3_dist  (dist3),
        .point3_int   (),
        .point4_dist  (dist4),
        .point4_int   (),
        .point5_dist  (dist5),
        .point5_int   (),
        .point6_dist  (dist6),
        .point6_int   (),
        .point7_dist  (dist7),
        .point7_int   (),
        .point8_dist  (dist8),
        .point8_int   (),
        .point9_dist  (dist9),
        .point9_int   (),
        .point10_dist (dist10),
        .point10_int  (),
        .point11_dist (dist11),
        .point11_int  (),
        .speed        (speed_unused),
        .start_angle  (start_angle),
        .timestamp    (timestamp_unused)
    );

    // The generated AngleGenerator uses unusual names for outputs 10 and 11:
    // angle_p1_0 is point 10 and angle_p1_1 is point 11.
    AngleGenerator angle_generator_inst (
        .end_angle  (end_angle),
        .start_angle(start_angle),
        .angle_p0   (angle0),
        .angle_p1   (angle1),
        .angle_p2   (angle2),
        .angle_p3   (angle3),
        .angle_p4   (angle4),
        .angle_p5   (angle5),
        .angle_p6   (angle6),
        .angle_p7   (angle7),
        .angle_p8   (angle8),
        .angle_p9   (angle9),
        .angle_p1_0 (angle10),
        .angle_p1_1 (angle11)
    );

    // Hold each selected angle/distance for several clocks.  This makes the
    // registered ROM_SIN output and the registered distance in CalculateXY2
    // settle before x_pixel/y_pixel are captured.
    CalculateXY2 calculate_xy_inst (
        .clk      (clk),
        .angle    (selected_angle),
        .distance (scaled_distance),
        .x_pixel  (x_pixel),
        .y_pixel  (y_pixel)
    );

    always @(*) begin
        case (point_index)
            4'd0:  begin selected_angle = angle0;  selected_distance = dist0;  end
            4'd1:  begin selected_angle = angle1;  selected_distance = dist1;  end
            4'd2:  begin selected_angle = angle2;  selected_distance = dist2;  end
            4'd3:  begin selected_angle = angle3;  selected_distance = dist3;  end
            4'd4:  begin selected_angle = angle4;  selected_distance = dist4;  end
            4'd5:  begin selected_angle = angle5;  selected_distance = dist5;  end
            4'd6:  begin selected_angle = angle6;  selected_distance = dist6;  end
            4'd7:  begin selected_angle = angle7;  selected_distance = dist7;  end
            4'd8:  begin selected_angle = angle8;  selected_distance = dist8;  end
            4'd9:  begin selected_angle = angle9;  selected_distance = dist9;  end
            4'd10: begin selected_angle = angle10; selected_distance = dist10; end
            4'd11: begin selected_angle = angle11; selected_distance = dist11; end
            default: begin selected_angle = 16'd0; selected_distance = 16'd0; end
        endcase

        // Piecewise 0..8 m display scale made only from shifts/add/subtract.
        // CalculateXY2 maps scaled_distance to roughly radius/16.
        //
        //   0..511 mm: radius ~= distance/4
        //   512..8000: radius ~= 128 + (distance-512)/64
        //
        // This enlarges very close objects while keeping the complete 8 m
        // range inside a radius of about 245 pixels. No divider is inferred.
        if (selected_distance > 16'd8000)
            scaled_distance = 16'd0;
        else if (selected_distance < 16'd512)
            scaled_distance = selected_distance << 2;
        else
            scaled_distance = 16'd2048 +
                              ((selected_distance - 16'd512) >> 2);
    end

    always @(posedge clk) begin
        if (sys_reset) begin
            point_index         <= 4'd0;
            settle_count        <= 2'd0;
            state               <= STATE_IDLE;
            parser_ack          <= 1'b0;
            point_data          <= 32'b0;
            point_ready         <= 1'b0;
            seen_packet         <= 1'b0;
            previous_start_angle <= 16'd0;
            scan_base           <= 16'd0;
            next_scan_base      <= 16'd0;
        end else begin
            // ACK is a one-clock pulse after the twelfth point is consumed.
            parser_ack <= 1'b0;

            case (state)
                STATE_IDLE: begin
                    point_ready  <= 1'b0;
                    settle_count <= 2'd0;
                    point_index  <= 4'd0;

                    if (parser_data_ready) begin
                        // Sequence numbers restart at zero when the packet
                        // start angle wraps from a high angle to a low angle.
                        if (!seen_packet ||
                            (start_angle < previous_start_angle)) begin
                            scan_base      <= 16'd0;
                            next_scan_base <= 16'd12;
                        end else begin
                            scan_base      <= next_scan_base;
                            next_scan_base <= next_scan_base + 16'd12;
                        end

                        previous_start_angle <= start_angle;
                        seen_packet          <= 1'b1;
                        state                <= STATE_SETTLE;
                    end
                end

                STATE_SETTLE: begin
                    // Four cycles per selected point are deliberately used;
                    // timing is insignificant compared with the UART rate.
                    if (settle_count == 2'd3) begin
                        settle_count <= 2'd0;

                        // Ignore zero-distance and clearly invalid coordinates.
                        if ((selected_distance != 16'd0) &&
                            (selected_distance <= 16'd8000) &&
                            (selected_angle < 16'd36000) &&
                            (x_pixel < 16'd800) &&
                            (y_pixel < 16'd600)) begin
                            point_data  <= {1'b1, 1'b0,
                                            point_sequence[9:0],
                                            x_pixel[9:0], y_pixel[9:0]};
                            point_ready <= 1'b1;
                            state       <= STATE_READY;
                        end else begin
                            // Invalid points are skipped without presenting
                            // random/off-screen coordinates to the CPU.
                            if (point_index == 4'd11) begin
                                parser_ack <= 1'b1;
                                state      <= STATE_IDLE;
                            end else begin
                                point_index <= point_index + 4'd1;
                            end
                        end
                    end else begin
                        settle_count <= settle_count + 2'd1;
                    end
                end

                STATE_READY: begin
                    // Hold point_data and point_ready until the CPU performs
                    // LW from DATA at offset +4.
                    if (data_read) begin
                        point_ready <= 1'b0;

                        if (point_index == 4'd11) begin
                            parser_ack <= 1'b1;
                            state      <= STATE_IDLE;
                        end else begin
                            point_index  <= point_index + 4'd1;
                            settle_count <= 2'd0;
                            state        <= STATE_SETTLE;
                        end
                    end
                end

                default: begin
                    state       <= STATE_IDLE;
                    point_ready <= 1'b0;
                end
            endcase
        end
    end

endmodule
