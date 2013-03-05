// Copyright (C) 1991-2012 Altera Corporation
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
// VERSION		"Version 12.1 Build 177 11/07/2012 SJ Web Edition"
// CREATED		"Mon Mar 04 21:39:40 2013"

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
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_4;
wire	[15:0] SYNTHESIZED_WIRE_28;
wire	[15:0] SYNTHESIZED_WIRE_29;
wire	[15:0] SYNTHESIZED_WIRE_9;
wire	[15:0] SYNTHESIZED_WIRE_30;
wire	[15:0] SYNTHESIZED_WIRE_12;
wire	[15:0] SYNTHESIZED_WIRE_13;
wire	[15:0] SYNTHESIZED_WIRE_15;
wire	[1:0] SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_31;
wire	[15:0] SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_25;




assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;


control	b2v_control(
	.format(format),
	.sign(sign),
	.opcode(opcode),
	.cpin(SYNTHESIZED_WIRE_17),
	.cpout(SYNTHESIZED_WIRE_18),
	.memRead(SYNTHESIZED_WIRE_27),
	.memWrite(SYNTHESIZED_WIRE_4),
	.halt(done),
	.branch(SYNTHESIZED_WIRE_31),
	.jump(SYNTHESIZED_WIRE_0),
	.writeSrc(SYNTHESIZED_WIRE_16));


cycle_counter	b2v_inst(
	.start(init),
	.clk(clock));


mux2	b2v_inst1(
	.sel(SYNTHESIZED_WIRE_2),
	.in0(pcplusone),
	.in1(res),
	.out(SYNTHESIZED_WIRE_9));


data_ram	b2v_inst12(
	.clk(clock),
	.ReadMem(SYNTHESIZED_WIRE_27),
	.WriteMem(SYNTHESIZED_WIRE_4),
	.DataAddress(SYNTHESIZED_WIRE_28),
	.DataIn(SYNTHESIZED_WIRE_29),
	.DataOut(SYNTHESIZED_WIRE_12));


ALU	b2v_inst2(
	.clock(clock),
	.eq(sign),
	.ltgt(instr_out),
	.op(opcode),
	.register(SYNTHESIZED_WIRE_29),
	.res(SYNTHESIZED_WIRE_28),
	.compres(SYNTHESIZED_WIRE_25),
	.out(SYNTHESIZED_WIRE_15));


next_pc_logic	b2v_inst3(
	.init(init),
	.restart(restart),
	.clock(clock),
	.pc_in(SYNTHESIZED_WIRE_9),
	.out(SYNTHESIZED_WIRE_30));


adder	b2v_inst4(
	.clock(clock),
	.a(SYNTHESIZED_WIRE_30),
	.out(pcplusone));


instr_rom_1	b2v_instr_rom(
	.pc_in(SYNTHESIZED_WIRE_30),
	.format(format),
	.sign(sign),
	.immediate(immediate),
	.opcode(opcode),
	.operand(instr_out));


mux4	b2v_mux4(
	.in0(SYNTHESIZED_WIRE_12),
	.in1(SYNTHESIZED_WIRE_13),
	.in2(SYNTHESIZED_WIRE_28),
	.in3(SYNTHESIZED_WIRE_15),
	.sel(SYNTHESIZED_WIRE_16),
	.out(SYNTHESIZED_WIRE_21));


register_file	b2v_register_file(
	.clk(clock),
	.cpyin(SYNTHESIZED_WIRE_17),
	.cpyout(SYNTHESIZED_WIRE_18),
	.comp(SYNTHESIZED_WIRE_31),
	.memLoad(SYNTHESIZED_WIRE_27),
	.reg_sel(instr_out),
	.write_data(SYNTHESIZED_WIRE_21),
	.reg_val(SYNTHESIZED_WIRE_29),
	.res_val(SYNTHESIZED_WIRE_28));


mux2	b2v_res_or_reg(
	.sel(SYNTHESIZED_WIRE_31),
	.in0(SYNTHESIZED_WIRE_29),
	.in1(SYNTHESIZED_WIRE_28),
	.out(res));


sign_extender	b2v_sign_extender(
	.extend(immediate),
	.extended(SYNTHESIZED_WIRE_13));

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_25 & SYNTHESIZED_WIRE_31;


endmodule
