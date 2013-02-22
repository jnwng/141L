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
// CREATED		"Thu Feb 21 14:39:22 2013"


module mux_1(in0,in1,in2,sel,out);
input [15:0] in0;
input [15:0] in1;
input [15:0] in2;
input [1:0] sel;
output [15:0] out;

mux	lpm_instance(.in0(in0),.in1(in1),.in2(in2),.sel(sel),.out(out));

endmodule
