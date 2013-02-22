`timescale 1ns / 1ns

module adder
(
	input [15:0] a,
	output wire [15:0] out
);

assign out = a + 1;

endmodule