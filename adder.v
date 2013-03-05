`timescale 1ns / 1ns

module adder
(
   input clock,
	input [15:0] a,
	output reg [15:0] out
);

always @ (posedge clock) begin
	out <= a + 1;
end

endmodule