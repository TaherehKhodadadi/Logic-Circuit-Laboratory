module ram #( parameter n=64,m=32) (rw,addr,data,enable);
  input rw,enable;
  inout [m-1:0]data;
  input [n-1:0] addr;
  reg [m-1:0] ram [(2**n)-1:0]; 
  reg [m-1:0]data_reg;
  assign data = (enable & !rw ) ? data_reg : {(m-1){1'bz}};
  
  always @ (*) begin
   
    if(enable) begin
      if(rw) 
        ram[addr]<=data;
        else
          data_reg <= ram[addr] ;
    end
  end
endmodule
