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
// CREATED		"Tue Jul 21 02:27:49 2026"

module REG1_LD_CL_INC_DEC_SL_SR(
	LD,
	I,
	CL,
	INC,
	Ci,
	SL,
	IL,
	SR,
	IR,
	clk,
	Ei,
	DEC,
	A,
	Ci_1,
	Ei_1
);


input wire	LD;
input wire	I;
input wire	CL;
input wire	INC;
input wire	Ci;
input wire	SL;
input wire	IL;
input wire	SR;
input wire	IR;
input wire	clk;
input wire	Ei;
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
wire	notSL;
wire	notSR;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;





always@(posedge clk)
begin
	begin
	A_ALTERA_SYNTHESIZED <= D;
	end
end

assign	SYNTHESIZED_WIRE_1 = LD & I;

assign	Ei_1 = DEC & Ei & SYNTHESIZED_WIRE_0 & notLD & notCL & notINC;

assign	D = SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_7 = A_ALTERA_SYNTHESIZED ^ Ei;

assign	SYNTHESIZED_WIRE_0 =  ~A_ALTERA_SYNTHESIZED;


assign	notLD =  ~LD;

assign	notCL =  ~CL;

assign	notDEC =  ~DEC;

assign	notSL =  ~SL;

assign	notSR =  ~SR;

assign	SYNTHESIZED_WIRE_4 = notLD & SL & IL & notCL & notINC & notDEC;

assign	SYNTHESIZED_WIRE_2 = notINC & notLD & notCL & DEC & SYNTHESIZED_WIRE_7 & jedan;

assign	SYNTHESIZED_WIRE_8 = A_ALTERA_SYNTHESIZED ^ Ci;

assign	SYNTHESIZED_WIRE_3 = notLD & notCL & INC & SYNTHESIZED_WIRE_8;

assign	notINC =  ~INC;

assign	SYNTHESIZED_WIRE_5 = SR & notLD & IR & notCL & notSL & notDEC & jedan & notINC;

assign	SYNTHESIZED_WIRE_6 = notLD & notINC & notCL & notDEC & A_ALTERA_SYNTHESIZED & notSR & jedan & notSL;

assign	Ci_1 = INC & Ci & A_ALTERA_SYNTHESIZED & notLD & notCL & jedan;

assign	A = A_ALTERA_SYNTHESIZED;
assign	jedan = 1;

endmodule
