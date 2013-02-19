`timescale 1ns / 1ps

module next_pc_logic
(
   input branch,
	input target,
	input restart,
	input clock,
	input [15:0] pc_in,
	output reg [15:0] out
);

always @(posedge clock)
begin
	out = restart ? 0 :
			branch ? target :
			pc_in + 1;
end

endmodule