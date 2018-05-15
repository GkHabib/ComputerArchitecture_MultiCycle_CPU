module Datapath (clk, rst, pcInc, reg1Or2, PcOrTR, regOrMem, RegBOr0, RegAOr0, DiToCU, IrToCU,
    CznToCU, pcLoadEn, diLoadEn);

    input clk, rst, reg1Or2, PcOrTR, regOrMem, RegBOr0, RegAOr0, pcLoadEn, diLoadEn;
    output [4:0] DiToCU;
    output [3:0] IrToCU;
    output [2:0] CznToCU;
    wire [12:0] pcOut, trOut;
    PC PC_ (.clk(clk), .rst(rst), .inData(trOut), .outData(pcOut), .inc(pcInc), .loadEn(pcLoadEn));
    DI DI_ (.clk(clk), .rst(rst), .ld(diLoadEn), .in, out);
    TwoTwoBitInputMUX AccumulatorAddressMUX_ (a, b, sel, out);
    Accumulator Accumulator_ (clk, rst, inData, address, outData, writeEn);
    TwoThirteenBitInputMUX MemoryAddressMUX_ (a, b, sel, out);
    Memory Memory_ (clk, rst, inData, address, outData, readEn, writeEn);
    EightBitReg IR_ (clk, rst, writeEn, in, out);
    TR TR_ (clk, rst, ld, in, out);
    TwoEightBitInputMUX BRegInputMUX_ (a, b, sel, out);
    EightBitReg BReg_ (clk, rst, writeEn, in, out);
    EightBitReg AReg_ (clk, rst, writeEn, in, out);
    TwoEightBitInputMUX BRegToALuMUX_ (a, b, sel, out);
    TwoEightBitInputMUX ARegToALuMUX_ (a, b, sel, out);
    ALU ALU_ (a, b, opControl, c, result, czn);
    EightBitReg ALUResult_ (clk, rst, writeEn, in, out);
    CZN CZN_ (clk, rst, ld, in, out);


endmodule // Datapath
