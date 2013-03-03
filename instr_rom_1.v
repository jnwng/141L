`timescale 1ns / 1ns

module instr_rom_1
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
			0: begin instr_out=9'b00000001; end
			1: begin instr_out=9'b00010000; end
			2: begin instr_out=9'b00011111; end
			3: begin instr_out=9'b01110001; end
			4: begin instr_out=9'b00000001; end
			5: begin instr_out=9'b00000001; end
			6: begin instr_out=9'b01111001; end
			7: begin instr_out=9'b01010000; end
			8: begin instr_out=9'b01111111; end
			9: begin instr_out=9'b01110001; end
			10: begin instr_out=9'b01110000; end
			11: begin instr_out=9'b00101010; end
			12: begin instr_out=9'b01000000; end
			13: begin instr_out=9'b00000000; end
			14: begin instr_out=9'b01110000; end
			15: begin instr_out=9'b01110000; end
			16: begin instr_out=9'b01111111; end
			17: begin instr_out=9'b00100110; end
			18: begin instr_out=9'b01001000; end
			19: begin instr_out=9'b01110001; end
			20: begin instr_out=9'b00010010; end
			21: begin instr_out=9'b01110010; end
			22: begin instr_out=9'b01110000; end
			23: begin instr_out=9'b01010101; end
			24: begin instr_out=9'b00000101; end
			25: begin instr_out=9'b01110000; end
			26: begin instr_out=9'b00000110; end
			27: begin instr_out=9'b01111100; end
			28: begin instr_out=9'b00110100; end
			29: begin instr_out=9'b01100000; end
			30: begin instr_out=9'b00100000; end
			31: begin instr_out=9'b01111111; end
			32: begin instr_out=9'b01111101; end
			33: begin instr_out=9'b01100000; end
			34: begin instr_out=9'b00100101; end		
        endcase
		$display("Program Counter %d", pc_in);
	end

	assign format = instr_out[8];
	assign opcode = instr_out[7:4];
	assign sign = instr_out[3];
	assign operand = instr_out[2:0];
	assign immediate = instr_out[7:0];

endmodule
