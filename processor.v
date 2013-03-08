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
// CREATED		"Wed Mar 06 21:15:36 2013"

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
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_3;
wire	[15:0] SYNTHESIZED_WIRE_34;
wire	[15:0] SYNTHESIZED_WIRE_35;
wire	[15:0] SYNTHESIZED_WIRE_8;
wire	[15:0] SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	[15:0] SYNTHESIZED_WIRE_38;
wire	[15:0] SYNTHESIZED_WIRE_13;
wire	[15:0] SYNTHESIZED_WIRE_39;
wire	[15:0] SYNTHESIZED_WIRE_16;
wire	[15:0] SYNTHESIZED_WIRE_17;
wire	[15:0] SYNTHESIZED_WIRE_18;
wire	[15:0] SYNTHESIZED_WIRE_20;
wire	[1:0] SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	[15:0] SYNTHESIZED_WIRE_26;
wire	[7:0] SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;




assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_0;


control	b2v_control(
	.format(format),
	.sign(sign),
	.opcode(opcode),
	.cpin(SYNTHESIZED_WIRE_22),
	.cpout(SYNTHESIZED_WIRE_23),
	.memRead(SYNTHESIZED_WIRE_33),
	.memWrite(SYNTHESIZED_WIRE_3),
	.halt(done),
	.branch(SYNTHESIZED_WIRE_37),
	
	.writeSrc(SYNTHESIZED_WIRE_21));


cycle_counter	b2v_inst(
	.start(init),
	.clk(clock));


mux2	b2v_inst1(
	.sel(SYNTHESIZED_WIRE_1),
	.in0(pcplusone),
	.in1(res),
	.out(SYNTHESIZED_WIRE_8));


data_ram	b2v_inst12(
	.clk(clock),
	.ReadMem(SYNTHESIZED_WIRE_33),
	.WriteMem(SYNTHESIZED_WIRE_3),
	.DataAddress(SYNTHESIZED_WIRE_34),
	.DataIn(SYNTHESIZED_WIRE_35),
	.DataOut(SYNTHESIZED_WIRE_17));


ALU	b2v_inst2(
	.clock(clock),
	.eq(sign),
	.ltgt(instr_out),
	.op(opcode),
	.register(SYNTHESIZED_WIRE_35),
	.res(SYNTHESIZED_WIRE_34),
	.compres(SYNTHESIZED_WIRE_31),
	.out(SYNTHESIZED_WIRE_20));


next_pc_logic	b2v_inst3(
	.init(init),
	.restart(restart),
	.clock(clock),
	.pc_in(SYNTHESIZED_WIRE_8),
	.out(SYNTHESIZED_WIRE_36));


adder	b2v_inst4(
	.clock(clock),
	.a(SYNTHESIZED_WIRE_36),
	.out(pcplusone));


instr_rom_3	b2v_inst6(
	.pc_in(SYNTHESIZED_WIRE_36),
	.format(format),
	.sign(sign),
	.immediate(SYNTHESIZED_WIRE_30),
	.opcode(opcode),
	.operand(instr_out));


mux2	b2v_inst7(
	.sel(SYNTHESIZED_WIRE_37),
	.in0(SYNTHESIZED_WIRE_38),
	.in1(SYNTHESIZED_WIRE_13),
	.out(SYNTHESIZED_WIRE_34));


mux2	b2v_inst8(
	.sel(SYNTHESIZED_WIRE_37),
	.in0(SYNTHESIZED_WIRE_39),
	.in1(SYNTHESIZED_WIRE_16),
	.out(SYNTHESIZED_WIRE_35));


mux4	b2v_mux4(
	.in0(SYNTHESIZED_WIRE_17),
	.in1(SYNTHESIZED_WIRE_18),
	.in2(SYNTHESIZED_WIRE_38),
	.in3(SYNTHESIZED_WIRE_20),
	.sel(SYNTHESIZED_WIRE_21),
	.out(SYNTHESIZED_WIRE_26));


register_file	b2v_register_file(
	.clk(clock),
	.cpyin(SYNTHESIZED_WIRE_22),
	.cpyout(SYNTHESIZED_WIRE_23),
	.comp(SYNTHESIZED_WIRE_37),
	.memLoad(SYNTHESIZED_WIRE_33),
	.reg_sel(instr_out),
	.write_data(SYNTHESIZED_WIRE_26),
	.cone_reg(SYNTHESIZED_WIRE_13),
	.ctwo_reg(SYNTHESIZED_WIRE_16),
	.reg_val(SYNTHESIZED_WIRE_39),
	.res_val(SYNTHESIZED_WIRE_38));


mux2	b2v_res_or_reg(
	.sel(SYNTHESIZED_WIRE_37),
	.in0(SYNTHESIZED_WIRE_39),
	.in1(SYNTHESIZED_WIRE_38),
	.out(res));


sign_extender	b2v_sign_extender(
	.extend(SYNTHESIZED_WIRE_30),
	.extended(SYNTHESIZED_WIRE_18));

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_31 & SYNTHESIZED_WIRE_37;


endmodule
