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
// CREATED		"Mon Mar 04 16:50:45 2013"

module processor(
	restart,
	init,
	clock,
	done
);


input wire	restart;
input wire	init;
input wire	clock;
output wire	done;

wire	format;
wire	[7:0] immediate;
wire	[2:0] instr_out;
wire	[3:0] opcode;
wire	[15:0] pcplusone;
wire	[15:0] res;
wire	sign;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_4;
wire	[15:0] SYNTHESIZED_WIRE_29;
wire	[15:0] SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_7;
wire	[15:0] SYNTHESIZED_WIRE_10;
wire	[15:0] SYNTHESIZED_WIRE_31;
wire	[15:0] SYNTHESIZED_WIRE_13;
wire	[15:0] SYNTHESIZED_WIRE_14;
wire	[15:0] SYNTHESIZED_WIRE_16;
wire	[1:0] SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_32;
wire	[15:0] SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_26;




assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;


control	b2v_control(
	.format(format),
	.sign(sign),
	.opcode(opcode),
	.cpin(SYNTHESIZED_WIRE_18),
	.cpout(SYNTHESIZED_WIRE_19),
	.memRead(SYNTHESIZED_WIRE_28),
	.memWrite(SYNTHESIZED_WIRE_4),
	.halt(done),
	.branch(SYNTHESIZED_WIRE_32),
	.jump(SYNTHESIZED_WIRE_0),
	.signOut(SYNTHESIZED_WIRE_7),
	.writeSrc(SYNTHESIZED_WIRE_17));


cycle_counter	b2v_inst(
	.start(init),
	.clk(clock));


mux2	b2v_inst1(
	.sel(SYNTHESIZED_WIRE_2),
	.in0(pcplusone),
	.in1(res),
	.out(SYNTHESIZED_WIRE_10));


data_ram	b2v_inst12(
	.clk(clock),
	.ReadMem(SYNTHESIZED_WIRE_28),
	.WriteMem(SYNTHESIZED_WIRE_4),
	.DataAddress(SYNTHESIZED_WIRE_29),
	.DataIn(SYNTHESIZED_WIRE_30),
	.DataOut(SYNTHESIZED_WIRE_13));


ALU	b2v_inst2(
	.clock(clock),
	.eq(SYNTHESIZED_WIRE_7),
	.ltgt(instr_out),
	.op(opcode),
	.register(SYNTHESIZED_WIRE_30),
	.res(SYNTHESIZED_WIRE_29),
	.compres(SYNTHESIZED_WIRE_26),
	.out(SYNTHESIZED_WIRE_16));


next_pc_logic	b2v_inst3(
	.init(init),
	.restart(restart),
	.clock(clock),
	.pc_in(SYNTHESIZED_WIRE_10),
	.out(SYNTHESIZED_WIRE_31));


adder	b2v_inst4(
	.a(SYNTHESIZED_WIRE_31),
	.out(pcplusone));


instr_rom_1	b2v_instr_rom(
	.pc_in(SYNTHESIZED_WIRE_31),
	.format(format),
	.sign(sign),
	.immediate(immediate),
	.opcode(opcode),
	.operand(instr_out));


mux4	b2v_mux4(
	.in0(SYNTHESIZED_WIRE_13),
	.in1(SYNTHESIZED_WIRE_14),
	.in2(SYNTHESIZED_WIRE_29),
	.in3(SYNTHESIZED_WIRE_16),
	.sel(SYNTHESIZED_WIRE_17),
	.out(SYNTHESIZED_WIRE_22));


register_file	b2v_register_file(
	.clk(clock),
	.cpyin(SYNTHESIZED_WIRE_18),
	.cpyout(SYNTHESIZED_WIRE_19),
	.comp(SYNTHESIZED_WIRE_32),
	.memLoad(SYNTHESIZED_WIRE_28),
	.reg_sel(instr_out),
	.write_data(SYNTHESIZED_WIRE_22),
	.reg_val(SYNTHESIZED_WIRE_30),
	.res_val(SYNTHESIZED_WIRE_29));


mux2	b2v_res_or_reg(
	.sel(SYNTHESIZED_WIRE_32),
	.in0(SYNTHESIZED_WIRE_30),
	.in1(SYNTHESIZED_WIRE_29),
	.out(res));


sign_extender	b2v_sign_extender(
	.extend(immediate),
	.extended(SYNTHESIZED_WIRE_14));

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_26 & SYNTHESIZED_WIRE_32;


endmodule
