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
// CREATED		"Wed Aug 26 18:41:10 2026"

module FrameBuffer(
	clk,
	SET_PIXEL,
	SET_BIT,
	FB_ADDR,
	FB_DIN,
	X,
	Y,
	PIXEL_ON,
	WR_PIXEL,
	OUT
);


input wire	clk;
input wire	SET_PIXEL;
input wire	SET_BIT;
input wire	[15:0] FB_ADDR;
input wire	[7:0] FB_DIN;
input wire	[9:0] X;
input wire	[9:0] Y;
output wire	PIXEL_ON;
output wire	WR_PIXEL;
output wire	[7:0] OUT;

wire	[3:0] BIT_SELECT;
wire	LD_BIT_SELECT;
wire	LD_OLD_DATA;
wire	[7:0] NEW_DATA;
wire	[7:0] OLD;
wire	one;
wire	[7:0] OUT_ALTERA_SYNTHESIZED;
wire	[15:0] PIXEL_ADDR;
wire	RD_OLD;
wire	[7:0] val;
wire	WR;
reg	WR_PIXEL_ALTERA_SYNTHESIZED;
wire	zero;
reg	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;
reg	[2:0] DFF_inst3;

wire	[3:0] GDFX_TEMP_SIGNAL_2;
wire	[15:0] GDFX_TEMP_SIGNAL_3;
wire	[15:0] GDFX_TEMP_SIGNAL_0;
wire	[15:0] GDFX_TEMP_SIGNAL_1;


assign	GDFX_TEMP_SIGNAL_2 = {zero,X[2:0]};
assign	GDFX_TEMP_SIGNAL_3 = {zero,zero,zero,zero,zero,zero,zero,zero,zero,X[9:3]};
assign	GDFX_TEMP_SIGNAL_0 = {zero,zero,Y[9:0],zero,zero,zero,zero};
assign	GDFX_TEMP_SIGNAL_1 = {Y[9:0],zero,zero,zero,zero,zero,zero};


FrameBufferWrapper	b2v_inst(
	.FB_WR(WR),
	.FB_CLK(clk),
	.FB_ADDR(PIXEL_ADDR),
	.FB_DATA_IN(NEW_DATA),
	.FB_DATA_OUT(OUT_ALTERA_SYNTHESIZED));


ADD16	b2v_inst1(
	.C_0(zero),
	.A(GDFX_TEMP_SIGNAL_0),
	.B(GDFX_TEMP_SIGNAL_1),
	.C(SYNTHESIZED_WIRE_0),
	.OUT(SYNTHESIZED_WIRE_1));


REG8_LD_CL	b2v_inst10(
	.LD(LD_OLD_DATA),
	
	.clk(clk),
	.I(OUT_ALTERA_SYNTHESIZED),
	.A(OLD));


REG4_LD_CL	b2v_inst11(
	.LD(LD_BIT_SELECT),
	
	.clk(clk),
	.I(GDFX_TEMP_SIGNAL_2),
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

assign	SYNTHESIZED_WIRE_4 = val | OLD;


ADD16	b2v_inst2(
	.C_0(SYNTHESIZED_WIRE_0),
	.A(GDFX_TEMP_SIGNAL_3),
	.B(SYNTHESIZED_WIRE_1),
	
	.OUT(PIXEL_ADDR));

assign	SYNTHESIZED_WIRE_3 = OLD & SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_2 =  ~val;


MPX2_8BIT	b2v_inst22(
	.sel(SET_BIT),
	.data0x(SYNTHESIZED_WIRE_3),
	.data1x(SYNTHESIZED_WIRE_4),
	.result(NEW_DATA));


always@(posedge clk)
begin
	begin
	DFF_inst3[2:0] <= X[2:0];
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

assign	LD_BIT_SELECT = SET_PIXEL;





assign	LD_OLD_DATA = SYNTHESIZED_WIRE_5;


assign	WR_PIXEL = WR_PIXEL_ALTERA_SYNTHESIZED;
assign	OUT = OUT_ALTERA_SYNTHESIZED;
assign	one = 1;
assign	zero = 0;

endmodule
