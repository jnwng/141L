`timescale 1ns / 1ns

module sign_extender
(
	input [7:0] extend,
	output [15:0] extended
);

	// we don't ever res negative numbers.
	// assign extended[15:0] = { {8{extend[7]}}, extend[7:0] };
	//
	assign extended[15:8] = 8'b00000000;
	assign extended[7:0] = extend;
	
endmodule