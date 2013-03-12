`timescale 1ns / 1ns

module register_ex
(
   input clock,
	input wire in_ctrl_cpin,		      // value of res
	input wire in_ctrl_cpout,			   // value of specified register
	input wire in_ctrl_memRead,
	input wire in_ctrl_memWrite,
	input wire [1:0] in_ctrl_writeSrc,
	input wire in_ctrl_halt,
	input wire in_ctrl_branch,
	input wire in_ctrl_jump,
	input wire in_ctrl_regWrite,
	input wire in_sign,
	input wire [3:0] in_opcode,
	input wire [2:0] in_operand,
	input wire [15:0] in_extended,
	input wire in_format,

	
	output reg out_ctrl_cpin,		      // value of res
	output reg out_ctrl_cpout,			   // value of specified register
	output reg out_ctrl_memRead,
	output reg out_ctrl_memWrite,
	output reg [1:0] out_ctrl_writeSrc,
	output reg out_ctrl_halt,
	output reg out_ctrl_branch,
	output reg out_ctrl_jump,
	output reg out_ctrl_regWrite,
	
	output reg [3:0] out_opcode,
	output reg [2:0] out_operand,
	output reg [15:0] out_extended,
	output reg out_sign,
	output reg out_format,
	input wire flush
);

reg ctrl_cpin, ctrl_cpout, ctrl_memRead, ctrl_memWrite, ctrl_halt;
reg [1:0] ctrl_writeSrc;
reg ctrl_branch, ctrl_jump, ctrl_regWrite;
reg [15:0] extended;
reg [3:0] opcode;
reg [2:0] operand;
reg sign, format;

always @ (negedge clock) begin
	// Read in data
	if (flush)
	begin
	ctrl_cpin <= 0;
	ctrl_cpout <= 0;
	ctrl_memRead <= 0;
	ctrl_memWrite <= 0;
	ctrl_writeSrc <= 0;
	ctrl_halt <= 0;
	ctrl_branch <= 0;
	ctrl_jump <= 0;
	ctrl_regWrite <= 0;
	extended <= 0;
	operand <= 0;
	opcode <= 0;
	sign <= 0;
	format <= 0;
	end
	else begin
	ctrl_cpin <= in_ctrl_cpin;
	ctrl_cpout <= in_ctrl_cpout;
	ctrl_memRead <= in_ctrl_memRead;
	ctrl_memWrite <= in_ctrl_memWrite;
	ctrl_writeSrc <= in_ctrl_writeSrc;
	ctrl_halt <= in_ctrl_halt;
	ctrl_branch <= in_ctrl_branch;
	ctrl_jump <= in_ctrl_jump;
	ctrl_regWrite <= in_ctrl_regWrite;
	
	extended <= in_extended;
	operand <= in_operand;
	opcode <= in_opcode;
	sign <= in_sign;
	format <= in_format;
	end
end

always @ (posedge clock) begin
	// Write out data
	out_ctrl_cpin <= ctrl_cpin;
	out_ctrl_cpout <= ctrl_cpout;
	out_ctrl_memRead <= ctrl_memRead;
	out_ctrl_memWrite <= ctrl_memWrite;
	out_ctrl_writeSrc <= ctrl_writeSrc;
	out_ctrl_halt <= ctrl_halt;
	out_ctrl_branch <= ctrl_branch;
	out_ctrl_jump <= ctrl_jump;
	out_ctrl_regWrite <= ctrl_regWrite;
	
	out_extended <= extended;
	out_opcode <= opcode;
	out_operand <= operand;
	out_sign <= sign;
	out_format <= format;

end


endmodule