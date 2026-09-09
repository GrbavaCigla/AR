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
// CREATED		"Mon Aug 10 13:15:50 2026"

module SR_32BIT(
	C0,
	A,
	B
);


input wire	C0;
input wire	[31:0] A;
output wire	[31:0] B;





assign	B[31] = C0;
assign	B[30] = A[31];
assign	B[29] = A[30];
assign	B[28] = A[29];
assign	B[27] = A[28];
assign	B[26] = A[27];
assign	B[25] = A[26];
assign	B[24] = A[25];
assign	B[23] = A[24];
assign	B[22] = A[23];
assign	B[21] = A[22];
assign	B[20] = A[21];
assign	B[19] = A[20];
assign	B[18] = A[19];
assign	B[17] = A[18];
assign	B[16] = A[17];
assign	B[15] = A[16];
assign	B[14] = A[15];
assign	B[13] = A[14];
assign	B[12] = A[13];
assign	B[11] = A[12];
assign	B[10] = A[11];
assign	B[9] = A[10];
assign	B[8] = A[9];
assign	B[7] = A[8];
assign	B[6] = A[7];
assign	B[5] = A[6];
assign	B[4] = A[5];
assign	B[3] = A[4];
assign	B[2] = A[3];
assign	B[1] = A[2];
assign	B[0] = A[1];

endmodule
