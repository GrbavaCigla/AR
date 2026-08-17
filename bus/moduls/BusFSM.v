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
// CREATED		"Mon Aug 17 15:55:01 2026"

module BusFSM(
	mem_read,
	mem_write,
	bus_ready,
	clk,
	bus_wait
);


input wire	mem_read;
input wire	mem_write;
input wire	bus_ready;
input wire	clk;
output wire	bus_wait;

reg	bus_active;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_2;




assign	SYNTHESIZED_WIRE_0 = mem_write | mem_read;

assign	SYNTHESIZED_WIRE_4 =  ~bus_ready;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_4;


always@(posedge clk)
begin
	begin
	bus_active <= SYNTHESIZED_WIRE_2;
	end
end

assign	bus_wait = bus_active & SYNTHESIZED_WIRE_4;


endmodule
