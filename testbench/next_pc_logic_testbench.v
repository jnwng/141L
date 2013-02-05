`timescale 1ns / 1ns

module NEXT_PC_TB;
	
	input branch,
	input target,
	input restart,
	input clock,
	input [15:0] pc_in,
	output reg [15:0] out
	
	next_pc_logic npl (branch, target, restart, clock, pc_in, out);
	
	
	initial
		$monitor(branch, target, restart, $time, pc_in, out);
			
	initial
	begin
		branch = 1; target = 10; restart = 0;    // should branch to address 10
		#10 branch = 0; restart = 0;             // should just increment pc by 1
		#10 branch = 1; restart = 0; target = 8; // should branch to address 10
		#10 branch = 1; restart = 1;             // should restart
		#10 branch = 0; restart = 1;             // should restart
	end
	
	
	initial
	begin
	   clock = 0;
	   forever #10 clock = !clock;
	end
	
endmodule
