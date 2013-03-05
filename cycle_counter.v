module cycle_counter
(
	input start,
	input clk
);
	reg [23:0] cycle;
	
	always @ (posedge clk) begin
		if (start) begin 
			cycle <= 0;
		end else begin
			cycle <= cycle + 1;
		end
		$display("Cycle: %d", cycle);
	end

endmodule