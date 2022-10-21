module receiver_memory_tb;

reg clk;
reg ReadEnable;
reg WriteEnable;
reg [15:00] DataIn;
reg [03:00] Address;
wire [15:00] DataOut;

receiver_memory SM(clk, DataIn, Address, ReadEnable, WriteEnable, DataOut);

always #1 clk = ~clk;

initial begin

  $monitor("time = %t \t a = %h \t r = %h \t w = %h \t in = %h \t out = %h",
          $time, Address, ReadEnable, WriteEnable, DataIn, DataOut);
  
  clk         = 0;
  ReadEnable  = 0;
  WriteEnable = 0;
  Address     = 0;
  DataIn      = 0;
  
  #10
  
  #2
  DataIn      <= 16'hABCD;
  Address     <= 15;
  WriteEnable <= 1;
  
  #2
  WriteEnable <= 0;
  ReadEnable  <= 1;
  
  #2
  ReadEnable  <= 0;
  
  
  #2
  DataIn      <= DataOut + 1;
  Address     <= Address + 1;
  WriteEnable <= 1;
  
  #2
  WriteEnable <= 0;
  ReadEnable  <= 1;
  
  #2
  ReadEnable  <= 0;
  
end

endmodule
