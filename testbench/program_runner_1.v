`timescale 1ns / 1ns

module program_runner_1;
	reg clock;
	reg restart;
	reg init;
	wire done;
	
	processor prog1 (restart, init, clock, done);
	
	initial
		$monitor($time, , restart, init, done);
	
	initial
	begin
		init = 1; restart = 0;
		#20 init = 0; restart = 0;
	end
	
	
	initial
	begin
	   clock = 0;
	   forever #10 clock = !clock;
	end

endmodule