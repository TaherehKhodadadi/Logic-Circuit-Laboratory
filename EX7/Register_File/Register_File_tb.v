`timescale 1ns/1ps
module Register_File_tb;
   reg reset_; initial begin reset_=0; #22 reset_=1; #600; $stop; end
   reg clk;  initial clk<=0;   
   
   always 
   #5 clk<=(!clk);
   
   reg [4:0] RS, RT, RD;
   reg REG_WRITE;
   reg [31:0] WRITE_DATA_REG;
   wire [31:0] readData1, readData2;
   initial begin
      wait(reset_==1); RS<=32'hXXXXXXXX; RT<=32'hXXXXXXXX; REG_WRITE<=0;
      
      @(posedge clk); RS<=0;  RT<=1;   @(posedge clk); RS<=1;  RT<=2;   @(posedge clk); RS<=2;  RT<=3;   @(posedge clk); RS<=3;  RT<=4;
      @(posedge clk); RS<=4;  RT<=5;   @(posedge clk); RS<=5;  RT<=6;   @(posedge clk); RS<=6;  RT<=7;   @(posedge clk); RS<=7;  RT<=8;
      @(posedge clk); RS<=8;  RT<=9;   @(posedge clk); RS<=9;  RT<=10;  @(posedge clk); RS<=10; RT<=11;  @(posedge clk); RS<=11; RT<=12;
      @(posedge clk); RS<=12; RT<=13;  @(posedge clk); RS<=13; RT<=14;  @(posedge clk); RS<=14; RT<=15;  @(posedge clk); RS<=15; RT<=16;
      
      #10 REG_WRITE<=1; WRITE_DATA_REG=32'h12345678;
       
      @(posedge clk); RD<=0;  WRITE_DATA_REG<=1;  @(posedge clk); RD<=1;  WRITE_DATA_REG<=2;  @(posedge clk); RD<=2;  WRITE_DATA_REG<=3;  @(posedge clk); RD<=3;  WRITE_DATA_REG<=4;
      @(posedge clk); RD<=4;  WRITE_DATA_REG<=5;  @(posedge clk); RD<=5;  WRITE_DATA_REG<=6;  @(posedge clk); RD<=6;  WRITE_DATA_REG<=7;  @(posedge clk); RD<=7;  WRITE_DATA_REG<=8;
      @(posedge clk); RD<=8;  WRITE_DATA_REG<=9;  @(posedge clk); RD<=9;  WRITE_DATA_REG<=10; @(posedge clk); RD<=10; WRITE_DATA_REG<=11; @(posedge clk); RD<=11; WRITE_DATA_REG<=12;
      @(posedge clk); RD<=12; WRITE_DATA_REG<=13; @(posedge clk); RD<=13; WRITE_DATA_REG<=14; @(posedge clk); RD<=14; WRITE_DATA_REG<=15; @(posedge clk); RD<=15; WRITE_DATA_REG<=16;
      
      #10 RS<=32'hXXXXXXXX; RT<=32'hXXXXXXXX; REG_WRITE<=0; #10
      
      @(posedge clk); RS<=0;  RT<=1;   @(posedge clk); RS<=1;  RT<=2;   @(posedge clk); RS<=2;  RT<=3;   @(posedge clk); RS<=3;  RT<=4;
      @(posedge clk); RS<=4;  RT<=5;   @(posedge clk); RS<=5;  RT<=6;   @(posedge clk); RS<=6;  RT<=7;   @(posedge clk); RS<=7;  RT<=8;
      @(posedge clk); RS<=8;  RT<=9;   @(posedge clk); RS<=9;  RT<=10;  @(posedge clk); RS<=10; RT<=11;  @(posedge clk); RS<=11; RT<=12;
      @(posedge clk); RS<=12; RT<=13;  @(posedge clk); RS<=13; RT<=14;  @(posedge clk); RS<=14; RT<=15;  @(posedge clk); RS<=15; RT<=16;
      #180 $finish;
   end
   regfile REGF(clk, REG_WRITE, RS, RT, RD, WRITE_DATA_REG, readData1, readData2);
endmodule
