`timescale 1ns / 1ns

module sign_extender
(
	input clk,
	input [7:0] extend,
	output reg [15:0] extended
);

always @ (posedge clk) begin
	 extended[15:0] <= { {8{extend[7]}}, extend[7:0] };
end
endmodule