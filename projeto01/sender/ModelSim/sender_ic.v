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
// CREATED		"Fri Oct 21 16:08:41 2022"

module sender_ic(
	Ack,
	clk,
	Reset,
	write,
	start,
	data,
	Request,
	sdrDataOut
);


input wire	Ack;
input wire	clk;
input wire	Reset;
input wire	write;
input wire	start;
input wire	[15:0] data;
output wire	Request;
output wire	[15:0] sdrDataOut;

wire	SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	[15:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[15:0] SYNTHESIZED_WIRE_6;





sender_control	b2v_inst(
	.clk(clk),
	.Reset(Reset),
	.write(write),
	.start(start),
	.Ready(SYNTHESIZED_WIRE_0),
	.data(data),
	.memDataOut(SYNTHESIZED_WIRE_1),
	.Transmit(SYNTHESIZED_WIRE_5),
	.WriteEnable(SYNTHESIZED_WIRE_2),
	.Address(SYNTHESIZED_WIRE_3),
	.memDataIn(SYNTHESIZED_WIRE_4),
	.sdrDataIn(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst.AFTER_READ = 4'b0100;
	defparam	b2v_inst.AFTER_WRITE = 4'b0010;
	defparam	b2v_inst.IDLE = 4'b0000;
	defparam	b2v_inst.READ = 4'b0011;
	defparam	b2v_inst.TRANSMISSION = 4'b0101;
	defparam	b2v_inst.TRANSMISSION_2 = 4'b0110;
	defparam	b2v_inst.TRANSMISSION_3 = 4'b0111;
	defparam	b2v_inst.WAIT_READY = 4'b1000;
	defparam	b2v_inst.WAIT_READY_2 = 4'b1001;
	defparam	b2v_inst.WRITE = 4'b0001;


mem	b2v_inst1(
	.wren(SYNTHESIZED_WIRE_2),
	.clock(clk),
	.address(SYNTHESIZED_WIRE_3),
	.data(SYNTHESIZED_WIRE_4),
	.q(SYNTHESIZED_WIRE_1));


sender	b2v_inst2(
	.clk(clk),
	.Reset(Reset),
	.Transmit(SYNTHESIZED_WIRE_5),
	.Ack(Ack),
	.DataIn(SYNTHESIZED_WIRE_6),
	.Ready(SYNTHESIZED_WIRE_0),
	.Request(Request),
	.DataOut(sdrDataOut));
	defparam	b2v_inst2.ACKNOWLEDGE = 3'b100;
	defparam	b2v_inst2.IDLE = 3'b000;
	defparam	b2v_inst2.NEXT_TRANSMISSION = 3'b101;
	defparam	b2v_inst2.REQUEST = 3'b011;
	defparam	b2v_inst2.TRANSMIT_SIGNAL = 3'b001;
	defparam	b2v_inst2.TRANSMIT_SIGNAL_2 = 3'b010;


endmodule
