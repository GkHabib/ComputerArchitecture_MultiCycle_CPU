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

  initial begin
    memArr [0]= 8'b11100000; //LDI
    memArr [1]= 8'b01000011; // ADA
    memArr [2]= 8'b11101000; // ADA
    memArr [3]= 8'b10011001; // AR
    memArr [4]= 8'b01000011; // ADA
    memArr [5]= 8'b11101001; // ADA
    memArr [6]= 8'b10011001; // AR
    memArr [7]= 8'b01000011; // ADA
    memArr [8]= 8'b11101010; // ADA
    memArr [9]= 8'b10011001; // AR
    memArr[10]= 8'b01000011; // ADA
    memArr[11]= 8'b11101011; // ADA
    memArr[12]= 8'b10011001; // AR
    memArr[13]= 8'b01000011; // ADA
    memArr[14]= 8'b11101100; // ADA
    memArr[15]= 8'b10011001; // AR
    memArr[16]= 8'b01000011; // ADA
    memArr[17]= 8'b11101101; // ADA
    memArr[18]= 8'b10011001; // AR
    memArr[19]= 8'b01000011;// ADA
    memArr[20]= 8'b11101110; // ADA
    memArr[21]= 8'b10011001; // AR
    memArr[22]= 8'b01000011; // ADA
    memArr[23]= 8'b11101111; // ADA
    memArr[24]= 8'b10011001; // AR
    memArr[25]= 8'b01000011;// ADA
    memArr[26]= 8'b11110000;// ADA
    memArr[27]= 8'b10011001;// AR
    memArr[28]= 8'b01000011;// ADA
    memArr[29]= 8'b11110001;// ADA
    memArr[30]= 8'b10011001;// AR
    memArr[31]= 8'b00100111;// STA
    memArr[32]= 8'b11010000;// STA
    memArr[33]= 8'b11101000;// LDI
    memArr[34]= 8'b00100111;// STA
    memArr[35]= 8'b11010001;// STA
    memArr[36]= 8'b00000000;
    memArr[1000]= 8'b00011010;
    memArr[1001]= 8'b00011010;
    memArr[1002]= 8'b00011010;
    memArr[1003]= 8'b00011010;
    memArr[1004]= 8'b00011010;
    memArr[1005]= 8'b00011010;
    memArr[1006]= 8'b00011010;
    memArr[1007]= 8'b00011010;
    memArr[1008]= 8'b00011010;
    memArr[1009]= 8'b00011010; //sum of all=260 = 0001 0000 0100
  end
endmodule // Memory
