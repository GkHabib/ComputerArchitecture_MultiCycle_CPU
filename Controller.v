module Controller (clk, rst, pcInc, accAddressSel, PcOrTR, regOrMem, RegBOr0, RegAOr0, DiToCU, IrToCU,
    CznToCU, pcLoadEn, diLoadEn, accumulatorWriteEn, memoryReadEn, memoryWriteEn,
    irWriteEn, trWriteEn, bRegWriteEn, aRegWriteEn, aluOpControl, aluResWriteEn, ldCZN);

    input [4:0] DiToCU;
    input [3:0] IrToCU;
    input [2:0] CznToCU;
    input clk, rst, start;
    output reg done, pcInc, PcOrTR, regOrMem, RegBOr0, RegAOr0, pcLoadEn, diLoadEn, accumulatorWriteEn,
      memoryReadEn, memoryWriteEn, irWriteEn, trWriteEn, bRegWriteEn, aRegWriteEn, aluResWriteEn, ldCZN;
    output reg [1:0] aluOpControl, accAddressSel;

    reg[4:0] ps, ns;
    //parameter[]  parameter_name = parameter_value,
    always @ ( ps, start, DiToCU, IrToCU, CznToCU ) begin
      ns <= ps;
      case(ps)
        IDLE: ns <= (start == 1) ? START : ps;
        START: ns <= (start == 0) ? FETCH : ps;
        FETCH: begin
            case(IrToCU[])
          end
        FETCH16:
        LDDATA:
        WRDATAINREG:
        CALC:
        REWRDATA:
        LDI:
        LDFIRSTREG:
        LDSECREG:
        WRALURES:
        WRINACC:

      endcase
    end

    always @ ( ps, start, DiToCU, IrToCU, CznToCU ) begin
    done <= 0; pcInc <= 0; PcOrTR <= 0; regOrMem <= 0;
    RegBOr0 <= 0; RegAOr0 <= 0;
    pcLoadEn <= 0; diLoadEn <= 0; accumulatorWriteEn <= 0;
    memoryReadEn <= 0; memoryWriteEn <= 0; irWriteEn <= 0;
    trWriteEn <= 0; bRegWriteEn <= 0; aRegWriteEn <= 0; aluResWriteEn <= 0;
    ldCZN <= 0;
    aluOpControl <= 2'b00; accAddressSel <= 2'b00;
    case (ps)
      IDLE: done <= 1;
      FETCH: begin memoryReadEn <= 1; PcOrTR <= 1; irWriteEn <= 1; pcInc <= 1; end
      FETCH16: begin memoryReadEn <= 1; PcOrTR <= 1; irWriteEn <= 1; pcInc <= 1; trWriteEn <= 1; end
      LDDATA: begin memoryReadEn <= 1; end
      WRDATAINREG: begin aRegWriteEn <= 1; bRegWriteEn <= 1; end
      //CALC: begin decide on opcode  end
      //REWRDATA: 

    endcase
    end

    always @ ( posedge clk, posedge rst ) begin
      if (rst) begin
        ps <= IDLE;
      end
      else begin
        ps <= ns;
      end
    end
endmodule // Controller
