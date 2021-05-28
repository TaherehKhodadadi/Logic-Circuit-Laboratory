module t_b # ( parameter n=64 , m=32);
  reg rw,enable;
  reg [n-1:0] addr;
  wire [m-1:0]data;
  reg  [m-1:0]write_data;
 
  
  assign data = (enable & rw) ? write_data: {(m-1){1'bz}};
  
  ram  tb (.rw(rw),.enable(enable),.addr(addr),.data(data));
                                  
initial begin
      enable=1; 
	  rw=1; 
	  #20
      addr=1; 
	  write_data='b 1;  
	  #20
  
      enable=1; 
	  rw=1; 
	  #20
      addr=2; 
	  write_data='b0;  
	  #20         
       
      rw=0;  
	  addr=1;  
	  #10     
      
      $finish;
       end
                     
  endmodule 
