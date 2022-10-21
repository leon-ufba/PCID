module receiver_control_tb;

reg clk;
reg Reset;
reg Request;
reg [15:00] data;

wire Ack;

receiver_control sc (clk, Reset, data, Request, Ack);

always #1 clk = ~clk;

integer i = 0;

initial begin

  $monitor("time = %0t \t ste = %0h \t nst = %0h \t rst = %0h \t in  = %0h \t req = %0h \t ack = %0h \t out = %0h",
  $time, sc.state, sc.next_state, Reset, data, Request, Ack, sc.rcvDataOut);
  
  clk     = 0;
  Reset   = 0;
  Request = 0;
  data    = 16'h00;
  
  #10
  for (i = 0; i < 17; i = i + 1) begin
    data <= 16'h1000 + i;
    #2 Request <= 1;
    wait(Ack == 1);
    #2 Request <= 0;
  end
  
  
end

endmodule
