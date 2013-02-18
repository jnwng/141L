`timescale 1ns / 1ns

module ALU_TB;
	reg clock;
	reg [15:0] input_a;
	reg [15:0] input_b;
	wire [15:0] out;
	reg [3:0] op;
	
	ALU alu (clock, input_a, input_b, out, op);
	
	initial
		$monitor($time, , input_a, input_b, out, op);
			
	initial
	begin
		input_a = 0; input_b = 0; op=0;	// add
		#10 input_a = 1; input_b = 0;    // 0-1 = -1
		#10 input_a = 1; input_b = 1;
		
		#10 op=3;	// or
		#10 input_a = 0; input_b = 2'b01;
		#10 input_a = 0; input_b = 0;
		#10 input_a = 1; input_b = 2'b01;
		
		#10 op=2;	// and
		#10 input_a = 1; input_b = 0;		// should be 0
		#10 input_a = 1; input_b = 1;		// should be 1
		
		#10 op=1; // subtract
		#10 input_a = 1; input_b = 0;		// should be 1
		#10 input_a = 1; input_b = 1;		// should be 0
		
		#10 op=4; // epar
		#10 input_a = 2; 		// should be 1
		#10 input_a = 1; 		// should be 0
	end
	
	
	initial
	begin
	   clock = 0;
	   forever #10 clock = !clock;
	end
	
endmodule
