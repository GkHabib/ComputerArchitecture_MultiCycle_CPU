module CZN (clk, rst, ld, in, out);

  input clk, rst, ld;
  input[2:0] in;
  output reg[2:0] out;

  always @ ( posedge clk, posedge rst ) begin
    out <= out;
    if (rst) begin
      out <= 3'b0;
    end
    else begin
      if (ld) begin
        out <= in;
      end
    end
  end

endmodule // CZN
