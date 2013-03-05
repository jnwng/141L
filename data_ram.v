`timescale 1ns / 1ns

module data_ram
(
	input clk,	
	input [15:0] DataAddress,
	input ReadMem,
	input WriteMem,
	input [15:0] DataIn,
	output [15:0] DataOut
	
);
	reg [15:0] ExtraOut;
	reg [15:0] my_memory [0:255];
	// RAM INITIALIZATION
	initial
	begin
		$readmemh("//psf/Home/Documents/cse141L/initMem.list", my_memory);
	end
	
	
	always @ (ReadMem or DataAddress)
	begin
		if (ReadMem) begin
			ExtraOut <= my_memory[DataAddress];
		end else begin
			ExtraOut <= 8'bZ;
		end
	end
	
	always @ (posedge clk)
	begin
		if (WriteMem) begin
			my_memory[DataAddress] <= DataIn;
		end
	end
	
	assign DataOut = ExtraOut;
	
endmodule
