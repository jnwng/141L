`timescale 1ns / 1ns

module program_runner_2;
	reg clock;
	reg restart;
	reg init;
	wire done;
	
	processor_2 prog2 (restart, init, clock, done);
	
	initial
		$monitor($time, , restart, init, done);
	
	initial
	begin
		init = 1; restart = 0;
		#20 init = 0; restart = 0;
	end
	
	always @ (posedge clock)
	begin
		if (done) begin $stop; end
	end
	
	initial
	begin
	   clock = 0;
	   forever #10 clock = !clock;
	end

endmodule