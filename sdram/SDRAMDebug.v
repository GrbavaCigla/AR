module SDRAMDebug(
    input  wire       clk,
    input  wire       reset_n,

    input  wire       write_pulse,
    input  wire       read_pulse,
    input  wire       ready_sdram,

    output reg [7:0]  debug_code
);

reg [1:0] pending_operation;

// pending_operation:
// 00 = nema zahteva
// 01 = cekamo zavrsetak WRITE
// 10 = cekamo zavrsetak READ

always @(posedge clk)
begin

    // reset_n je ACTIVE LOW
    if (!reset_n)
    begin
        debug_code       <= 8'd0;
        pending_operation <= 2'b00;
    end

    else
    begin

        // ---------------------------
        // Detektovan WRITE zahtev
        // ---------------------------
        if (write_pulse)
        begin
            debug_code        <= 8'd111;
            pending_operation <= 2'b01;
        end

        // ---------------------------
        // Detektovan READ zahtev
        // ---------------------------
        else if (read_pulse)
        begin
            debug_code        <= 8'd123;
            pending_operation <= 2'b10;
        end

        // ---------------------------
        // SDRAM je zavrsio operaciju
        // ---------------------------
        else if (ready_sdram)
        begin

            // zavrsio WRITE
            if (pending_operation == 2'b01)
            begin
                debug_code        <= 8'd222;
                pending_operation <= 2'b00;
            end

            // zavrsio READ
            else if (pending_operation == 2'b10)
            begin
                debug_code        <= 8'd200;
                pending_operation <= 2'b00;
            end

            // ready se pojavio bez prethodnog zahteva
            else
            begin
                debug_code <= 8'd255;
            end

        end

    end

end

endmodule