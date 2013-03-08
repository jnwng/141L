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
            0: begin instr_out = 9'b000000001; end
            1: begin instr_out = 9'b100010000; end
            2: begin instr_out = 9'b000011111; end
            3: begin instr_out = 9'b101111001; end
            4: begin instr_out = 9'b000000001; end
            5: begin instr_out = 9'b100001001; end
            6: begin instr_out = 9'b101111001; end
            7: begin instr_out = 9'b001010000; end
            8: begin instr_out = 9'b101111110; end
            9: begin instr_out = 9'b101110001; end
            10: begin instr_out = 9'b101111111; end
            11: begin instr_out = 9'b000100101; end
            12: begin instr_out = 9'b101000000; end
            13: begin instr_out = 9'b000000000; end
            14: begin instr_out = 9'b101111111; end
            15: begin instr_out = 9'b101110000; end
            16: begin instr_out = 9'b101111110; end
            17: begin instr_out = 9'b000011101; end
            18: begin instr_out = 9'b101001000; end
            19: begin instr_out = 9'b101110001; end
            20: begin instr_out = 9'b100010010; end
            21: begin instr_out = 9'b101110010; end
            22: begin instr_out = 9'b101010101; end
            23: begin instr_out = 9'b101110000; end
            24: begin instr_out = 9'b100000101; end
            25: begin instr_out = 9'b101111000; end
            26: begin instr_out = 9'b000000100; end
            27: begin instr_out = 9'b101111100; end
            28: begin instr_out = 9'b100110100; end
            29: begin instr_out = 9'b000100000; end
            30: begin instr_out = 9'b101111010; end
            31: begin instr_out = 9'b101110001; end
            32: begin instr_out = 9'b100000010; end
            33: begin instr_out = 9'b101111001; end
            34: begin instr_out = 9'b001100000; end
            35: begin instr_out = 9'b100100001; end
            36: begin instr_out = 9'b110110000; end
            37: begin instr_out = 9'b001111111; end
            38: begin instr_out = 9'b101111101; end
            39: begin instr_out = 9'b001100000; end
            40: begin instr_out = 9'b100100101; end
            41: begin instr_out = 9'b110110000; end
        endcase
	end

	assign format = instr_out[8];
	assign opcode = instr_out[7:4];
	assign sign = instr_out[3];
	assign operand = instr_out[2:0];
	assign immediate = instr_out[7:0];

endmodule
