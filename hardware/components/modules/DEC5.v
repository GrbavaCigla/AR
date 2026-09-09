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
// CREATED		"Sun Aug 09 02:22:23 2026"

module DEC5(
	E,
	IN,
	OUT
);


input wire	E;
input wire	[4:0] IN;
output wire	[31:0] OUT;

wire	nINPUT0;
wire	nINPUT1;
wire	nINPUT2;
wire	nINPUT3;
wire	nINPUT4;
wire	[31:0] OUT_ALTERA_SYNTHESIZED;




assign	OUT_ALTERA_SYNTHESIZED[0] = nINPUT2 & nINPUT0 & nINPUT1 & nINPUT3 & nINPUT4 & E;

assign	nINPUT0 =  ~IN[0];

assign	OUT_ALTERA_SYNTHESIZED[4] = IN[2] & nINPUT0 & nINPUT1 & nINPUT3 & nINPUT4 & E;

assign	OUT_ALTERA_SYNTHESIZED[6] = IN[2] & nINPUT0 & IN[1] & nINPUT3 & nINPUT4 & E;

assign	OUT_ALTERA_SYNTHESIZED[7] = IN[2] & IN[0] & IN[1] & nINPUT3 & nINPUT4 & E;

assign	OUT_ALTERA_SYNTHESIZED[8] = nINPUT2 & nINPUT0 & nINPUT1 & IN[3] & nINPUT4 & E;

assign	OUT_ALTERA_SYNTHESIZED[9] = nINPUT2 & IN[0] & nINPUT1 & IN[3] & nINPUT4 & E;

assign	OUT_ALTERA_SYNTHESIZED[10] = nINPUT2 & nINPUT0 & IN[1] & IN[3] & nINPUT4 & E;

assign	OUT_ALTERA_SYNTHESIZED[11] = nINPUT2 & IN[0] & IN[1] & IN[3] & nINPUT4 & E;

assign	OUT_ALTERA_SYNTHESIZED[12] = IN[2] & nINPUT0 & nINPUT1 & IN[3] & nINPUT4 & E;

assign	OUT_ALTERA_SYNTHESIZED[13] = IN[2] & IN[0] & nINPUT1 & IN[3] & nINPUT4 & E;

assign	OUT_ALTERA_SYNTHESIZED[14] = IN[2] & nINPUT0 & IN[1] & IN[3] & nINPUT4 & E;

assign	nINPUT1 =  ~IN[1];

assign	OUT_ALTERA_SYNTHESIZED[15] = IN[2] & IN[0] & IN[1] & IN[3] & nINPUT4 & E;

assign	OUT_ALTERA_SYNTHESIZED[16] = nINPUT2 & nINPUT0 & nINPUT1 & nINPUT3 & IN[4] & E;

assign	OUT_ALTERA_SYNTHESIZED[17] = nINPUT2 & IN[0] & nINPUT1 & nINPUT3 & IN[4] & E;

assign	OUT_ALTERA_SYNTHESIZED[18] = nINPUT2 & nINPUT0 & IN[1] & nINPUT3 & IN[4] & E;

assign	OUT_ALTERA_SYNTHESIZED[19] = nINPUT2 & IN[0] & IN[1] & nINPUT3 & IN[4] & E;

assign	OUT_ALTERA_SYNTHESIZED[20] = IN[2] & nINPUT0 & nINPUT1 & nINPUT3 & IN[4] & E;

assign	OUT_ALTERA_SYNTHESIZED[21] = IN[2] & IN[0] & nINPUT1 & nINPUT3 & IN[4] & E;

assign	OUT_ALTERA_SYNTHESIZED[22] = IN[2] & nINPUT0 & IN[1] & nINPUT3 & IN[4] & E;

assign	OUT_ALTERA_SYNTHESIZED[23] = IN[2] & IN[0] & IN[1] & nINPUT3 & IN[4] & E;

assign	OUT_ALTERA_SYNTHESIZED[24] = nINPUT2 & nINPUT0 & nINPUT1 & IN[3] & IN[4] & E;

assign	nINPUT2 =  ~IN[2];

assign	OUT_ALTERA_SYNTHESIZED[25] = nINPUT2 & IN[0] & nINPUT1 & IN[3] & IN[4] & E;

assign	OUT_ALTERA_SYNTHESIZED[26] = nINPUT2 & nINPUT0 & IN[1] & IN[3] & IN[4] & E;

assign	OUT_ALTERA_SYNTHESIZED[27] = nINPUT2 & IN[0] & IN[1] & IN[3] & IN[4] & E;

assign	OUT_ALTERA_SYNTHESIZED[28] = IN[2] & nINPUT0 & nINPUT1 & IN[3] & IN[4] & E;

assign	OUT_ALTERA_SYNTHESIZED[29] = IN[2] & IN[0] & nINPUT1 & IN[3] & IN[4] & E;

assign	OUT_ALTERA_SYNTHESIZED[30] = IN[2] & nINPUT0 & IN[1] & IN[3] & IN[4] & E;

assign	OUT_ALTERA_SYNTHESIZED[31] = IN[2] & IN[0] & IN[1] & IN[3] & IN[4] & E;

assign	nINPUT3 =  ~IN[3];

assign	nINPUT4 =  ~IN[4];

assign	OUT_ALTERA_SYNTHESIZED[1] = nINPUT2 & IN[0] & nINPUT1 & nINPUT3 & nINPUT4 & E;

assign	OUT_ALTERA_SYNTHESIZED[2] = nINPUT2 & nINPUT0 & IN[1] & nINPUT3 & nINPUT4 & E;

assign	OUT_ALTERA_SYNTHESIZED[3] = nINPUT2 & IN[0] & IN[1] & nINPUT3 & nINPUT4 & E;

assign	OUT_ALTERA_SYNTHESIZED[5] = IN[2] & IN[0] & nINPUT1 & nINPUT3 & nINPUT4 & E;

assign	OUT = OUT_ALTERA_SYNTHESIZED;

endmodule
