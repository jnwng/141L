// This is a Verilog description for a register file

module register_file
  (input clk,							// clock
	input res_in,						// output into res
	input mem_write,					// write into res from memory data
	input [2:0] reg_sel,			   // select a register
	output [15:0] res_val,		   // value of res
	output [15:0] reg_val,			// value of specified register
	input [15:0] write_data);     // write data from alu
  
   reg [15:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, res;
	
	assign res_val = res;
	assign reg_val = reg_sel == 0 ? reg0 :
						  reg_sel == 1 ? reg1 :
						  reg_sel == 2 ? reg2 :
						  reg_sel == 3 ? reg3 :
						  reg_sel == 4 ? reg4 :
						  reg_sel == 5 ? reg5 :
						  reg_sel == 6 ? reg6 :
						  reg_sel == 7 ? reg7 :
						  reg_sel == 8 ? reg8 : 0;
	
	always @(posedge clk) begin
		if (mem_write)
			res <= write_data;
	end

  
endmodule