module DI (clk, rst, ld, in, out);

  input clk, rst, ld;
  input[4:0] in;
  output[4:0] out;

  reg[4:0] outReg;

  always @ ( posedge clk, posedge rst ) begin
    outReg <= outReg;
    if (rst) begin
      outReg <= 5'b0;
    end
    else begin
      if (ld) begin
        outReg <= in;
      end
    end
  end

  assign out = outReg;

endmodule // DI
