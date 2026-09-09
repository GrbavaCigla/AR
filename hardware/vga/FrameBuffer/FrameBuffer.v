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
// CREATED		"Tue Sep 08 11:04:39 2026"

module FrameBuffer(
	clk,
	SET_PIXEL,
	SET_BIT,
	FB_SEL,
	RESET,
	FB_ADDR,
	FB_DIN,
	X_RD,
	X_WR,
	Y_RD,
	Y_WR,
	PIXEL_ON,
	WR_PIXEL,
	OUT
);


input wire	clk;
input wire	SET_PIXEL;
input wire	SET_BIT;
input wire	FB_SEL;
input wire	RESET;
input wire	[15:0] FB_ADDR;
input wire	[7:0] FB_DIN;
input wire	[9:0] X_RD;
input wire	[9:0] X_WR;
input wire	[9:0] Y_RD;
input wire	[9:0] Y_WR;
output wire	PIXEL_ON;
output wire	WR_PIXEL;
output wire	[7:0] OUT;

wire	[15:0] ADDR_RD;
wire	[15:0] ADDR_WR;
wire	[3:0] BIT_SELECT;
wire	LD_OLD_DATA;
wire	LD_SET_SEL_X_Y;
wire	[7:0] NEW_DATA;
wire	[7:0] OLD;
wire	one;
wire	[7:0] OUT_ALTERA_SYNTHESIZED;
wire	RD_OLD;
wire	SET_BIT_SAVED;
wire	[7:0] val;
wire	WR;
wire	[7:0] WR_DATA;
reg	WR_PIXEL_ALTERA_SYNTHESIZED;
wire	[9:0] X_WR_ACTUAL;
wire	[9:0] Y_WR_ACTUAL;
wire	zero;
reg	SYNTHESIZED_WIRE_5;
wire	[7:0] SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	[9:0] SYNTHESIZED_WIRE_3;
wire	[9:0] SYNTHESIZED_WIRE_4;
reg	[2:0] DFF_inst3;

wire	[3:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_0 = {zero,X_WR[2:0]};


FrameBufferWrapper	b2v_inst(
	.RESET(RESET),
	.FB_WR(WR),
	.FB_CLK(clk),
	.FB_SEL(FB_SEL),
	.FB_ADDR_RD(ADDR_RD),
	.FB_ADDR_WR(ADDR_WR),
	.FB_DATA_IN(NEW_DATA),
	.FB_DATA_OUT(OUT_ALTERA_SYNTHESIZED),
	.FB_WR_DATA(WR_DATA));


PixelAddrCalculator	b2v_inst1(
	.X(X_RD),
	.Y(Y_RD),
	.PIXEL_ADDR(ADDR_RD));


REG8_LD_CL	b2v_inst10(
	.LD(LD_OLD_DATA),
	.CL(zero),
	.clk(clk),
	.I(WR_DATA),
	.A(OLD));


REG4_LD_CL	b2v_inst11(
	.LD(LD_SET_SEL_X_Y),
	.CL(zero),
	.clk(clk),
	.I(GDFX_TEMP_SIGNAL_0),
	.A(BIT_SELECT));


always@(posedge clk)
begin
	begin
	SYNTHESIZED_WIRE_5 <= SET_PIXEL;
	end
end


always@(posedge clk)
begin
	begin
	WR_PIXEL_ALTERA_SYNTHESIZED <= SYNTHESIZED_WIRE_5;
	end
end

assign	WR = WR_PIXEL_ALTERA_SYNTHESIZED;



REG1_LD_CL	b2v_inst15(
	.LD(LD_SET_SEL_X_Y),
	.I(SET_BIT),
	.CL(zero),
	.clk(clk),
	.A(SET_BIT_SAVED));


DEC3	b2v_inst16(
	.data(BIT_SELECT[2:0]),
	.eq0(val[0]),
	.eq1(val[1]),
	.eq2(val[2]),
	.eq3(val[3]),
	.eq4(val[4]),
	.eq5(val[5]),
	.eq6(val[6]),
	.eq7(val[7]));


REG10_LD_CL	b2v_inst17(
	.LD(LD_SET_SEL_X_Y),
	.CL(zero),
	.CLK(clk),
	.I(X_WR),
	.A(SYNTHESIZED_WIRE_3));


REG10_LD_CL	b2v_inst18(
	.LD(LD_SET_SEL_X_Y),
	.CL(zero),
	.CLK(clk),
	.I(Y_WR),
	.A(SYNTHESIZED_WIRE_4));

assign	SYNTHESIZED_WIRE_2 = val | OLD;


PixelAddrCalculator	b2v_inst2(
	.X(X_WR_ACTUAL),
	.Y(Y_WR_ACTUAL),
	.PIXEL_ADDR(ADDR_WR));

assign	SYNTHESIZED_WIRE_1 = OLD & SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_0 =  ~val;


MPX2_8BIT	b2v_inst22(
	.sel(SET_BIT_SAVED),
	.data0x(SYNTHESIZED_WIRE_1),
	.data1x(SYNTHESIZED_WIRE_2),
	.result(NEW_DATA));


MPX2_10BIT	b2v_inst23(
	.sel(SET_PIXEL),
	.data0x(SYNTHESIZED_WIRE_3),
	.data1x(X_WR),
	.result(X_WR_ACTUAL));


MPX2_10BIT	b2v_inst24(
	.sel(SET_PIXEL),
	.data0x(SYNTHESIZED_WIRE_4),
	.data1x(Y_WR),
	.result(Y_WR_ACTUAL));


always@(posedge clk)
begin
	begin
	DFF_inst3[2:0] <= X_RD[2:0];
	end
end


MPX8	b2v_inst4(
	.data7(OUT_ALTERA_SYNTHESIZED[7]),
	.data6(OUT_ALTERA_SYNTHESIZED[6]),
	.data5(OUT_ALTERA_SYNTHESIZED[5]),
	.data4(OUT_ALTERA_SYNTHESIZED[4]),
	.data3(OUT_ALTERA_SYNTHESIZED[3]),
	.data2(OUT_ALTERA_SYNTHESIZED[2]),
	.data1(OUT_ALTERA_SYNTHESIZED[1]),
	.data0(OUT_ALTERA_SYNTHESIZED[0]),
	.sel(DFF_inst3),
	.result(PIXEL_ON));

assign	LD_SET_SEL_X_Y = SET_PIXEL;





assign	LD_OLD_DATA = SYNTHESIZED_WIRE_5;


assign	WR_PIXEL = WR_PIXEL_ALTERA_SYNTHESIZED;
assign	OUT = OUT_ALTERA_SYNTHESIZED;
assign	one = 1;
assign	zero = 0;

endmodule
