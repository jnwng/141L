`timescale 1ns / 1ns

module register_mem
(
   input clock,
	input wire in_format,
	input wire [3:0] in_opcode,
	input wire in_sign,
	input wire [2:0] in_operand,
	input wire [7:0] in_immediate,
	output reg out_format,
	output reg [3:0] out_opcode,
	output reg out_sign,
	output reg [2:0] out_operand,
	output reg [7:0] out_immediate
);

reg format;
reg [3:0] opcode;
reg sign;
reg [2:0] operand;
reg [7:0] immediate;



always @ (negedge clock) begin
	// Read in data
	format <= in_format;
	opcode <= in_opcode;
	sign <= in_sign;
	operand <= in_operand;
	immediate <= in_immediate;
end

always @ (posedge clock) begin
	// Write out data
	out_format <= format;
	out_opcode <= opcode;
	out_sign <= sign;
	out_operand <= operand;
	out_immediate <= immediate;
end

endmodule