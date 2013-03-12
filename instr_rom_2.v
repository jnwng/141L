`timescale 1ns / 1ns

module instr_rom_2
(
	input [15:0] pc_in,
	output wire format,
	output wire [3:0] opcode,
	output wire sign,
	output wire [2:0] operand,
	output wire [7:0] immediate
);

	reg [8:0] instr_out;
	always @ (pc_in)
	begin
		case(pc_in)
			0: begin instr_out = 9'b000000000; end
			1: begin instr_out = 9'b100010000; end
			2: begin instr_out = 9'b101110000; end
			3: begin instr_out = 9'b101111001; end
			4: begin instr_out = 9'b000000001; end
			5: begin instr_out = 9'b101111101; end
			6: begin instr_out = 9'b101110000; end
			7: begin instr_out = 9'b100000101; end
			8: begin instr_out = 9'b101111000; end
			9: begin instr_out = 9'b000000000; end
			10: begin instr_out = 9'b101111110; end
			11: begin instr_out = 9'b101110000; end
			12: begin instr_out = 9'b101111111; end
			13: begin instr_out = 9'b000011101; end
			14: begin instr_out = 9'b101001000; end
			15: begin instr_out = 9'b101110001; end
			16: begin instr_out = 9'b101111011; end
			17: begin instr_out = 9'b101110000; end
			18: begin instr_out = 9'b101111100; end
			19: begin instr_out = 9'b000000000; end
			20: begin instr_out = 9'b101111010; end
			21: begin instr_out = 9'b000100000; end
			22: begin instr_out = 9'b101111101; end
			23: begin instr_out = 9'b100110101; end
			24: begin instr_out = 9'b101110010; end
			25: begin instr_out = 9'b101111001; end
			26: begin instr_out = 9'b000000100; end
			27: begin instr_out = 9'b101111101; end
			28: begin instr_out = 9'b100110101; end
			29: begin instr_out = 9'b000001111; end
			30: begin instr_out = 9'b100100001; end
			31: begin instr_out = 9'b110110000; end
			32: begin instr_out = 9'b000000000; end
			33: begin instr_out = 9'b101111110; end
			34: begin instr_out = 9'b101110100; end
			35: begin instr_out = 9'b101111111; end
			36: begin instr_out = 9'b000110001; end
			37: begin instr_out = 9'b101001000; end
			38: begin instr_out = 9'b101110011; end
			39: begin instr_out = 9'b100001010; end
			40: begin instr_out = 9'b101111010; end
			41: begin instr_out = 9'b000000001; end
			42: begin instr_out = 9'b101111101; end
			43: begin instr_out = 9'b101110100; end
			44: begin instr_out = 9'b100000101; end
			45: begin instr_out = 9'b101111100; end
			46: begin instr_out = 9'b000100000; end
			47: begin instr_out = 9'b101111101; end
			48: begin instr_out = 9'b100110101; end
			49: begin instr_out = 9'b000011000; end
			50: begin instr_out = 9'b101111101; end
			51: begin instr_out = 9'b100110101; end
        endcase
		  $display("The instruction: %d", pc_in);
	end

	assign format = instr_out[8];
	assign opcode = instr_out[7:4];
	assign sign = instr_out[3];
	assign operand = instr_out[2:0];
	assign immediate = instr_out[7:0];

endmodule
