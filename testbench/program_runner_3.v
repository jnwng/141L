`timescale 1ns / 1ns

module program_runner_3;
	reg clock;
	reg restart;
	reg init;
	wire done;
	
	processor_3 prog3 (restart, init, clock, done);
	
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