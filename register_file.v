`timescale 1ns / 1ns
// This is a Verilog description for a register file

module register_file
(
	input clk,							// clock
   input cpyin,						// are we copying value from a res into a register
	input cpyout,						// are we copying a value out?
	input [2:0] reg_sel,			   // select a register
	output [15:0] res_val,		   // value of res
	output [15:0] reg_val,			// value of specified register
	input [15:0] write_data,		// write data from alu
	input comp
);
  
   reg [15:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, res;
	
	
	always @ (cpyout) begin
		case (reg_sel)
			3'b000:	reg0 <= res_val;
			3'b001:	reg1 <= res_val;
			3'b010:	reg2 <= res_val;
			3'b011:	reg3 <= res_val;
			3'b100:	reg4 <= res_val;
			3'b101:	reg5 <= res_val;
			3'b110:	reg6 <= res_val;
			3'b111:	reg7 <= res_val;
		endcase
	end
	
	always @ (cpyin) begin
		res <= reg_val;
	end
	
	assign res_val = res;
	assign reg_val = reg_sel == 3'b000 ? reg0 :
						  reg_sel == 3'b001 ? reg1 :
						  reg_sel == 3'b010 ? reg2 :
						  reg_sel == 3'b011 ? reg3 :
						  reg_sel == 3'b100 ? reg4 :
						  reg_sel == 3'b101 ? reg5 :
						  reg_sel == 3'b110 ? reg6 : reg7 ;
	
	always @(posedge clk) begin
		res <= write_data;
	end

endmodule	