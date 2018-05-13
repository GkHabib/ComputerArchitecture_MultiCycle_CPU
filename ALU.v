module ALU (a, b, opControl, c, result, czn);

  input[7:0] a, b;
  input[1:0] opControl;
  input c;
  output reg[7:0] result;
  output reg[2:0] czn;
  parameter [1:0] ADD = 2'b00, AND = 2'b01, OR = 2'b10;

  always @ ( a, b, c, opControl ) begin
    case(opControl)
    ADD: {czn[2], result} <= a + b + c;
    AND: result <= a & b;
    OR: result <= a | b;
  end

  assign czn[1] = (result == 0);
  assign czn[0] = (result < 0);

endmodule // ALU
