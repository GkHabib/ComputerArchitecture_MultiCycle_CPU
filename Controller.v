module Controller (clk, rst, pcInc, accAddressSel, PcOrTR, regOrMem, RegBOr0, RegAOr0, DiToCU, IrToCU,
    CznToCU, pcLoadEn, diLoadEn, accumulatorWriteEn, memoryReadEn, memoryWriteEn,
    irWriteEn, trWriteEn, bRegWriteEn, aRegWriteEn, aluOpControl, aluResWriteEn, ldCZN);

    input [4:0] DiToCU;
    input [3:0] IrToCU;
    input [2:0] CznToCU;
    input clk, rst;
    output pcInc, PcOrTR, regOrMem, RegBOr0, RegAOr0, pcLoadEn, diLoadEn, accumulatorWriteEn,
      memoryReadEn, memoryWriteEn, irWriteEn, trWriteEn, bRegWriteEn, aRegWriteEn, aluResWriteEn, ldCZN;
    output [1:0] aluOpControl, accAddressSel;

    parameter  parameter_name = parameter_value,




endmodule // Controller
