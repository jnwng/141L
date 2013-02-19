`timescale 1ns / 1ps

module next_pc_logic
(
	input init,
	input restart,
	input clock,
	input [15:0] pc_in,
	output reg [15:0] out
);

always @(posedge clock)
begin
	if (init) begin
		out = 4'b0000;
	end else begin
		out = restart ? 0 : pc_in;
	end
end

endmodule