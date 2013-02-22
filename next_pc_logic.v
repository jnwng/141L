`timescale 1ns / 1ns

module next_pc_logic
(
	input init,
	input restart,
	input clock,
	input [15:0] pc_in,
	output wire [15:0] out
);

reg [15:0] temp_out;

always @(negedge clock)
begin
	if (init) begin
		temp_out = 0;
	end else begin
		temp_out = pc_in;
	end
end

assign out = temp_out;

endmodule