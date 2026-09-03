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
// CREATED		"Thu Sep 03 18:30:43 2026"

module VgaBusInterface(
	cs_vga,
	bus_wr,
	PIXEL_CHANGED,
	clk,
	bus_wdata,
	SET_PIXEL,
	SET_BIT,
	vga_ready,
	SEL,
	vga_rdata,
	XIN,
	YIN
);


input wire	cs_vga;
input wire	bus_wr;
input wire	PIXEL_CHANGED;
input wire	clk;
input wire	[31:0] bus_wdata;
output wire	SET_PIXEL;
output wire	SET_BIT;
output wire	vga_ready;
output wire	SEL;
output wire	[31:0] vga_rdata;
output wire	[9:0] XIN;
output wire	[9:0] YIN;

reg	busy;
wire	D_busy;
wire	d_done;
reg	done;
wire	keep_busy;
wire	n_bus_wr;
wire	n_busy;
wire	n_done;
wire	n_pixel_changed;
wire	read_ack;
wire	start;
wire	SYNTHESIZED_WIRE_0;

assign	SET_BIT = bus_wdata[31];
assign	vga_rdata = 32'b00000000000000000000000000000000;
assign	XIN = bus_wdata[9:0];
assign	YIN = bus_wdata[19:10];



assign	n_pixel_changed =  ~PIXEL_CHANGED;

assign	start = SYNTHESIZED_WIRE_0 & n_busy & n_done & n_pixel_changed;

assign	keep_busy = busy & n_pixel_changed;

assign	D_busy = keep_busy | start;

assign	d_done = busy & PIXEL_CHANGED;

assign	SEL = start & bus_wdata[30];

assign	n_bus_wr =  ~bus_wr;

assign	read_ack = cs_vga & n_bus_wr;

assign	vga_ready = done | read_ack;



always@(posedge clk)
begin
	begin
	busy <= D_busy;
	end
end


always@(posedge clk)
begin
	begin
	done <= d_done;
	end
end

assign	SYNTHESIZED_WIRE_0 = cs_vga & bus_wr;

assign	n_busy =  ~busy;

assign	n_done =  ~done;

assign	SET_PIXEL = start;

endmodule
