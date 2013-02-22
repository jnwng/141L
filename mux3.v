`timescale 1ns / 1ns

module mux4
(
	input [1:0] sel,
	input [15:0] in2,
	input [15:0] in1,
	input [15:0] in0,
	input [15:0] in3,
	output wire [15:0] out
);

assign out = (sel==0) ? in0 :
				 (sel==1) ? in1 :
				 (sel==2) ? in2 :
				 in3;

endmodule