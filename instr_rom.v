`timescale 1ns / 1ps

module instr_rom
(
	input [15:0] pc_in,
	output reg [15:0] instr_out
);

reg instr[511:0];

always
begin
	instr_out = instr[pc_in];
end

endmodule