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
)

	logic pc;
	logic pc_next;
	
	always @(posedge clk) begin
		
	end
	
endmodule

module instruction_rom
(
)

module pc
(
)