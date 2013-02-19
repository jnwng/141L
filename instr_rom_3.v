`timescale 1ns / 1ps

module instr_rom_3
(
	input [15:0] pc_in,
	output reg [8:0] instr_out
);

	reg [8:0] rom [0:54];
	
	// ROM INITIALIZATION
	always @ (*)
	begin
		case(pc_in)
			0: begin instr_out=9'b000000001; end
			1: begin instr_out=9'b100010000; end
			2: begin instr_out=9'b000010000; end
			3: begin instr_out=9'b101110001; end
			4: begin instr_out=9'b000000001; end
			5: begin instr_out=9'b100000001; end
			6: begin instr_out=9'b101111001; end
			7: begin instr_out=9'b000110000; end
			8: begin instr_out=9'b101111111; end
			9: begin instr_out=9'b101110001; end
			10: begin instr_out=9'b101110000; end
			11: begin instr_out=9'b000100010; end
			12: begin instr_out=9'b101001000; end
			13: begin instr_out=9'b101110110; end
			14: begin instr_out=9'b101111111; end
			15: begin instr_out=9'b101110000; end
			16: begin instr_out=9'b101110000; end
			17: begin instr_out=9'b000011111; end
			18: begin instr_out=9'b101001000; end
			19: begin instr_out=9'b000000001; end
			20: begin instr_out=9'b101110101; end
			21: begin instr_out=9'b100010010; end
			22: begin instr_out=9'b101111010; end
			23: begin instr_out=9'b101010101; end
			24: begin instr_out=9'b100000101; end
			25: begin instr_out=9'b101110000; end
			26: begin instr_out=9'b000000101; end
			27: begin instr_out=9'b101111100; end
			28: begin instr_out=9'b100110100; end
			29: begin instr_out=9'b001100000; end
			30: begin instr_out=9'b100100000; end
			31: begin instr_out=9'b001111111; end
			32: begin instr_out=9'b101110101; end
			33: begin instr_out=9'b001100000; end
			34: begin instr_out=9'b100100101; end
		endcase
	end

	always @ (*) begin
		instr_out = rom[pc_in];
	end

endmodule