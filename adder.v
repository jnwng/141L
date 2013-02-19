`timescale 1ns / 1ps

module adder
(
	input [15:0] a,
	input b,
	output reg [15:0] out
);

always
begin
   if (b)
	begin
		out = a + (~b+1);
	end
	else
	begin
	   out = a + b;
	end
end

endmodule