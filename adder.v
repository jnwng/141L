`timescale 1ns / 1ps

module adder
(
	input [15:0] a,
	input [15:0] b,
	output reg [15:0] out
);

always
begin
   if (b[15])
	begin
		out = a + (~b+1);
	end
	else
	begin
	   out = a + b;
	end
end

endmodule