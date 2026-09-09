`timescale 1ns / 1ps

module tb_OR16;

    reg [15:0] IN;
    wire OUT;

    OR16 uut (
        .IN(IN),
        .OUT(OUT)
    );

    initial begin
        // Test 1: Sve nule -> Ocekivani izlaz: 0
        IN = 16'h0000;
        #10;
        
        // Test 2: Samo jedan bit je 1 -> Ocekivani izlaz: 1
        IN = 16'h0001;
        #10;
        
        // Test 3: Neki drugi bit je 1 -> Ocekivani izlaz: 1
        IN = 16'h0800;
        #10;
        
        // Test 4: Svi bitovi su 1 -> Ocekivani izlaz: 1
        IN = 16'hFFFF;
        #10;

        $stop;
    end

endmodule