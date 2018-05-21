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
    memArr[0] = 8'b11111000;
    memArr[1] = 8'b00000011;
    memArr[2] = 8'b11100111;
    memArr[3] = 8'b11101000;
    memArr[4] = 8'b00000011;
    memArr[5] = 8'b11100111;

    memArr[6] = 8'b11100000;
    memArr[7] = 8'b00000011;
    memArr[8] = 8'b11101000;
    memArr[9] = 8'b10010100;
    memArr[10] = 8'b11111000;
    memArr[11] = 8'b01000011;
    memArr[12] = 8'b11100111;

    memArr[13] = 8'b11100000;
    memArr[14] = 8'b00000011;
    memArr[15] = 8'b11101001;
    memArr[16] = 8'b10010100;
    memArr[17] = 8'b11111000;
    memArr[18] = 8'b01000011;
    memArr[19] = 8'b11100111;

    memArr[20] = 8'b11100000;
    memArr[21] = 8'b00000011;
    memArr[22] = 8'b11101010;
    memArr[23] = 8'b10010100;
    memArr[24] = 8'b11111000;
    memArr[25] = 8'b01000011;
    memArr[26] = 8'b11100111;

    memArr[27] = 8'b11100000;
    memArr[28] = 8'b00000011;
    memArr[29] = 8'b11101011;
    memArr[30] = 8'b10010100;
    memArr[31] = 8'b11111000;
    memArr[32] = 8'b01000011;
    memArr[33] = 8'b11100111;

    memArr[34] = 8'b11100000;
    memArr[35] = 8'b00000011;
    memArr[36] = 8'b11101100;
    memArr[37] = 8'b10010100;
    memArr[38] = 8'b11111000;
    memArr[39] = 8'b01000011;
    memArr[40] = 8'b11100111;

    memArr[41] = 8'b11100000;
    memArr[42] = 8'b00000011;
    memArr[43] = 8'b11101101;
    memArr[44] = 8'b10010100;
    memArr[45] = 8'b11111000;
    memArr[46] = 8'b01000011;
    memArr[47] = 8'b11100111;

    memArr[48] = 8'b11100000;
    memArr[49] = 8'b00000011;
    memArr[50] = 8'b11101110;
    memArr[51] = 8'b10010100;
    memArr[52] = 8'b11111000;
    memArr[53] = 8'b01000011;
    memArr[54] = 8'b11100111;

    memArr[55] = 8'b11100000;
    memArr[56] = 8'b00000011;
    memArr[57] = 8'b11101111;
    memArr[58] = 8'b10010100;
    memArr[59] = 8'b11111000;
    memArr[60] = 8'b01000011;
    memArr[61] = 8'b11100111;

    memArr[62] = 8'b11100000;
    memArr[63] = 8'b00000011;
    memArr[64] = 8'b11110000;
    memArr[65] = 8'b10010100;
    memArr[66] = 8'b11111000;
    memArr[67] = 8'b01000011;
    memArr[68] = 8'b11100111;

    memArr[69] = 8'b11100000;
    memArr[70] = 8'b00000011;
    memArr[71] = 8'b11110001;
    memArr[72] = 8'b10010100;
    memArr[73] = 8'b11111000;
    memArr[74] = 8'b01000011;
    memArr[75] = 8'b11100111;

    memArr[76] = 8'b11101000;
    memArr[77] = 8'b00100111;
    memArr[78] = 8'b11010000;
    memArr[79] = 8'b11111000;
    memArr[80] = 8'b00100111;
    memArr[81] = 8'b11010001;
    memArr[82]= 8'b00000000;
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
