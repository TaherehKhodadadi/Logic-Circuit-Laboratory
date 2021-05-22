module Register_File(rd_a, rd_b, clk, regWrite, readReg1, readReg2, regDest, wd);
   input clk, regWrite;
   input[4:0] readReg1, readReg2, regDest;
   input[31:0] wd;
   output[31:0] rd_a, rd_b;
   reg[31:0] rd_a, rd_b;
   reg[31:0] regFile[0:31];

   always @(negedge clk) if (regWrite == 1) regFile[regDest] <= wd;
   always @(readReg1) rd_a <= (readReg1 != 0) ? regFile[readReg1] : 0;
   always @(readReg2) rd_b <= (readReg2 != 0) ? regFile[readReg2] : 0;
endmodule