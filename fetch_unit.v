// Copyright (C) 1991-2011 Altera Corporation
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

// PROGRAM		"Quartus II"
// VERSION		"Version 11.0 Build 208 07/03/2011 Service Pack 1 SJ Web Edition"
// CREATED		"Mon Mar 04 16:50:24 2013"

module fetch_unit(
	branch,
	restart,
	clock
);


input wire	branch;
input wire	restart;
input wire	clock;

wire	[15:0] instr_out;
wire	[15:0] one;
wire	[15:0] res;
wire	[15:0] SYNTHESIZED_WIRE_4;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	[15:0] SYNTHESIZED_WIRE_2;





instr_rom	b2v_inst(
	.pc_in(SYNTHESIZED_WIRE_4)
	);


mux_0	b2v_inst1(
	.sel(branch),
	.in0(SYNTHESIZED_WIRE_1),
	.in1(res),
	.out(SYNTHESIZED_WIRE_2));


next_pc_logic	b2v_inst3(
	.restart(restart),
	.clock(clock),
	.pc_in(SYNTHESIZED_WIRE_2),
	.next_pc(SYNTHESIZED_WIRE_4));


adder	b2v_inst4(
	.a(SYNTHESIZED_WIRE_4),
	.b(one),
	.out(SYNTHESIZED_WIRE_1));


endmodule

module mux_0(sel,in0,in1,out);
/* synthesis black_box */

input sel;
input [15:0] in0;
input [15:0] in1;
output [15:0] out;

endmodule
