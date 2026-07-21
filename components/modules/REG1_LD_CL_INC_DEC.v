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
// CREATED		"Tue Jul 21 01:46:25 2026"

module REG1_LD_CL_INC_DEC(
	CL,
	clk,
	LD,
	I,
	Ci,
	Ei,
	INC,
	DEC,
	A,
	Ci_1,
	Ei_1
);


input wire	CL;
input wire	clk;
input wire	LD;
input wire	I;
input wire	Ci;
input wire	Ei;
input wire	INC;
input wire	DEC;
output wire	A;
output wire	Ci_1;
output wire	Ei_1;

reg	A_ALTERA_SYNTHESIZED;
wire	D;
wire	jedan;
wire	notCL;
wire	notDEC;
wire	notINC;
wire	notLD;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;





always@(posedge clk)
begin
	begin
	A_ALTERA_SYNTHESIZED <= D;
	end
end

assign	SYNTHESIZED_WIRE_1 = LD & I;

assign	notCL =  ~CL;

assign	SYNTHESIZED_WIRE_2 = notINC & notLD & notCL & DEC & SYNTHESIZED_WIRE_0 & jedan;

assign	notLD =  ~LD;

assign	SYNTHESIZED_WIRE_6 =  ~A_ALTERA_SYNTHESIZED;

assign	SYNTHESIZED_WIRE_3 = notINC & notLD & notCL & notDEC & A_ALTERA_SYNTHESIZED & jedan;


assign	D = SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_5 = A_ALTERA_SYNTHESIZED ^ Ci;

assign	SYNTHESIZED_WIRE_4 = notLD & notCL & INC & SYNTHESIZED_WIRE_5;

assign	notINC =  ~INC;

assign	notDEC =  ~DEC;

assign	Ci_1 = INC & Ci & A_ALTERA_SYNTHESIZED & notLD & notCL & jedan;

assign	SYNTHESIZED_WIRE_0 = A_ALTERA_SYNTHESIZED ^ Ei;

assign	Ei_1 = DEC & Ei & SYNTHESIZED_WIRE_6 & notLD & notCL & notINC;

assign	A = A_ALTERA_SYNTHESIZED;
assign	jedan = 1;

endmodule
