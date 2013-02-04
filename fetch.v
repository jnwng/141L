`timescale 1ns / 1ps

module fetch
(
	input clock,
	input start,
	input branch,
	input target,
	input taken,
	output instruction_data,
	output instruction_addr
);

	always @(posedge clock) begin
		
	end
	
endmodule
