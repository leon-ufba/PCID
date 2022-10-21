// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Fri Oct 21 17:06:47 2022"

module receiver_ic(
	clk,
	Reset,
	Request,
	DataIn,
	Ack,
	q
);


input wire	clk;
input wire	Reset;
input wire	Request;
input wire	[15:0] DataIn;
output wire	Ack;
output wire	[15:0] q;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[15:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[3:0] SYNTHESIZED_WIRE_4;
wire	[15:0] SYNTHESIZED_WIRE_5;

assign	Ack = SYNTHESIZED_WIRE_0;




receiver_control	b2v_inst(
	.clk(clk),
	.Reset(Reset),
	.Ack(SYNTHESIZED_WIRE_0),
	.Ready(SYNTHESIZED_WIRE_1),
	.rcvDataOut(SYNTHESIZED_WIRE_2),
	.WriteEnable(SYNTHESIZED_WIRE_3),
	.Address(SYNTHESIZED_WIRE_4),
	.memDataIn(SYNTHESIZED_WIRE_5));
	defparam	b2v_inst.IDLE = 4'b0000;
	defparam	b2v_inst.WRITE = 4'b0001;


receiver	b2v_inst1(
	.clk(clk),
	.Reset(Reset),
	.Request(Request),
	.DataIn(DataIn),
	.Ack(SYNTHESIZED_WIRE_0),
	.Ready(SYNTHESIZED_WIRE_1),
	.DataOut(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst1.IDLE = 3'b000;
	defparam	b2v_inst1.REQUEST_SIGNAL = 3'b001;
	defparam	b2v_inst1.WAIT_WRITE = 3'b010;


mem	b2v_inst3(
	.wren(SYNTHESIZED_WIRE_3),
	.clock(clk),
	.address(SYNTHESIZED_WIRE_4),
	.data(SYNTHESIZED_WIRE_5),
	.q(q));


endmodule
