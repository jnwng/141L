`timescale 1ns / 1ns

module program_runner_1
	reg clock;
	reg restart;
	reg one;
	reg init;
	reg done;
	
	processor prog1(clock, restart, one, init, done);
	
	initial
	begin
		init = 1, restart = 1, one = 1, done = 0;
	end
	
	always
	begin
		if (done) $finish;
	end
	
	initial
	begin
	   clock = 0;
	   forever #10 clock = !clock;
	end

endmodule