module TR (clk, rst, ld, in, out);

  input clk, rst, ld;
  input[12:0] in;
  output[12:0] out;

  reg[12:0] outReg;

  always @ ( clk, rst ) begin
    out <= out;
    if (rst) begin
      out <= 13'b0;
    end
    else begin
      if (ld) begin
        outReg <= in;
      end
    end
  end

  assign out = outReg;

endmodule // TR
