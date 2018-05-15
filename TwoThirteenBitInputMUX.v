module TwoThirteenBitInputMUX (a, b, sel, out);

  input[12:0] a, b;
  input sel;
  output[12:0] out;

  assign out = sel ? b : a;

endmodule // TwoThirteenBitInputMUX
