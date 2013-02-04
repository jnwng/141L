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
// CREATED		"Mon Feb 04 14:33:03 2013"


module mux_0(sel,in0,in1,out);
input sel;
input [15:0] in0;
input [15:0] in1;
output [15:0] out;

mux	lpm_instance(.sel(sel),.in0(in0),.in1(in1),.out(out));

endmodule
