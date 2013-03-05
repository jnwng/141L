`timescale 1ns / 1ns

module sign_extender
(
	input [7:0] extend,
	output [15:0] extended
);

	assign extended[15:0] = { {8{extend[7]}}, extend[7:0] };
	
endmodule