`timescale 1ns / 1ps

module instr_rom
(
	input [15:0] pc_in,
	output [15:0] instr_out
);

	reg [9:0] rom [0:54];
	
	// ROM INITIALIZATION
	initial
	begin
		rom[0] = 0;
		rom[1] = 1;
		rom[2] = 2;
		rom[3] = 3;
		rom[4] = 4;
		rom[5] = 5;
		rom[6] = 6;
		rom[7] = 7;
		rom[8] = 8;
		rom[9] = 9;
		rom[10] = 10;
	end

	assign instr_out = rom[pc_in];

endmodule