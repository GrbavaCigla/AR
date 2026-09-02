module VGADebug(
    input wire clk,
    input wire reset,

    input wire bus_wr,
    input wire cs_vga,
    input wire [31:0] bus_addr,
    input wire [31:0] bus_wdata,

    output reg [7:0] debug_code
);

reg [9:0] expected_x;
reg [9:0] expected_y;

reg [10:0] pixel_count;

reg request_seen;
reg waiting_for_switch;
reg finished;
reg failed;

wire vga_request;

assign vga_request = bus_wr & cs_vga;


always @(posedge clk)
begin

    if (!reset)
    begin
        debug_code <= 8'd0;

        expected_x <= 10'd300;
        expected_y <= 10'd220;

        pixel_count <= 11'd0;

        request_seen <= 1'b0;
        waiting_for_switch <= 1'b0;
        finished <= 1'b0;
        failed <= 1'b0;
    end

    else
    begin

        // Omogucava da jedan SW brojimo samo jednom,
        // cak i ako bus_wr ostane visok nekoliko clockova.
        if (!vga_request)
            request_seen <= 1'b0;


        if (vga_request &&
            !request_seen &&
            !finished &&
            !failed)
        begin

            request_seen <= 1'b1;


            // -----------------------------------------
            // FAZA 1: ocekujemo 1600 pixel write-ova
            // -----------------------------------------
            if (!waiting_for_switch)
            begin

                if (
                    (bus_addr == 32'h20000000) &&
                    (bus_wdata[31] == 1'b1) &&
                    (bus_wdata[30] == 1'b0) &&
                    (bus_wdata[9:0] == expected_x) &&
                    (bus_wdata[19:10] == expected_y)
                   )
                begin

                    // prvi piksel je dobar
                    if (pixel_count == 11'd0)
                        debug_code <= 8'd111;


                    // upravo smo dobili 1600-ti piksel
                    if (pixel_count == 11'd1599)
                    begin
                        debug_code <= 8'd160;
                        waiting_for_switch <= 1'b1;
                        pixel_count <= pixel_count + 1'b1;
                    end

                    else
                    begin
                        pixel_count <= pixel_count + 1'b1;

                        if (expected_x == 10'd339)
                        begin
                            expected_x <= 10'd300;
                            expected_y <= expected_y + 1'b1;
                        end
                        else
                        begin
                            expected_x <= expected_x + 1'b1;
                        end
                    end

                end

                else
                begin
                    debug_code <= 8'd222;
                    failed <= 1'b1;
                end

            end


            // -----------------------------------------
            // FAZA 2: posle kvadrata ocekujemo FB switch
            // -----------------------------------------
            else
            begin

                if (
                    (bus_addr == 32'h20000000) &&
                    (bus_wdata == 32'h40000000)
                   )
                begin
                    debug_code <= 8'd200;
                    finished <= 1'b1;
                end

                else
                begin
                    debug_code <= 8'd222;
                    failed <= 1'b1;
                end

            end

        end
    end
end

endmodule