module CPU (clk, rst, start, done);
  input clk, rst, start;
  output done;
  wire [4:0] DiToCU;
  wire [3:0] IrToCU;
  wire [2:0] CznToCU;
  wire pcInc, PcOrTR, regOrMem, RegBOr0, RegAOr0, pcLoadEn, diLoadEn, accumulatorWriteEn,
    memoryWriteEn, irWriteEn, trWriteEn, bRegWriteEn, aRegWriteEn, aluResWriteEn, ldCZN;
  wire [1:0] aluOpControl, accAddressSel;

  Datapath DP(.clk(clk), .rst(rst), .pcInc(pcInc), .accAddressSel(accAddressSel), .PcOrTR(PcOrTR), .regOrMem(regOrMem), .RegBOr0(RegBOr0), .RegAOr0(RegAOr0), .DiToCU(DiToCU), .IrToCU(IrToCU),
      .CznToCU(CznToCU), .pcLoadEn(pcLoadEn), .diLoadEn(diLoadEn), .accumulatorWriteEn(accumulatorWriteEn), .memoryWriteEn(memoryWriteEn),
      .irWriteEn(irWriteEn), .trWriteEn(trWriteEn), .bRegWriteEn(bRegWriteEn), .aRegWriteEn(aRegWriteEn), .aluOpControl(aluOpControl), .aluResWriteEn(aluResWriteEn), .ldCZN(ldCZN));
  Controller CU(.clk(clk), .rst(rst), .start(start), .pcInc(pcInc), .done(done), .accAddressSel(accAddressSel), .PcOrTR(PcOrTR), .regOrMem(regOrMem), .RegBOr0(RegBOr0), .RegAOr0(RegAOr0), .DiToCU(DiToCU), .IrToCU(IrToCU),
          .CznToCU(CznToCU), .pcLoadEn(pcLoadEn), .diLoadEn(diLoadEn), .accumulatorWriteEn(accumulatorWriteEn), .memoryWriteEn(memoryWriteEn),
          .irWriteEn(irWriteEn), .trWriteEn(trWriteEn), .bRegWriteEn(bRegWriteEn), .aRegWriteEn(aRegWriteEn), .aluOpControl(aluOpControl), .aluResWriteEn(aluResWriteEn), .ldCZN(ldCZN));
endmodule // CPU
