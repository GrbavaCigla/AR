`timescale 1ns / 1ps

module tb_AND16;

    // Ulaz (16-bitna magistrala)
    reg [15:0] IN;

    // Izlaz (1-bitni signal)
    wire OUT;

    // Povezivanje tvoje komponente (UUT)
    AND16 uut (
        .IN(IN),
        .OUT(OUT)
    );

    initial begin
        // Test 1: Sve nule na ulazu -> Ocekivani izlaz: 0
        IN = 16'h0000;
        #10;
        
        // Test 2: Neki bitovi su 1, ali ne svi -> Ocekivani izlaz: 0
        IN = 16'h7FFF; // Svi su 1 osim najviseg bita
        #10;
        
        // Test 3: Drugi skup bitova -> Ocekivani izlaz: 0
        IN = 16'hAAAA;
        #10;
        
        // Test 4: SVI bitovi su 1 -> Ocekivani izlaz: 1
        IN = 16'hFFFF;
        #10;

        $stop; // Zaustavi simulaciju
    end

endmodule