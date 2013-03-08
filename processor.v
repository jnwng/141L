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
// CREATED		"Fri Mar 08 00:27:12 2013"

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
wire	[2:0] instr_out;
wire	[3:0] opcode;
wire	[15:0] pcplusone;
wire	[15:0] res;
wire	sign;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_4;
wire	[15:0] SYNTHESIZED_WIRE_36;
wire	[15:0] SYNTHESIZED_WIRE_37;
wire	[15:0] SYNTHESIZED_WIRE_9;
wire	[15:0] SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	[15:0] SYNTHESIZED_WIRE_40;
wire	[15:0] SYNTHESIZED_WIRE_13;
wire	[15:0] SYNTHESIZED_WIRE_41;
wire	[15:0] SYNTHESIZED_WIRE_16;
wire	[15:0] SYNTHESIZED_WIRE_18;
wire	[15:0] SYNTHESIZED_WIRE_19;
wire	[15:0] SYNTHESIZED_WIRE_21;
wire	[1:0] SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_27;
wire	[15:0] SYNTHESIZED_WIRE_28;
wire	[7:0] SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;




assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;


control	b2v_control(
	.format(format),
	.sign(sign),
	.opcode(opcode),
	.cpin(SYNTHESIZED_WIRE_23),
	.cpout(SYNTHESIZED_WIRE_24),
	.memRead(SYNTHESIZED_WIRE_35),
	.memWrite(SYNTHESIZED_WIRE_4),
	.halt(done),
	.branch(SYNTHESIZED_WIRE_39),
	.jump(SYNTHESIZED_WIRE_0),
	.regWrite(SYNTHESIZED_WIRE_27),
	.writeSrc(SYNTHESIZED_WIRE_22));


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
	.ReadMem(SYNTHESIZED_WIRE_35),
	.WriteMem(SYNTHESIZED_WIRE_4),
	.DataAddress(SYNTHESIZED_WIRE_36),
	.DataIn(SYNTHESIZED_WIRE_37),
	.DataOut(SYNTHESIZED_WIRE_18));


ALU	b2v_inst2(
	.clock(clock),
	.eq(sign),
	.ltgt(instr_out),
	.op(opcode),
	.register(SYNTHESIZED_WIRE_37),
	.res(SYNTHESIZED_WIRE_36),
	.compres(SYNTHESIZED_WIRE_33),
	.out(SYNTHESIZED_WIRE_21));


next_pc_logic	b2v_inst3(
	.init(init),
	.restart(restart),
	.clock(clock),
	.pc_in(SYNTHESIZED_WIRE_9),
	.out(SYNTHESIZED_WIRE_38));


adder	b2v_inst4(
	.clock(clock),
	.a(SYNTHESIZED_WIRE_38),
	.out(pcplusone));


mux2	b2v_inst7(
	.sel(SYNTHESIZED_WIRE_39),
	.in0(SYNTHESIZED_WIRE_40),
	.in1(SYNTHESIZED_WIRE_13),
	.out(SYNTHESIZED_WIRE_36));


mux2	b2v_inst8(
	.sel(SYNTHESIZED_WIRE_39),
	.in0(SYNTHESIZED_WIRE_41),
	.in1(SYNTHESIZED_WIRE_16),
	.out(SYNTHESIZED_WIRE_37));


instr_rom_1	b2v_instr_rom(
	.pc_in(SYNTHESIZED_WIRE_38),
	.format(format),
	.sign(sign),
	.immediate(SYNTHESIZED_WIRE_32),
	.opcode(opcode),
	.operand(instr_out));


mux4	b2v_mux4(
	.in0(SYNTHESIZED_WIRE_18),
	.in1(SYNTHESIZED_WIRE_19),
	.in2(SYNTHESIZED_WIRE_40),
	.in3(SYNTHESIZED_WIRE_21),
	.sel(SYNTHESIZED_WIRE_22),
	.out(SYNTHESIZED_WIRE_28));


register_file	b2v_register_file(
	.clk(clock),
	.cpyin(SYNTHESIZED_WIRE_23),
	.cpyout(SYNTHESIZED_WIRE_24),
	.comp(SYNTHESIZED_WIRE_39),
	.memLoad(SYNTHESIZED_WIRE_35),
	.regWrite(SYNTHESIZED_WIRE_27),
	.reg_sel(instr_out),
	.write_data(SYNTHESIZED_WIRE_28),
	.cone_reg(SYNTHESIZED_WIRE_13),
	.ctwo_reg(SYNTHESIZED_WIRE_16),
	.reg_val(SYNTHESIZED_WIRE_41),
	.res_val(SYNTHESIZED_WIRE_40));


mux2	b2v_res_or_reg(
	.sel(SYNTHESIZED_WIRE_39),
	.in0(SYNTHESIZED_WIRE_41),
	.in1(SYNTHESIZED_WIRE_40),
	.out(res));


sign_extender	b2v_sign_extender(
	.extend(SYNTHESIZED_WIRE_32),
	.extended(SYNTHESIZED_WIRE_19));

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_33 & SYNTHESIZED_WIRE_39;


endmodule
