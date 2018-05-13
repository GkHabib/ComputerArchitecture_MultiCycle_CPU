module ALU (input[7:0] a, b, input[1:0] opControl, input c, output reg[7:0] result);
  parameter [1:0] ADD = 2'b00, AND = 2'b01, OR = 2'b10;
endmodule // ALU
