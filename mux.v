`timescale 1ns / 1ps

module mux
(
	input sel,
	input [15:0] in1,
	input [15:0] in0,
	output reg [15:0] out
);

always
begin
	out = sel ? in1 : in0;
end

endmodule