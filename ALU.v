`timescale 1ns / 1ns

`define op_add 3'b000
`define op_sub 3'b001
`define op_and 3'b010
`define op_or  3'b011
`define op_epar 3'b100
`define op_branch 3'b100

module ALU
(
	input clock,
	input [15:0] res,
   input [15:0] register,
	input [2:0] ltgt,
	input eq,
	output reg compres,
   output reg [15:0] out,
   input [3:0] op
);

  reg [15:0] x;
  
  initial begin
	compres = 0;
  end
  
  always @ (op or res or register)
  begin
   case(op)
      `op_add: begin
			$display("res: %d", res);
			$display("register: %d", register);	
			if (eq) begin
				out = res + register;
				$display("Add: %d", out);
			end else begin
				out = res - register;
				$display("Sub: %d", out);
			end
		end 
	   `op_and: out = res & register;
		`op_or:  out = res | register;
		`op_epar: begin
			x = res;
			x = x ^ (x >> 8);
			x = x ^ (x >> 4);
			x = x & 8'h0F;
			out = ((16'h6996 >> x) & 1);
		end 
		   `op_branch: begin
			// input res is $c1
			// input register is $c2
			if (eq) begin
				case(ltgt)
					0:	compres = res == register;
					1: compres = res <= register;
					2: compres = res >= register;
				endcase
			end else begin
				case(register)
					0: compres = res != register;
					1: compres = res < register;
					2: compres = res > register;
				endcase
			end
		end
   endcase
	
  end
endmodule	
