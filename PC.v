module PC (clk, rst, inData, outData, inc, loadEn);
  input clk, rst;
  input [12:0] inData;
  output reg [12:0] outData;
  input inc, loadEn;
  always @ (posedge clk, posedge rst) begin
    if(rst) begin
      outData <= 8'b0;
    end
    else begin
      if(loadEn) begin
        outData <= inData;
      end
      else begin
          if(inc) begin
            outData = outData + 1;
          end
      end
    end
  end

endmodule // PC
