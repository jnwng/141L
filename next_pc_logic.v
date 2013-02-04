`timescale 1ns / 1ps

module next_pc_logic
(
	input restart,
	input [15:0] pc_in,
	input clock,
	output reg [15:0] next_pc
);

always @(posedge clock)
begin
	next_pc = restart ? 0 : pc_in;
end

endmodule