`timescale 1ns / 1ns

`define op_add 3'b000
`define op_sub 3'b001
`define op_and 3'b010
`define op_or  3'b011
`define op_epar 3'b100

module ALU
(
	input clock,
	input [15:0] input_a,
   input [15:0] input_b,
   output reg [15:0] out,
   input [3:0] op
);

  reg [15:0] x;
  
  always @ (op or input_a or input_b)
  begin
   case(op)
      `op_add: out = input_a + input_b;
		`op_sub: out = input_a - input_b;
	   `op_and: out = input_a & input_b;
		`op_or:  out = input_a | input_b;
		`op_epar: begin
			x = input_a;
			x = x ^ (x >> 8);
			x = x ^ (x >> 4);
			x = x & 8'h0F;
			out = ((16'h6996 >> x) & 1);
		end 
   endcase
  end

endmodule
