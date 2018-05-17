module Memory (clk, rst, inData, address, outData, readEn, writeEn);
  input clk, rst;
  input [7:0] inData;
  input [12:0] address;
  output reg [7:0] outData;
  reg [7:0] memArr [8191:0];
  input readEn, writeEn;
  always @ (posedge clk, posedge rst) begin
    if(rst) begin
      //
    end
    else begin
      if(writeEn) begin
        memArr[address] <= inData;
      end
      else begin
        if(readEn) begin
          outData = memArr[address];
        end
      end
    end
  end
endmodule // Memory
