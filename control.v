`timescale 1ns / 1ns
// This is a Verilog description for a control file

`define write_ALU 2'b11
`define write_MEM 2'b00
`define write_IMM 2'b01
`define write_RES 2'b10

`define op_shift 4'b1010
`define op_add 4'b0000
`define op_load 4'b0001
`define op_store 4'b0010
`define op_jump 4'b0011
`define op_branch 4'b0100
`define op_epar 4'b0101
`define op_cp 4'b0111
`define op_halt 4'b1011

module control
(
	input format,
   input [3:0] opcode,			// are we copying value from a res into a register
	input sign,						// are we copying a value out?
	output reg cpin,		      // value of res
	output reg cpout,			   // value of specified register
	output reg memRead,
	output reg memWrite,
	output reg [1:0] writeSrc,
	output reg halt,
	output reg branch,
	output reg jump
);

initial begin
	branch = 0;
	jump = 0;
	cpin = 0;
	cpout = 0;
	memRead = 0;
	memWrite = 0;
	halt = 0;
end

	
	always @ (*) begin
		branch <= 0;
		jump <= 0;
		cpin <= 0;
		cpout <= 0;
		memRead <= 0;
		memWrite <= 0;
		writeSrc <= 1'bZ;
		$display("sign: %d", sign	);
		case (format)
			0: begin
				$display("Res.");
				writeSrc <= `write_IMM;
				end
			1: begin
				case (opcode)
					`op_add: begin
						$display("Add.");
						writeSrc <= `write_ALU;
					end
					`op_epar: begin
						$display("epar");
						writeSrc <= `write_ALU;
					end
					`op_cp:	begin
						if (sign) begin
							$display("cpout");
							cpout <= 1;
						end
						else begin
							$display("cpin");
							cpin <= 1;
						end
					end
					`op_load: begin
						$display("load");
						memRead <= 1;
						writeSrc <= `write_MEM;
					end
					`op_store: begin
						$display("store");
						memWrite <= 1;
					end
					`op_branch: begin
						$display("Branch.");
						branch <= 1;
					end
					`op_jump: begin
						$display("Jump.");
						jump <= 1;
					end
					`op_halt: begin
						$display("halt");
						halt <= 1;
					end
					default: begin
						$display("default");
						writeSrc <= `write_IMM;
					end
				endcase
			end
		endcase
		$display(writeSrc);
		
	end

endmodule	
