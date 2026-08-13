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
// CREATED		"Thu Aug 13 02:53:27 2026"

module XOR2_32BIT(
	A,
	B,
	C
);


input wire	[31:0] A;
input wire	[31:0] B;
output wire	[31:0] C;

wire	[31:0] C_ALTERA_SYNTHESIZED;




assign	C_ALTERA_SYNTHESIZED[0] = A[0] ^ B[0];

assign	C_ALTERA_SYNTHESIZED[1] = A[1] ^ B[1];

assign	C_ALTERA_SYNTHESIZED[9] = A[9] ^ B[9];

assign	C_ALTERA_SYNTHESIZED[10] = A[10] ^ B[10];

assign	C_ALTERA_SYNTHESIZED[18] = A[18] ^ B[18];

assign	C_ALTERA_SYNTHESIZED[11] = A[11] ^ B[11];

assign	C_ALTERA_SYNTHESIZED[12] = A[12] ^ B[12];

assign	C_ALTERA_SYNTHESIZED[16] = A[16] ^ B[16];

assign	C_ALTERA_SYNTHESIZED[13] = A[13] ^ B[13];

assign	C_ALTERA_SYNTHESIZED[14] = A[14] ^ B[14];

assign	C_ALTERA_SYNTHESIZED[15] = A[15] ^ B[15];

assign	C_ALTERA_SYNTHESIZED[19] = A[19] ^ B[19];

assign	C_ALTERA_SYNTHESIZED[2] = A[2] ^ B[2];

assign	C_ALTERA_SYNTHESIZED[20] = A[20] ^ B[20];

assign	C_ALTERA_SYNTHESIZED[21] = A[21] ^ B[21];

assign	C_ALTERA_SYNTHESIZED[22] = A[22] ^ B[22];

assign	C_ALTERA_SYNTHESIZED[23] = A[23] ^ B[23];

assign	C_ALTERA_SYNTHESIZED[24] = A[24] ^ B[24];

assign	C_ALTERA_SYNTHESIZED[25] = A[25] ^ B[25];

assign	C_ALTERA_SYNTHESIZED[26] = A[26] ^ B[26];

assign	C_ALTERA_SYNTHESIZED[27] = A[27] ^ B[27];

assign	C_ALTERA_SYNTHESIZED[28] = A[28] ^ B[28];

assign	C_ALTERA_SYNTHESIZED[29] = A[29] ^ B[29];

assign	C_ALTERA_SYNTHESIZED[3] = A[3] ^ B[3];

assign	C_ALTERA_SYNTHESIZED[30] = A[30] ^ B[30];

assign	C_ALTERA_SYNTHESIZED[31] = A[31] ^ B[31];

assign	C_ALTERA_SYNTHESIZED[4] = A[4] ^ B[4];

assign	C_ALTERA_SYNTHESIZED[17] = A[17] ^ B[17];

assign	C_ALTERA_SYNTHESIZED[5] = A[5] ^ B[5];

assign	C_ALTERA_SYNTHESIZED[6] = A[6] ^ B[6];

assign	C_ALTERA_SYNTHESIZED[7] = A[7] ^ B[7];

assign	C_ALTERA_SYNTHESIZED[8] = A[8] ^ B[8];

assign	C = C_ALTERA_SYNTHESIZED;

endmodule
