module ALU_TB;
	reg clock;
	wire [15:0] input_a;
	wire [15:0] input_b;
	wire [3:0] op;
	
	ALU alu (
	.clock	(clock),
	.input_a (input_a),
	.input_b (input_b),
	.op		(op)
	);
	
	initial
	begin
		clock = 0; input_a = 0; input_b = 0; op=0;
		#10 input_a = 1; input_b = 0;    // 1+0 = 1
		#10 input_a = 1; input_b = 0;    // 0-1 = -1
	end
	
	always
		clock = !clock;
		
	
	
endmodule