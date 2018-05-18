module ThreeTwoBitInputMUX (in1, in2, in3, sel, out);
  input[1:0] in1, in2, in3, sel;
  output reg [1:0] out;
  always @ (in1,in2,in3,sel) begin
    case(sel)
      0: out = in1;
      1: out = in2;
      2: out = in3;
      default: out = 2'b0;
    endcase
  end

endmodule // ThreeTwoBitInputMUX
