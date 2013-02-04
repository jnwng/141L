`timescale 1ns / 1ps

module mux
(
	input sel,
	input in1,
	input in0,
	output reg out
);

always
begin
	out = sel ? in1 : in0;
end

endmodule