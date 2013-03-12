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
// CREATED		"Mon Mar 11 17:40:13 2013"

module processor_3(
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
wire	[3:0] opcode;
wire	[15:0] pcplusone;
wire	[15:0] res;
wire	sign;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_62;
wire	[3:0] SYNTHESIZED_WIRE_63;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_64;
wire	[1:0] SYNTHESIZED_WIRE_17;
wire	[15:0] SYNTHESIZED_WIRE_18;
wire	[2:0] SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_22;
wire	[15:0] SYNTHESIZED_WIRE_66;
wire	[15:0] SYNTHESIZED_WIRE_67;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	[2:0] SYNTHESIZED_WIRE_68;
wire	[3:0] SYNTHESIZED_WIRE_28;
wire	[15:0] SYNTHESIZED_WIRE_31;
wire	[15:0] SYNTHESIZED_WIRE_69;
wire	SYNTHESIZED_WIRE_70;
wire	[15:0] SYNTHESIZED_WIRE_71;
wire	[15:0] SYNTHESIZED_WIRE_36;
wire	[15:0] SYNTHESIZED_WIRE_72;
wire	[15:0] SYNTHESIZED_WIRE_39;
wire	[7:0] SYNTHESIZED_WIRE_41;
wire	[2:0] SYNTHESIZED_WIRE_42;
wire	[15:0] SYNTHESIZED_WIRE_43;
wire	[15:0] SYNTHESIZED_WIRE_44;
wire	[15:0] SYNTHESIZED_WIRE_46;
wire	[1:0] SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_52;
wire	[15:0] SYNTHESIZED_WIRE_54;
wire	[7:0] SYNTHESIZED_WIRE_58;




assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;


control	b2v_control(
	.format(SYNTHESIZED_WIRE_61),
	.sign(SYNTHESIZED_WIRE_62),
	.opcode(SYNTHESIZED_WIRE_63),
	.cpin(SYNTHESIZED_WIRE_6),
	.cpout(SYNTHESIZED_WIRE_7),
	.memRead(SYNTHESIZED_WIRE_8),
	.memWrite(SYNTHESIZED_WIRE_9),
	.halt(SYNTHESIZED_WIRE_10),
	.branch(SYNTHESIZED_WIRE_11),
	.jump(SYNTHESIZED_WIRE_12),
	.regWrite(SYNTHESIZED_WIRE_13),
	.writeSrc(SYNTHESIZED_WIRE_17));


cycle_counter	b2v_inst(
	.start(init),
	.clk(clock));


mux2	b2v_inst1(
	.sel(SYNTHESIZED_WIRE_5),
	.in0(pcplusone),
	.in1(res),
	.out(SYNTHESIZED_WIRE_31));


register_ex	b2v_inst11(
	.clock(clock),
	.in_ctrl_cpin(SYNTHESIZED_WIRE_6),
	.in_ctrl_cpout(SYNTHESIZED_WIRE_7),
	.in_ctrl_memRead(SYNTHESIZED_WIRE_8),
	.in_ctrl_memWrite(SYNTHESIZED_WIRE_9),
	.in_ctrl_halt(SYNTHESIZED_WIRE_10),
	.in_ctrl_branch(SYNTHESIZED_WIRE_11),
	.in_ctrl_jump(SYNTHESIZED_WIRE_12),
	.in_ctrl_regWrite(SYNTHESIZED_WIRE_13),
	.in_sign(SYNTHESIZED_WIRE_62),
	.in_format(SYNTHESIZED_WIRE_61),
	.flush(SYNTHESIZED_WIRE_64),
	.in_ctrl_writeSrc(SYNTHESIZED_WIRE_17),
	.in_extended(SYNTHESIZED_WIRE_18),
	.in_opcode(SYNTHESIZED_WIRE_63),
	.in_operand(SYNTHESIZED_WIRE_20),
	.out_ctrl_cpin(SYNTHESIZED_WIRE_48),
	.out_ctrl_cpout(SYNTHESIZED_WIRE_49),
	.out_ctrl_memRead(SYNTHESIZED_WIRE_65),
	.out_ctrl_memWrite(SYNTHESIZED_WIRE_22),
	.out_ctrl_halt(done),
	.out_ctrl_branch(SYNTHESIZED_WIRE_70),
	.out_ctrl_jump(SYNTHESIZED_WIRE_0),
	.out_ctrl_regWrite(SYNTHESIZED_WIRE_52),
	.out_sign(SYNTHESIZED_WIRE_25),
	.out_format(SYNTHESIZED_WIRE_26),
	.out_ctrl_writeSrc(SYNTHESIZED_WIRE_47),
	.out_extended(SYNTHESIZED_WIRE_44),
	.out_opcode(SYNTHESIZED_WIRE_28),
	.out_operand(SYNTHESIZED_WIRE_68));


data_ram	b2v_inst12(
	.clk(clock),
	.ReadMem(SYNTHESIZED_WIRE_65),
	.WriteMem(SYNTHESIZED_WIRE_22),
	.DataAddress(SYNTHESIZED_WIRE_66),
	.DataIn(SYNTHESIZED_WIRE_67),
	.DataOut(SYNTHESIZED_WIRE_43));


ALU	b2v_inst2(
	.clock(clock),
	.eq(SYNTHESIZED_WIRE_25),
	.format(SYNTHESIZED_WIRE_26),
	.ltgt(SYNTHESIZED_WIRE_68),
	.op(SYNTHESIZED_WIRE_28),
	.register(SYNTHESIZED_WIRE_67),
	.res(SYNTHESIZED_WIRE_66),
	.compres(SYNTHESIZED_WIRE_64),
	.out(SYNTHESIZED_WIRE_46));


next_pc_logic	b2v_inst3(
	.init(init),
	.restart(restart),
	.clock(clock),
	.pc_in(SYNTHESIZED_WIRE_31),
	.out(SYNTHESIZED_WIRE_69));


adder	b2v_inst4(
	.clock(clock),
	
	.a(SYNTHESIZED_WIRE_69),
	.out(pcplusone));


instr_rom_3	b2v_inst5(
	.pc_in(SYNTHESIZED_WIRE_69),
	.format(format),
	.sign(sign),
	.immediate(SYNTHESIZED_WIRE_41),
	.opcode(opcode),
	.operand(SYNTHESIZED_WIRE_42));


mux2	b2v_inst7(
	.sel(SYNTHESIZED_WIRE_70),
	.in0(SYNTHESIZED_WIRE_71),
	.in1(SYNTHESIZED_WIRE_36),
	.out(SYNTHESIZED_WIRE_66));


mux2	b2v_inst8(
	.sel(SYNTHESIZED_WIRE_70),
	.in0(SYNTHESIZED_WIRE_72),
	.in1(SYNTHESIZED_WIRE_39),
	.out(SYNTHESIZED_WIRE_67));


register_id	b2v_inst9(
	.clock(clock),
	.in_format(format),
	.in_sign(sign),
	.flush(SYNTHESIZED_WIRE_64),
	.in_immediate(SYNTHESIZED_WIRE_41),
	.in_opcode(opcode),
	.in_operand(SYNTHESIZED_WIRE_42),
	.out_format(SYNTHESIZED_WIRE_61),
	.out_sign(SYNTHESIZED_WIRE_62),
	.out_immediate(SYNTHESIZED_WIRE_58),
	.out_opcode(SYNTHESIZED_WIRE_63),
	.out_operand(SYNTHESIZED_WIRE_20));


mux4	b2v_mux4(
	.in0(SYNTHESIZED_WIRE_43),
	.in1(SYNTHESIZED_WIRE_44),
	.in2(SYNTHESIZED_WIRE_71),
	.in3(SYNTHESIZED_WIRE_46),
	.sel(SYNTHESIZED_WIRE_47),
	.out(SYNTHESIZED_WIRE_54));


register_file	b2v_register_file(
	.clk(clock),
	.cpyin(SYNTHESIZED_WIRE_48),
	.cpyout(SYNTHESIZED_WIRE_49),
	.comp(SYNTHESIZED_WIRE_70),
	.memLoad(SYNTHESIZED_WIRE_65),
	.regWrite(SYNTHESIZED_WIRE_52),
	.reg_sel(SYNTHESIZED_WIRE_68),
	.write_data(SYNTHESIZED_WIRE_54),
	.cone_reg(SYNTHESIZED_WIRE_36),
	.ctwo_reg(SYNTHESIZED_WIRE_39),
	.reg_val(SYNTHESIZED_WIRE_72),
	.res_val(SYNTHESIZED_WIRE_71));


mux2	b2v_res_or_reg(
	.sel(SYNTHESIZED_WIRE_70),
	.in0(SYNTHESIZED_WIRE_72),
	.in1(SYNTHESIZED_WIRE_71),
	.out(res));


sign_extender	b2v_sign_extender(
	.extend(SYNTHESIZED_WIRE_58),
	.extended(SYNTHESIZED_WIRE_18));

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_64 & SYNTHESIZED_WIRE_70;


endmodule
