module sender_control_tb;


reg clk;
reg Reset;
reg Ack;

reg [15:00] data;
reg write;
reg start;

wire Request;
wire sdrDataOut;

sender_control sc (clk, Reset, Ack, data, write, start, Request, sdrDataOut);

always #1 clk = ~clk;

integer i = 0;

initial begin

  $monitor("time = %0t \t ste = %0h \t nst = %0h \t rst = %0h \t ack = %0h \t in  = %0h \t wrt = %0h \t str = %0h \t req = %0h \t out = %0h",
  $time, sc.state, sc.next_state, Reset, Ack, data, write, start, Request, sdrDataOut);
  
  clk   = 0;
  Reset = 0;
  Ack   = 0;
  data  = 16'h00;
  write = 0;
  start = 0;
  
  
  #2
  write <= 1;
  for (i = 0; i < 18; i = i + 1) begin
    #2
    write <= 1;
    data  <= 16'h1000 + i;
  end
  write <= 0;
  
  
  #10
  #2
  start <= 1;
  #4
  start <= 0;
  
  
  for (i = 0; i < 17; i = i + 1) begin
    wait(Request == 1)
    #2  Ack   <= 1;
    #2  Ack   <= 0;
    #2  Ack   <= 0;
  end
  
  
end

endmodule
