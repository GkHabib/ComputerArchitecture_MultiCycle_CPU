module ThreeTwoBitInputMUX (in, sel, out);
  input [1:0] in [2:0]
  input[1:0]  sel;
  output[1:0] out;
  assign out = in[sel];

endmodule // ThreeTwoBitInputMUX
