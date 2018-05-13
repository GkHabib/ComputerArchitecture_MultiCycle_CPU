module IR(clk, rst, writeEn, in, out);
  input[7:0] in;
  output reg[7:0] out;
  input clk, rst;
  always @ (posedge clk, posedge rst) begin
    if(rst) out <= 8'b0;
    else
  end
