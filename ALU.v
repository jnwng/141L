`timescale 1ns / 1ps

`define op_add 2'b00
`define op_sub 2'b01
`define op_and 2'b10
`define op_or  2'b11

module ALU
(
	input clock,
	input [15:0] input_a,
   input [15:0] input_b,
   output reg [15:0] out,
   input [3:0] op
);
  
  reg [15:0] temp_out;  
  always @ (op or input_a or input_b)
  begin
    case(op)
      `op_add: out = input_a + input_b;
		`op_sub: out = input_a - input_b;
	   `op_and: out = input_a & input_b;
		`op_or:  out = input_a | input_b;
    endcase
  end

endmodule
