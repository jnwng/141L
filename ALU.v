module ALU
  (input [15:0] input_a
   input [15:0] input_b
   output [15:0] out
   input [1:0] op
  )

  always @ (op or input_a or input_b)
  begin
    case(op)
      `add:  out =
      `sub:  out =
    endcase
  end

endmodule
