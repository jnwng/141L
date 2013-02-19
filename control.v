`timescale 1ns / 1ps
// This is a Verilog description for a control file

`define op_add 3'b000
`define op_epar 3'b100
`define op_cp 3'b111
`define op_store 3'b010
`define op_load 3'b001
`define op_halt 4'b1011
`define op_branch 4'b0100
`define op_jump 4'b0011

module control
(
	input clk,							// clock
	input format,
   input [3:0] opcode,						// are we copying value from a res into a register
	input sign,						// are we copying a value out?
	output reg cpin,		   // value of res
	output reg cpout,			// value of specified register
	output reg memRead,
	output reg memWrite,
	output reg [1:0] writeSrc,
	output reg halt,
	output reg branch,
	output reg jump
);
	
	always @(posedge clk) begin
		case (format)
			1: begin
				writeSrc <= 2;
			end
		endcase	
		case (opcode)
			`op_cp:	begin
				if (sign) begin
					cpin <= 0;
					cpout <= 1;
				end
				else begin
					cpin <= 1;
					cpout <= 0; 
				end
			end
			`op_store: begin
				writeSrc <= 0;
			end
			`op_load: begin
				writeSrc <= 0;
			end
			`op_branch: begin
				branch <= 1;
			end
			`op_jump: begin
				jump <= 1;
			end
			`op_halt: begin
				halt <= 1;
			end
			default begin
				writeSrc <= 1;
			end
		endcase
	end

endmodule	