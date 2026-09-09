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
// CREATED		"Mon Jul 20 17:40:22 2026"

module REG1_LD_CL(
	CL,
	clk,
	LD,
	I,
	A
);


input wire	CL;
input wire	clk;
input wire	LD;
input wire	I;
output wire	A;

reg	A_ALTERA_SYNTHESIZED;
wire	D;
wire	notCL;
wire	notLD;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;





always@(posedge clk)
begin
	begin
	A_ALTERA_SYNTHESIZED <= D;
	end
end

assign	SYNTHESIZED_WIRE_1 = LD & I;

assign	notCL =  ~CL;

assign	notLD =  ~LD;

assign	D = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_0 = notLD & notCL & A_ALTERA_SYNTHESIZED;

assign	A = A_ALTERA_SYNTHESIZED;

endmodule
