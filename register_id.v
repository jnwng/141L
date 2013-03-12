`timescale 1ns / 1ns

module register_id
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
	output reg [7:0] out_immediate,
	input wire flush
	
);

reg format;
reg [3:0] opcode;
reg sign;
reg [2:0] operand;
reg [7:0] immediate;
reg [10:0] counter;

initial begin
	counter = 0;
end

always @ (negedge clock) begin
	// Read in data
	$display("%d", counter);
	if (flush)
	begin
		format = 0;
		opcode = 0;
		sign = 0;
		operand = 0;
		immediate = 0;
		counter = counter - 2;
	end
	else begin
		format <= in_format;
		opcode <= in_opcode;
		sign <= in_sign;
		operand <= in_operand;
		immediate <= in_immediate;
		counter <= counter + 1;
	end
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