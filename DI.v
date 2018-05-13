module DI (clk, rst, ld, in, out);

  input clk, rst, ld;
  input[4:0] in;
  output reg[4:0] out;

  always @ ( posedge clk, posedge rst ) begin
    out <= out;
    if (rst) begin
      out <= 5'b0;
    end
    else begin
      if (ld) begin
        out <= in;
      end
    end
  end

endmodule // DI
