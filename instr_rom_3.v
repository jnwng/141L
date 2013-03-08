`timescale 1ns / 1ns

module instr_rom_3
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
         // changed 3
         0: begin instr_out   = 9'b000000000; end
         1: begin instr_out   = 9'b101111000; end
         2: begin instr_out   = 9'b010000000; end
         3: begin instr_out   = 9'b101111001; end
         4: begin instr_out   = 9'b010100000; end
         5: begin instr_out   = 9'b101111110; end
         6: begin instr_out   = 9'b101110001; end
         7: begin instr_out   = 9'b101111111; end
         8: begin instr_out   = 9'b000111111; end
         9: begin instr_out   = 9'b101001000; end
         10: begin instr_out  = 9'b000000000; end
         11: begin instr_out  = 9'b101111011; end
         12: begin instr_out  = 9'b101110000; end
         13: begin instr_out  = 9'b101111110; end
         14: begin instr_out  = 9'b101110011; end
         15: begin instr_out  = 9'b101111111; end
         16: begin instr_out  = 9'b000011110; end
         17: begin instr_out  = 9'b101001000; end
         18: begin instr_out  = 9'b101110001; end
         19: begin instr_out  = 9'b100010110; end
         20: begin instr_out  = 9'b101110011; end
         21: begin instr_out  = 9'b100010111; end
         22: begin instr_out  = 9'b000110000; end
         23: begin instr_out  = 9'b101001000; end
         24: begin instr_out  = 9'b000000011; end
         25: begin instr_out  = 9'b100001011; end
         26: begin instr_out  = 9'b101111011; end
         27: begin instr_out  = 9'b000001100; end
         28: begin instr_out  = 9'b101111010; end
         30: begin instr_out  = 9'b100110010; end
         31: begin instr_out  = 9'b101110001; end
         32: begin instr_out  = 9'b100010011; end
         33: begin instr_out  = 9'b101110110; end
         34: begin instr_out  = 9'b100100011; end
         35: begin instr_out  = 9'b000000001; end
         36: begin instr_out  = 9'b101111100; end
         37: begin instr_out  = 9'b000000001; end
         38: begin instr_out  = 9'b100001110; end
         39: begin instr_out  = 9'b100100100; end
         40: begin instr_out  = 9'b000000011; end
         41: begin instr_out  = 9'b100001110; end
         42: begin instr_out  = 9'b101111000; end
         43: begin instr_out  = 9'b000000001; end
         44: begin instr_out  = 9'b100001001; end
         45: begin instr_out  = 9'b101111001; end
         46: begin instr_out  = 9'b000000100; end
         47: begin instr_out  = 9'b101111010; end
         48: begin instr_out  = 9'b100110010; end
         49: begin instr_out  = 9'b000000001; end
         50: begin instr_out  = 9'b100001011; end
         51: begin instr_out  = 9'b101111101; end
         52: begin instr_out  = 9'b100010100; end
         53: begin instr_out  = 9'b000000001; end
         54: begin instr_out  = 9'b100001100; end
         55: begin instr_out  = 9'b101111100; end
         56: begin instr_out  = 9'b101110101; end
         57: begin instr_out  = 9'b100100100; end
         58: begin instr_out  = 9'b000000001; end
         59: begin instr_out  = 9'b100001001; end
         60: begin instr_out  = 9'b101111001; end
         61: begin instr_out  = 9'b000000100; end
         62: begin instr_out  = 9'b101111010; end
         63: begin instr_out  = 9'b100110010; end
         64: begin instr_out  = 9'b000000000; end
         65: begin instr_out  = 9'b101111101; end
         66: begin instr_out  = 9'b000000001; end
         67: begin instr_out  = 9'b101111011; end
         68: begin instr_out  = 9'b101110000; end
         69: begin instr_out  = 9'b101111110; end
         70: begin instr_out  = 9'b101110011; end
         71: begin instr_out  = 9'b101111111; end
         72: begin instr_out  = 9'b001111100; end
         73: begin instr_out  = 9'b101001000; end
         74: begin instr_out  = 9'b101110011; end
         75: begin instr_out  = 9'b100010110; end
         76: begin instr_out  = 9'b101110101; end
         77: begin instr_out  = 9'b101111111; end
         78: begin instr_out  = 9'b001010111; end
         79: begin instr_out  = 9'b101000001; end
         80: begin instr_out  = 9'b001100010; end
         81: begin instr_out  = 9'b101001000; end
         82: begin instr_out  = 9'b000000010; end
         83: begin instr_out  = 9'b100001011; end
         84: begin instr_out  = 9'b101111011; end
         85: begin instr_out  = 9'b001000011; end
         86: begin instr_out  = 9'b101111010; end
         87: begin instr_out  = 9'b100110010; end
         88: begin instr_out  = 9'b101110110; end
         89: begin instr_out  = 9'b101111101; end
         90: begin instr_out  = 9'b000000001; end
         91: begin instr_out  = 9'b100000011; end
         92: begin instr_out  = 9'b100010001; end
         93: begin instr_out  = 9'b000000010; end
         94: begin instr_out  = 9'b100001011; end
         95: begin instr_out  = 9'b101111011; end
         96: begin instr_out  = 9'b001000011; end
         97: begin instr_out  = 9'b101111010; end
         98: begin instr_out  = 9'b100110010; end
         99: begin instr_out  = 9'b000000001; end
         100: begin instr_out = 9'b100000011; end
         101: begin instr_out = 9'b100010110; end
         102: begin instr_out = 9'b101110001; end
         103: begin instr_out = 9'b101111111; end
         104: begin instr_out = 9'b001101100; end
         105: begin instr_out = 9'b101000001; end
         106: begin instr_out = 9'b001110100; end
         107: begin instr_out = 9'b101111010; end
         108: begin instr_out = 9'b100110010; end
         109: begin instr_out = 9'b101110110; end
         110: begin instr_out = 9'b101111001; end
         111: begin instr_out = 9'b000000010; end
         112: begin instr_out = 9'b100001011; end
         113: begin instr_out = 9'b101111011; end
         114: begin instr_out = 9'b001000011; end
         115: begin instr_out = 9'b101111010; end
         116: begin instr_out = 9'b100110010; end
         117: begin instr_out = 9'b101110111; end
         118: begin instr_out = 9'b101111001; end
         119: begin instr_out = 9'b000000010; end
         120: begin instr_out = 9'b100001011; end
         121: begin instr_out = 9'b101111011; end
         122: begin instr_out = 9'b001000011; end
         123: begin instr_out = 9'b101111010; end
         124: begin instr_out = 9'b100110010; end
         125: begin instr_out = 9'b101110001; end
         126: begin instr_out = 9'b101111000; end
         127: begin instr_out = 9'b110110000; end
         // changed /3
        endcase
        $display("instruction number: %d", pc_in);
	end

	assign format = instr_out[8];
	assign opcode = instr_out[7:4];
	assign sign = instr_out[3];
	assign operand = instr_out[2:0];
	assign immediate = instr_out[7:0];

endmodule
