-- Copyright (C) 1991-2011 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II"
-- VERSION		"Version 11.0 Build 208 07/03/2011 Service Pack 1 SJ Web Edition"
-- CREATED		"Mon Mar 11 17:32:23 2013"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY processor_3 IS 
	PORT
	(
		restart :  IN  STD_LOGIC;
		init :  IN  STD_LOGIC;
		clock :  IN  STD_LOGIC;
		done :  OUT  STD_LOGIC
	);
END processor_3;

ARCHITECTURE bdf_type OF processor_3 IS 

COMPONENT control
	PORT(format : IN STD_LOGIC;
		 sign : IN STD_LOGIC;
		 opcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 cpin : OUT STD_LOGIC;
		 cpout : OUT STD_LOGIC;
		 memRead : OUT STD_LOGIC;
		 memWrite : OUT STD_LOGIC;
		 halt : OUT STD_LOGIC;
		 branch : OUT STD_LOGIC;
		 jump : OUT STD_LOGIC;
		 regWrite : OUT STD_LOGIC;
		 writeSrc : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT cycle_counter
	PORT(start : IN STD_LOGIC;
		 clk : IN STD_LOGIC
	);
END COMPONENT;

COMPONENT mux2
	PORT(sel : IN STD_LOGIC;
		 in0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register_ex
	PORT(clock : IN STD_LOGIC;
		 in_ctrl_cpin : IN STD_LOGIC;
		 in_ctrl_cpout : IN STD_LOGIC;
		 in_ctrl_memRead : IN STD_LOGIC;
		 in_ctrl_memWrite : IN STD_LOGIC;
		 in_ctrl_halt : IN STD_LOGIC;
		 in_ctrl_branch : IN STD_LOGIC;
		 in_ctrl_jump : IN STD_LOGIC;
		 in_ctrl_regWrite : IN STD_LOGIC;
		 in_sign : IN STD_LOGIC;
		 in_format : IN STD_LOGIC;
		 flush : IN STD_LOGIC;
		 in_ctrl_writeSrc : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 in_extended : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 in_opcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 in_operand : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 out_ctrl_cpin : OUT STD_LOGIC;
		 out_ctrl_cpout : OUT STD_LOGIC;
		 out_ctrl_memRead : OUT STD_LOGIC;
		 out_ctrl_memWrite : OUT STD_LOGIC;
		 out_ctrl_halt : OUT STD_LOGIC;
		 out_ctrl_branch : OUT STD_LOGIC;
		 out_ctrl_jump : OUT STD_LOGIC;
		 out_ctrl_regWrite : OUT STD_LOGIC;
		 out_sign : OUT STD_LOGIC;
		 out_format : OUT STD_LOGIC;
		 out_ctrl_writeSrc : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 out_extended : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 out_opcode : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 out_operand : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT data_ram
	PORT(clk : IN STD_LOGIC;
		 ReadMem : IN STD_LOGIC;
		 WriteMem : IN STD_LOGIC;
		 DataAddress : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 DataIn : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 DataOut : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alu
	PORT(clock : IN STD_LOGIC;
		 eq : IN STD_LOGIC;
		 format : IN STD_LOGIC;
		 ltgt : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 op : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 register : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 res : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 compres : OUT STD_LOGIC;
		 out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT next_pc_logic
	PORT(init : IN STD_LOGIC;
		 restart : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 pc_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT adder
	PORT(clock : IN STD_LOGIC;
		 stall : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT instr_rom_3
	PORT(pc_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 format : OUT STD_LOGIC;
		 sign : OUT STD_LOGIC;
		 immediate : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 opcode : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 operand : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register_id
	PORT(clock : IN STD_LOGIC;
		 in_format : IN STD_LOGIC;
		 in_sign : IN STD_LOGIC;
		 flush : IN STD_LOGIC;
		 in_immediate : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 in_opcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 in_operand : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 out_format : OUT STD_LOGIC;
		 out_sign : OUT STD_LOGIC;
		 out_immediate : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 out_opcode : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 out_operand : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux4
	PORT(in0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 in2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 in3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register_file
	PORT(clk : IN STD_LOGIC;
		 cpyin : IN STD_LOGIC;
		 cpyout : IN STD_LOGIC;
		 comp : IN STD_LOGIC;
		 memLoad : IN STD_LOGIC;
		 regWrite : IN STD_LOGIC;
		 reg_sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 write_data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 cone_reg : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 ctwo_reg : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 reg_val : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 res_val : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sign_extender
	PORT(extend : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 extended : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	format :  STD_LOGIC;
SIGNAL	opcode :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	pcplusone :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	res :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	sign :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_61 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_62 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_63 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_64 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_65 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_66 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_67 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_68 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_69 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_70 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_71 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_36 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_72 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_39 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_41 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_42 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_43 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_44 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_46 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_47 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_48 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_49 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_52 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_54 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_58 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



SYNTHESIZED_WIRE_5 <= SYNTHESIZED_WIRE_0 OR SYNTHESIZED_WIRE_1;


b2v_control : control
PORT MAP(format => SYNTHESIZED_WIRE_61,
		 sign => SYNTHESIZED_WIRE_62,
		 opcode => SYNTHESIZED_WIRE_63,
		 cpin => SYNTHESIZED_WIRE_6,
		 cpout => SYNTHESIZED_WIRE_7,
		 memRead => SYNTHESIZED_WIRE_8,
		 memWrite => SYNTHESIZED_WIRE_9,
		 halt => SYNTHESIZED_WIRE_10,
		 branch => SYNTHESIZED_WIRE_11,
		 jump => SYNTHESIZED_WIRE_12,
		 regWrite => SYNTHESIZED_WIRE_13,
		 writeSrc => SYNTHESIZED_WIRE_17);


b2v_inst : cycle_counter
PORT MAP(start => init,
		 clk => clock);


b2v_inst1 : mux2
PORT MAP(sel => SYNTHESIZED_WIRE_5,
		 in0 => pcplusone,
		 in1 => res,
		 out => SYNTHESIZED_WIRE_31);


b2v_inst11 : register_ex
PORT MAP(clock => clock,
		 in_ctrl_cpin => SYNTHESIZED_WIRE_6,
		 in_ctrl_cpout => SYNTHESIZED_WIRE_7,
		 in_ctrl_memRead => SYNTHESIZED_WIRE_8,
		 in_ctrl_memWrite => SYNTHESIZED_WIRE_9,
		 in_ctrl_halt => SYNTHESIZED_WIRE_10,
		 in_ctrl_branch => SYNTHESIZED_WIRE_11,
		 in_ctrl_jump => SYNTHESIZED_WIRE_12,
		 in_ctrl_regWrite => SYNTHESIZED_WIRE_13,
		 in_sign => SYNTHESIZED_WIRE_62,
		 in_format => SYNTHESIZED_WIRE_61,
		 flush => SYNTHESIZED_WIRE_64,
		 in_ctrl_writeSrc => SYNTHESIZED_WIRE_17,
		 in_extended => SYNTHESIZED_WIRE_18,
		 in_opcode => SYNTHESIZED_WIRE_63,
		 in_operand => SYNTHESIZED_WIRE_20,
		 out_ctrl_cpin => SYNTHESIZED_WIRE_48,
		 out_ctrl_cpout => SYNTHESIZED_WIRE_49,
		 out_ctrl_memRead => SYNTHESIZED_WIRE_65,
		 out_ctrl_memWrite => SYNTHESIZED_WIRE_22,
		 out_ctrl_halt => done,
		 out_ctrl_branch => SYNTHESIZED_WIRE_70,
		 out_ctrl_jump => SYNTHESIZED_WIRE_0,
		 out_ctrl_regWrite => SYNTHESIZED_WIRE_52,
		 out_sign => SYNTHESIZED_WIRE_25,
		 out_format => SYNTHESIZED_WIRE_26,
		 out_ctrl_writeSrc => SYNTHESIZED_WIRE_47,
		 out_extended => SYNTHESIZED_WIRE_44,
		 out_opcode => SYNTHESIZED_WIRE_28,
		 out_operand => SYNTHESIZED_WIRE_68);


b2v_inst12 : data_ram
PORT MAP(clk => clock,
		 ReadMem => SYNTHESIZED_WIRE_65,
		 WriteMem => SYNTHESIZED_WIRE_22,
		 DataAddress => SYNTHESIZED_WIRE_66,
		 DataIn => SYNTHESIZED_WIRE_67,
		 DataOut => SYNTHESIZED_WIRE_43);


b2v_inst2 : alu
PORT MAP(clock => clock,
		 eq => SYNTHESIZED_WIRE_25,
		 format => SYNTHESIZED_WIRE_26,
		 ltgt => SYNTHESIZED_WIRE_68,
		 op => SYNTHESIZED_WIRE_28,
		 register => SYNTHESIZED_WIRE_67,
		 res => SYNTHESIZED_WIRE_66,
		 compres => SYNTHESIZED_WIRE_64,
		 out => SYNTHESIZED_WIRE_46);


b2v_inst3 : next_pc_logic
PORT MAP(init => init,
		 restart => restart,
		 clock => clock,
		 pc_in => SYNTHESIZED_WIRE_31,
		 out => SYNTHESIZED_WIRE_69);


b2v_inst4 : adder
PORT MAP(clock => clock,
		 a => SYNTHESIZED_WIRE_69,
		 out => pcplusone);


b2v_inst5 : instr_rom_3
PORT MAP(pc_in => SYNTHESIZED_WIRE_69,
		 format => format,
		 sign => sign,
		 immediate => SYNTHESIZED_WIRE_41,
		 opcode => opcode,
		 operand => SYNTHESIZED_WIRE_42);


b2v_inst7 : mux2
PORT MAP(sel => SYNTHESIZED_WIRE_70,
		 in0 => SYNTHESIZED_WIRE_71,
		 in1 => SYNTHESIZED_WIRE_36,
		 out => SYNTHESIZED_WIRE_66);


b2v_inst8 : mux2
PORT MAP(sel => SYNTHESIZED_WIRE_70,
		 in0 => SYNTHESIZED_WIRE_72,
		 in1 => SYNTHESIZED_WIRE_39,
		 out => SYNTHESIZED_WIRE_67);


b2v_inst9 : register_id
PORT MAP(clock => clock,
		 in_format => format,
		 in_sign => sign,
		 flush => SYNTHESIZED_WIRE_64,
		 in_immediate => SYNTHESIZED_WIRE_41,
		 in_opcode => opcode,
		 in_operand => SYNTHESIZED_WIRE_42,
		 out_format => SYNTHESIZED_WIRE_61,
		 out_sign => SYNTHESIZED_WIRE_62,
		 out_immediate => SYNTHESIZED_WIRE_58,
		 out_opcode => SYNTHESIZED_WIRE_63,
		 out_operand => SYNTHESIZED_WIRE_20);


b2v_mux4 : mux4
PORT MAP(in0 => SYNTHESIZED_WIRE_43,
		 in1 => SYNTHESIZED_WIRE_44,
		 in2 => SYNTHESIZED_WIRE_71,
		 in3 => SYNTHESIZED_WIRE_46,
		 sel => SYNTHESIZED_WIRE_47,
		 out => SYNTHESIZED_WIRE_54);


b2v_register_file : register_file
PORT MAP(clk => clock,
		 cpyin => SYNTHESIZED_WIRE_48,
		 cpyout => SYNTHESIZED_WIRE_49,
		 comp => SYNTHESIZED_WIRE_70,
		 memLoad => SYNTHESIZED_WIRE_65,
		 regWrite => SYNTHESIZED_WIRE_52,
		 reg_sel => SYNTHESIZED_WIRE_68,
		 write_data => SYNTHESIZED_WIRE_54,
		 cone_reg => SYNTHESIZED_WIRE_36,
		 ctwo_reg => SYNTHESIZED_WIRE_39,
		 reg_val => SYNTHESIZED_WIRE_72,
		 res_val => SYNTHESIZED_WIRE_71);


b2v_res_or_reg : mux2
PORT MAP(sel => SYNTHESIZED_WIRE_70,
		 in0 => SYNTHESIZED_WIRE_72,
		 in1 => SYNTHESIZED_WIRE_71,
		 out => res);


b2v_sign_extender : sign_extender
PORT MAP(extend => SYNTHESIZED_WIRE_58,
		 extended => SYNTHESIZED_WIRE_18);


SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_64 AND SYNTHESIZED_WIRE_70;


END bdf_type;