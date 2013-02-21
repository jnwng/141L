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
// CREATED		"Mon Feb 18 19:41:57 2013"

module processor(
	clock,
	restart,
	one,
	init,
	done
);


input wire	clock;
input wire	restart;
input wire	one;
input wire	init;
output wire	done;

wire	[2:0] instr_out;
wire	[15:0] res;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[15:0] SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_3;
wire	[15:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_26;
wire	[3:0] SYNTHESIZED_WIRE_27;
wire	[15:0] SYNTHESIZED_WIRE_28;
wire	[15:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_29;
wire	[15:0] SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	[15:0] SYNTHESIZED_WIRE_17;
wire	[1:0] SYNTHESIZED_WIRE_18;
wire	[7:0] SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_23;




assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;


instr_rom_1	b2v_inst(
	.pc_in(SYNTHESIZED_WIRE_25),
	.format(SYNTHESIZED_WIRE_14),
	.sign(SYNTHESIZED_WIRE_26),
	.immediate(SYNTHESIZED_WIRE_19),
	.opcode(SYNTHESIZED_WIRE_27),
	.operand(instr_out));


mux_0	b2v_inst1(
	.sel(SYNTHESIZED_WIRE_3),
	.in0(SYNTHESIZED_WIRE_4),
	.in1(res),
	.out(SYNTHESIZED_WIRE_8));


ALU	b2v_inst2(
	.clock(clock),
	.eq(SYNTHESIZED_WIRE_26),
	.ltgt(instr_out),
	.op(SYNTHESIZED_WIRE_27),
	.register(SYNTHESIZED_WIRE_28),
	.res(res),
	.compres(SYNTHESIZED_WIRE_23),
	.out(res));


next_pc_logic	b2v_inst3(
	.init(init),
	.restart(restart),
	.clock(clock),
	.pc_in(SYNTHESIZED_WIRE_8),
	.out(SYNTHESIZED_WIRE_25));


adder	b2v_inst4(
	
	.a(SYNTHESIZED_WIRE_25),
	.out(SYNTHESIZED_WIRE_4));
	


register_file	b2v_inst5(
	.clk(clock),
	.cpyin(SYNTHESIZED_WIRE_10),
	.cpyout(SYNTHESIZED_WIRE_11),
	.comp(SYNTHESIZED_WIRE_29),
	.reg_sel(instr_out),
	.write_data(SYNTHESIZED_WIRE_13),
	.reg_val(SYNTHESIZED_WIRE_28),
	.res_val(res));


control	b2v_inst6(
	.clk(clock),
	.format(SYNTHESIZED_WIRE_14),
	.sign(SYNTHESIZED_WIRE_26),
	.opcode(SYNTHESIZED_WIRE_27),
	.cpin(SYNTHESIZED_WIRE_10),
	.cpout(SYNTHESIZED_WIRE_11),
	.memRead(SYNTHESIZED_WIRE_20),
	.memWrite(SYNTHESIZED_WIRE_21),
	.halt(done),
	.branch(SYNTHESIZED_WIRE_29),
	.jump(SYNTHESIZED_WIRE_0),
	.writeSrc(SYNTHESIZED_WIRE_18));


mux_1	b2v_inst7(
	.in0(SYNTHESIZED_WIRE_17),
	.in1(res),
	.in2(res),
	.sel(SYNTHESIZED_WIRE_18),
	.out(SYNTHESIZED_WIRE_13));


sign_extender	b2v_inst8(
	.clk(clock),
	.extend(SYNTHESIZED_WIRE_19),
	.extended(res));


instr_ram	b2v_inst9(
	.clk(clock),
	.ReadMem(SYNTHESIZED_WIRE_20),
	.WriteMem(SYNTHESIZED_WIRE_21),
	.DataAddress(res),
	.DataIn(SYNTHESIZED_WIRE_28),
	.DataOut(SYNTHESIZED_WIRE_17));

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_23 & SYNTHESIZED_WIRE_29;


endmodule

module mux_0(sel,in0,in1,out);
/* synthesis black_box */

input sel;
input [15:0] in0;
input [15:0] in1;
output [15:0] out;

endmodule

module mux_1(in0,in1,in2,sel,out);
/* synthesis black_box */

input [15:0] in0;
input [15:0] in1;
input [15:0] in2;
input [1:0] sel;
output [15:0] out;

endmodule
