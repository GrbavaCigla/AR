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
// CREATED		"Mon Aug 10 13:05:05 2026"

module OR2_32BIT(
	A,
	B,
	C
);


input wire	[31:0] A;
input wire	[31:0] B;
output wire	[31:0] C;

wire	[31:0] C_ALTERA_SYNTHESIZED;




assign	C_ALTERA_SYNTHESIZED[7] = B[7] | A[7];

assign	C_ALTERA_SYNTHESIZED[8] = B[8] | A[8];

assign	C_ALTERA_SYNTHESIZED[2] = B[2] | A[2];

assign	C_ALTERA_SYNTHESIZED[3] = B[3] | A[3];

assign	C_ALTERA_SYNTHESIZED[4] = B[4] | A[4];

assign	C_ALTERA_SYNTHESIZED[5] = B[5] | A[5];

assign	C_ALTERA_SYNTHESIZED[0] = B[0] | A[0];

assign	C_ALTERA_SYNTHESIZED[6] = B[6] | A[6];

assign	C_ALTERA_SYNTHESIZED[23] = B[23] | A[23];

assign	C_ALTERA_SYNTHESIZED[24] = B[24] | A[24];

assign	C_ALTERA_SYNTHESIZED[25] = B[25] | A[25];

assign	C_ALTERA_SYNTHESIZED[26] = B[26] | A[26];

assign	C_ALTERA_SYNTHESIZED[9] = B[9] | A[9];

assign	C_ALTERA_SYNTHESIZED[27] = B[27] | A[27];

assign	C_ALTERA_SYNTHESIZED[28] = B[28] | A[28];

assign	C_ALTERA_SYNTHESIZED[29] = B[29] | A[29];

assign	C_ALTERA_SYNTHESIZED[30] = B[30] | A[30];

assign	C_ALTERA_SYNTHESIZED[31] = B[31] | A[31];

assign	C_ALTERA_SYNTHESIZED[16] = B[16] | A[16];

assign	C_ALTERA_SYNTHESIZED[17] = B[17] | A[17];

assign	C_ALTERA_SYNTHESIZED[18] = B[18] | A[18];

assign	C_ALTERA_SYNTHESIZED[19] = B[19] | A[19];

assign	C_ALTERA_SYNTHESIZED[10] = B[10] | A[10];

assign	C_ALTERA_SYNTHESIZED[20] = B[20] | A[20];

assign	C_ALTERA_SYNTHESIZED[21] = B[21] | A[21];

assign	C_ALTERA_SYNTHESIZED[22] = B[22] | A[22];

assign	C_ALTERA_SYNTHESIZED[12] = B[12] | A[12];

assign	C_ALTERA_SYNTHESIZED[11] = B[11] | A[11];

assign	C_ALTERA_SYNTHESIZED[13] = B[13] | A[13];

assign	C_ALTERA_SYNTHESIZED[14] = B[14] | A[14];

assign	C_ALTERA_SYNTHESIZED[15] = B[15] | A[15];

assign	C_ALTERA_SYNTHESIZED[1] = B[1] | A[1];

assign	C = C_ALTERA_SYNTHESIZED;

endmodule
