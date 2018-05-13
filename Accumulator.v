module Accumulator (clk, rst, inData, address, outData, writeEn);

  input clk, rst, writeEn;
  input[7:0] inData;
  input[12:0] address;
  output reg[7:0] outData;

  reg[7:0] regArr [3:0];

  always @ ( posedge clk, posedge rst ) begin
    if (rst) begin
      //nothing for now :|
    end
    else begin
      if (writeEn) begin
        regArr[address] <= inData;
      end
    end
  end

  assign outData = regArr[address];

endmodule // Accumulator
