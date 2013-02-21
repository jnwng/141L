`timescale 1ns / 1ps

module adder
(
	input [15:0] a,
	output reg [15:0] out
);

always
	begin
	   out = a + 1;
	end

endmodule