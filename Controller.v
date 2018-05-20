module Controller (clk, rst, pcInc, done, accAddressSel, PcOrTR, regOrMem, RegBOr0, RegAOr0, DiToCU, IrToCU,
    CznToCU, pcLoadEn, diLoadEn, accumulatorWriteEn, memoryWriteEn,
    irWriteEn, trWriteEn, bRegWriteEn, aRegWriteEn, aluOpControl, aluResWriteEn, ldCZN);

    input [4:0] DiToCU;
    input [3:0] IrToCU;
    input [2:0] CznToCU;
    input clk, rst, start;
    output reg done, pcInc, PcOrTR, regOrMem, RegBOr0, RegAOr0, pcLoadEn, diLoadEn, accumulatorWriteEn,
      memoryWriteEn, irWriteEn, trWriteEn, bRegWriteEn, aRegWriteEn, aluResWriteEn, ldCZN;
    output reg [1:0] aluOpControl, accAddressSel;

    reg[3:0] ps, ns;
    parameter[3:0]  IDLE = 0, START = 1, FETCH = 2, FETCH16ORNOT = 3,
      LDADDNACC = 4, CALC16 = 5, LDACC = 6, CALC = 7, LDADDINPC = 8, WRINACC = 9, WRRESINACCORMEM = 10;
    always @ ( ps, start, DiToCU, IrToCU, CznToCU ) begin
      ns <= ps;
      case(ps)
        IDLE: ns <= (start == 1) ? START : ps;
        START: ns <= (start == 0) ? FETCH : ps;
        FETCH: ns <= FETCH16ORNOT;
        FETCH16ORNOT: begin
            if ((IrToCU[7] == 1'b0) | (IrToCU[7:5] == 3'b110)) begin
              ns <= LDADDNACC;
            end
            else if (IrToCU[7:5] == 3'b111) begin
              ns <= FETCH;
            end
            else begin
              ns <= LDACC;
            end
          end
        LDADDNACC: begin
            if (IrToCU[7:5] == 3'b110) begin
              ns <= LDADDINPC;
            end
            else begin
              ns <= CALC16;
            end
          end
        CALC16: ns <= WRRESINACCORMEM;
        WRRESINACCORMEM: ns <= FETCH;
        LDACC: ns <= CALC;
        CALC: ns <= WRINACC;
        LDADDINPC: ns <= FETCH;
        WRINACC: ns <= FETCH;
      endcase
    end

    always @ ( ps, start, DiToCU, IrToCU, CznToCU ) begin
    done <= 0; pcInc <= 0; PcOrTR <= 0; regOrMem <= 0;
    RegBOr0 <= 0; RegAOr0 <= 0;
    pcLoadEn <= 0; diLoadEn <= 0; accumulatorWriteEn <= 0;
    memoryWriteEn <= 0; irWriteEn <= 0; trWriteEn <= 0;
    bRegWriteEn <= 0; aRegWriteEn <= 0; aluResWriteEn <= 0;
    ldCZN <= 0;
    aluOpControl <= 2'b00; accAddressSel <= 2'b00;
    case (ps)
      IDLE: done <= 1;
      FETCH: begin PcOrTR <= 1; irWriteEn <= 1; pcInc <= 1; end
      FETCH16ORNOT: begin
          if((IrToCU[7] == 1'b0) | (IrToCU[7:5] == 3'b110)) begin
            trWriteEn <= 1; PcOrTR <= 1; pcInc <= 1;
          end
          else if (IrToCU[7:5] == 3'b111) begin
            diLoadEn <= 1;
          end
          else begin
            accAddressSel <= 2'b01; regOrMem <= 1; bRegWriteEn <= 1;
          end
        end
      LDACC: begin accAddressSel <= 2'b10; aRegWriteEn <= 1; end
      LDADDNACC: begin bRegWriteEn <= 1; aRegWriteEn <= 1; accAddressSel <= 2'b01; end
      CALC16: begin
          aluResWriteEn <= 1;
          case (IrToCU[7:5])
            3'b000: begin ldCZN <= 1; RegAOr0 <= 1; end
            3'b001: begin RegBOr0 <= 1; end
            3'b010: begin ldCZN <= 1; end
            3'b011: begin ldCZN <= 1; aluOpControl <= 2'b01; end
          endcase
        end
      WRRESINACCORMEM: begin
          case (IrToCU[7:5])
            3'b000: begin accumulatorWriteEn <= 1; end
            3'b001: begin memoryWriteEn <= 1; end
            3'b010: begin accumulatorWriteEn <= 1;  end
            3'b011: begin accumulatorWriteEn <= 1;  end
          endcase
        end
      CALC: begin
          aluResWriteEn <= 1;
          case (IrToCU[5:4])
            2'b00: begin RegBOr0 <= 1; end
            2'b01: begin ldCZN <= 1; end
            2'b10: begin ldCZN <= 1; aluOpControl <= 2'b01; end
            2'b11: begin ldCZN <= 1; aluOpControl <= 2'b10; end
          endcase
        end
      LDADDINPC: begin
          case (DiToCU[2:1])
            2'b00: pcLoadEn <= 1;
            2'b01: pcLoadEn <= CznToCU[2] == 1 ? 1 : 0;
            2'b10: pcLoadEn <= CznToCU[1] == 1 ? 1 : 0;
            2'b11: pcLoadEn <= CznToCU[0] == 1 ? 1 : 0;
          endcase
        end
      WRINACC: begin accAddressSel <= 2'b01; accumulatorWriteEn <= 1; end

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
