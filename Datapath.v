module Datapath (clk, rst, pcInc, selAccumulatorAddress, PcOrTR, regOrMem, RegBOr0, RegAOr0, DiToCU, IrToCU,
    CznToCU, pcLoadEn, diLoadEn, accumulatorWriteEn, memoryReadEn, memoryWriteEn,
    irWriteEn, trWriteEn, bRegWriteEn, aRegWriteEn, aluOpControl, aluResWriteEn, ldCZN);

    input clk, rst, pcInc, PcOrTR, regOrMem, RegBOr0, RegAOr0, pcLoadEn, diLoadEn, accumulatorWriteEn,
      memoryReadEn, memoryWriteEn, irWriteEn, trWriteEn, bRegWriteEn, aRegWriteEn, aluResWriteEn, ldCZN;
    input [1:0] aluOpControl, selAccumulatorAddress;
    output [4:0] DiToCU;
    output [3:0] IrToCU;
    output [2:0] CznToCU;
    wire [12:0] pcOut, trOut, memAddr;
    wire [7:0] irOut, aluResOut, accumulatorOut, memoryOut, bRegInput, bRegOutput, aRegOutput, aluIn1, aluIn2, aluOut;
    wire [4:0] diOut;
    wire [2:0] cznOut, cznIn;
    wire [1:0] accumulatorAddr;
    PC PC_ (.clk(clk), .rst(rst), .inData(trOut), .outData(pcOut), .inc(pcInc), .loadEn(pcLoadEn));
    DI DI_ (.clk(clk), .rst(rst), .ld(diLoadEn), .in(irOut[4:0]), .out(diOut));
    ThreeTwoBitInputMUX AccumulatorAddressMUX_ (.in1(diOut[4:3]), .in2(irOut[1:0]), .in3(irOut[3:2]), .sel(selAccumulatorAddress), .out(accumulatorAddr));
    Accumulator Accumulator_ (.clk(clk), .rst(rst), .inData(aluResOut), .address(accumulatorAddr), .outData(accumulatorOut), .writeEn(accumulatorWriteEn));
    TwoThirteenBitInputMUX MemoryAddressMUX_ (.a(trOut), .b(pcOut), .sel(PcOrTR), .out(memAddr));
    Memory Memory_ (.clk(clk), .rst(rst), .inData(aluResOut), .address(memAddr), .outData(memoryOut), .readEn(memoryReadEn), .writeEn(memoryWriteEn));
    EightBitReg IR_ (.clk(clk), .rst(rst), .writeEn(irWriteEn), .in(memoryOut), .out(irOut));
    TR TR_ (.clk(clk), .rst(rst), .ld(trWriteEn), .in({irOut[4:0], memoryOut}), .out(trOut));
    TwoEightBitInputMUX BRegInputMUX_ (.a(memoryOut), .b(accumulatorOut), .sel(regOrMem), .out(bRegInput));
    EightBitReg BReg_ (.clk(clk), .rst(rst), .writeEn(bRegWriteEn), .in(bRegInput), .out(bRegOutput));
    EightBitReg AReg_ (.clk(clk), .rst(rst), .writeEn(aRegWriteEn), .in(accumulatorOut), .out(aRegOutput));
    TwoEightBitInputMUX BRegToALuMUX_ (.a(bRegOutput), .b(8'b0), .sel(RegBOr0), .out(aluIn1));
    TwoEightBitInputMUX ARegToALuMUX_ (.a(aRegOutput), .b(8'b0), .sel(RegAOr0), .out(aluIn2));
    ALU ALU_ (.a(aluIn1), .b(aluIn2), .opControl(aluOpControl), .c(cznOut[0]), .result(aluOut), .czn(cznIn));
    EightBitReg ALUResult_ (.clk(clk), .rst(rst), .writeEn(aluResWriteEn), .in(aluOut), .out(aluResOut));
    CZN CZN_ (.clk(clk), .rst(rst), .ld(ldCZN), .in(cznIn), .out(cznOut));
    assign DiToCU = (diOut);
    assign IrToCU = (irOut[4:0]);
    assign CznToCU = (cznOut);


endmodule // Datapath
