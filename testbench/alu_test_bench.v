`timescale 1ns / 1ps

module ALU_TB;
	reg clock;
	reg [15:0] input_a;
	reg [15:0] input_b;
	reg [3:0] op;
	reg [15:0] out;
	
	ALU alu (clock, input_a, input_b, op, out);
	
	initial
	begin
		$monitor($time, , input_a, input_b, op, out);
		clock = 0; input_a = 0; input_b = 0; op=0;	// add
		#10 input_a = 1; input_b = 0;    // 0-1 = -1
		
		#10 op=1;	// or
		#10 input_a = 0; input_b = 1;
		#10 input_a = 0; input_b = 0;
		#10 input_a = 1; input_b = 1;
		
		#10 op=2;	// and
		#10 input_a = 1; input_b = 0;		// should be 0
		#10 input_a = 1; input_b = 1;		// should be 1
	end
	
	always
	begin
		clock = !clock;
	end
	
	
endmodule