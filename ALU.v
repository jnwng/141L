`timescale 1ns / 1ps

`define op_add 2'b00
`define op_sub 2'b01
`define op_and 2'b10
`define op_or  2'b11

module ALU
(
	input clk,
	input [15:0] input_a,
   input [15:0] input_b,
   output [15:0] out,
   input [3:0] op
);
  
  reg [15:0] temp_out;
  assign out = temp_out;
  
  always @ (op or input_a or input_b)
  begin
    case(op)
      `op_add: temp_out = input_a + input_b;
		`op_sub: temp_out = input_a - input_b;
	   `op_and: temp_out = input_a & input_b;
		`op_or:  temp_out = input_a | input_b;
		`op_not:  temp_out = ~input_a;
    endcase
  end

endmodule
