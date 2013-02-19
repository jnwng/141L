`timescale 1ns / 1ps

module mux
(
	input [1:0] sel,
	input [15:0] in2,
	input [15:0] in1,
	input [15:0] in0,
	output reg [15:0] out
);

always
begin
	case (sel)
		0: out = in0;
		1: out = in1; 
		2: out = in2;
	endcase
end

endmodule