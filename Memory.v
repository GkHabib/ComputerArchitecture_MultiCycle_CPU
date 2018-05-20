module Memory (clk, rst, inData, address, outData, writeEn);
  input clk, rst;
  input [7:0] inData;
  input [12:0] address;
  output [7:0] outData;
  reg [7:0] memArr [8191:0];
  input writeEn;
  always @ (posedge clk, posedge rst) begin
    if(rst) begin
      //
    end
    else begin
      if(writeEn) begin
        memArr[address] <= inData;
      end
    end
  end
  assign outData = memArr[address];
endmodule // Memory
