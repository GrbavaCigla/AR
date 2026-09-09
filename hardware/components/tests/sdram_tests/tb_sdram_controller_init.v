`timescale 1ns / 1ps

module tb_sdram_controller();

    // Ulazi za modul pod testom (DUT)
    reg CLK;
    reg RESET;

    // Izlazi iz modula
    wire STATE_INIT;
    wire STATE_PALL;

    // Instanciranje SDRAM kontrolera
    sdram_controller uut (
        .CLK(CLK),
        .RESET(RESET),
        .STATE_INIT(STATE_INIT),
        .STATE_PALL(STATE_PALL)
    );

    // Generisanje takta (50 MHz -> perioda 20ns)
    always begin
        #10 CLK = ~CLK;
    end

    // Test sekvenca
    initial begin
        // Inicijalizacija signala
        CLK = 0;
        RESET = 0;

        // 1. Primena RESET signala na početku (traje 40ns)
        #20;
        RESET = 1;
        #40;
        RESET = 0;

        // 2. Čekanje da brojač izbroji 10.000 taktova i okine INIT_DONE
        // Pri 50MHz to je oko 200 mikrosekundi (200,000 ns)
        #205000;

        // Kraj simulacije
        $display("Test zavrsen! Proveri u spektru da li je STATE_PALL presao u 1.");
        $finish;
    end

endmodule