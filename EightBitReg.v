module IR(clk, rst, writeEn, in, out);
  input[7:0] in;
  output reg[7:0] out;
  input clk, rst;
  always @ (posedge clk, posedge rst) begin
    if (rst) begin
      out <= 8'b0;
    end
    else begin
      if(writeEn) begin
        out <= in;
      end
    end
  end
endmodule
