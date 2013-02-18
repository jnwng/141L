`timescale 1ns / 1ns
 
module INSTR_ROM_TB;
	reg [15:0] pc_in;
	wire [9:0] instr_out;
	reg clock;
	instr_rom rom (pc_in, instr_out);
	
	initial
		$monitor($time, , pc_in, instr_out);
			
	initial
	begin
		pc_in = 0;
		#10 pc_in = 1;
		#10 pc_in = 2;
		#10 pc_in = 3;
		#10 pc_in = 4;
		#10 pc_in = 5;
		#10 pc_in = 6;
		#10 pc_in = 7;
		#10 pc_in = 8;
		#10 pc_in = 9;
		#10 pc_in = 10;
	end
	
	
	initial
	begin
	   clock = 0;
	   forever #10 clock = !clock;
	end
	
endmodule
