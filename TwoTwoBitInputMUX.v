module TwoTwoBitInputMUX (a, b, sel, out);

  input[1:0] a, b;
  input sel;
  output[1:0] out;

  assign out = sel ? b : a;

endmodule // TwoEightBitInputMUX
