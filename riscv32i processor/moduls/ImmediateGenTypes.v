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
// CREATED		"Tue Aug 11 00:33:02 2026"

module ImmediateGenTypes(
	INSTR,
	B_TYPE,
	I_TYPE,
	J_TYPE,
	S_TYPE,
	U_TYPE
);


input wire	[31:0] INSTR;
output wire	[31:0] B_TYPE;
output wire	[31:0] I_TYPE;
output wire	[31:0] J_TYPE;
output wire	[31:0] S_TYPE;
output wire	[31:0] U_TYPE;

wire	0;





assign	B_TYPE[31] = INSTR[31];
assign	B_TYPE[30] = INSTR[31];
assign	B_TYPE[29] = INSTR[31];
assign	B_TYPE[28] = INSTR[31];
assign	B_TYPE[27] = INSTR[31];
assign	B_TYPE[26] = INSTR[31];
assign	B_TYPE[25] = INSTR[31];
assign	B_TYPE[24] = INSTR[31];
assign	B_TYPE[23] = INSTR[31];
assign	B_TYPE[22] = INSTR[31];
assign	B_TYPE[21] = INSTR[31];
assign	B_TYPE[20] = INSTR[31];
assign	B_TYPE[19] = INSTR[31];
assign	B_TYPE[18] = INSTR[31];
assign	B_TYPE[17] = INSTR[31];
assign	B_TYPE[16] = INSTR[31];
assign	B_TYPE[15] = INSTR[31];
assign	B_TYPE[14] = INSTR[31];
assign	B_TYPE[13] = INSTR[31];
assign	B_TYPE[12] = INSTR[31];
assign	B_TYPE[11] = INSTR[7];
assign	B_TYPE[10:5] = INSTR[30:25];
assign	B_TYPE[4:1] = INSTR[11:8];
assign	B_TYPE[0] = 0;
assign	I_TYPE[31] = INSTR[31];
assign	I_TYPE[30] = INSTR[31];
assign	I_TYPE[29] = INSTR[31];
assign	I_TYPE[28] = INSTR[31];
assign	I_TYPE[27] = INSTR[31];
assign	I_TYPE[26] = INSTR[31];
assign	I_TYPE[25] = INSTR[31];
assign	I_TYPE[24] = INSTR[31];
assign	I_TYPE[23] = INSTR[31];
assign	I_TYPE[22] = INSTR[31];
assign	I_TYPE[21] = INSTR[31];
assign	I_TYPE[20] = INSTR[31];
assign	I_TYPE[19] = INSTR[31];
assign	I_TYPE[18] = INSTR[31];
assign	I_TYPE[17] = INSTR[31];
assign	I_TYPE[16] = INSTR[31];
assign	I_TYPE[15] = INSTR[31];
assign	I_TYPE[14] = INSTR[31];
assign	I_TYPE[13] = INSTR[31];
assign	I_TYPE[12] = INSTR[31];
assign	I_TYPE[11] = INSTR[31];
assign	I_TYPE[10:0] = INSTR[30:20];
assign	J_TYPE[31] = INSTR[31];
assign	J_TYPE[30] = INSTR[31];
assign	J_TYPE[29] = INSTR[31];
assign	J_TYPE[28] = INSTR[31];
assign	J_TYPE[27] = INSTR[31];
assign	J_TYPE[26] = INSTR[31];
assign	J_TYPE[25] = INSTR[31];
assign	J_TYPE[24] = INSTR[31];
assign	J_TYPE[23] = INSTR[31];
assign	J_TYPE[22] = INSTR[31];
assign	J_TYPE[21] = INSTR[31];
assign	J_TYPE[20] = INSTR[31];
assign	J_TYPE[19:12] = INSTR[19:12];
assign	J_TYPE[11] = INSTR[20];
assign	J_TYPE[10:1] = INSTR[30:21];
assign	J_TYPE[0] = 0;
assign	S_TYPE[31] = INSTR[31];
assign	S_TYPE[30] = INSTR[31];
assign	S_TYPE[29] = INSTR[31];
assign	S_TYPE[28] = INSTR[31];
assign	S_TYPE[27] = INSTR[31];
assign	S_TYPE[26] = INSTR[31];
assign	S_TYPE[25] = INSTR[31];
assign	S_TYPE[24] = INSTR[31];
assign	S_TYPE[23] = INSTR[31];
assign	S_TYPE[22] = INSTR[31];
assign	S_TYPE[21] = INSTR[31];
assign	S_TYPE[20] = INSTR[31];
assign	S_TYPE[19] = INSTR[31];
assign	S_TYPE[18] = INSTR[31];
assign	S_TYPE[17] = INSTR[31];
assign	S_TYPE[16] = INSTR[31];
assign	S_TYPE[15] = INSTR[31];
assign	S_TYPE[14] = INSTR[31];
assign	S_TYPE[13] = INSTR[31];
assign	S_TYPE[12] = INSTR[31];
assign	S_TYPE[11] = INSTR[31];
assign	S_TYPE[10:5] = INSTR[30:25];
assign	S_TYPE[4:0] = INSTR[11:7];
assign	U_TYPE[31:12] = INSTR[31:12];
assign	U_TYPE[11] = 0;
assign	U_TYPE[10] = 0;
assign	U_TYPE[9] = 0;
assign	U_TYPE[8] = 0;
assign	U_TYPE[7] = 0;
assign	U_TYPE[6] = 0;
assign	U_TYPE[5] = 0;
assign	U_TYPE[4] = 0;
assign	U_TYPE[3] = 0;
assign	U_TYPE[2] = 0;
assign	U_TYPE[1] = 0;
assign	U_TYPE[0] = 0;
assign	0 = 0;

endmodule
