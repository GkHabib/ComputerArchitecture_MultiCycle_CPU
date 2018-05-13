module EightBitReg(clk, rst, writeEn, in, out);
  input[7:0] in;
  output reg[7:0] out;
  input clk, rst;
  always @ (posedge clk, posedge rst) begin
    if(rst) out <= 8'b0;
    else begin
      if(writeEn) begin
        out <= in;
      end
    end
  end
endmodule
