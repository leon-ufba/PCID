module connection_tb;

reg clk;
reg Reset;
reg Ack;

reg [15:00] data;
reg write;
reg start;

wire Request;
wire [15:00] sdrDataOut;

connection conn (
	.clk(clk),
	.Reset(Reset),
	.write(write),
	.start(start),
	.data(data),
	.Request(Request),
	.sdrDataOut(sdrDataOut),	.Ack(Ack)
);

always #1 clk = ~clk;

integer i = 0;

initial begin

  $monitor("time = %0t \t clk = %0h \t rst = %0h \t wrt = %0h \t str = %0h \t in  = %0h \t ack = %0h \t req = %0h \t out = %0h",
  $time, clk, Reset, write, start, data, Ack, Request, sdrDataOut);
  
  clk   = 0;
  Reset = 0;
  write = 0;
  start = 0;
  data  = 16'h00;
  Ack   = 0;


  // send initialized memory
  
  #10
  start <= 1;
  #2
  start <= 0;
  
  for (i = 0; i < 16; i = i + 1) begin
    wait(Request == 1)
    #2  Ack   <= 1;
    #2  Ack   <= 0;
    #2  Ack   <= 0;
  end
  #2  Ack   <= 1;
  
  // send change memory

  #10
  for (i = 0; i < 18; i = i + 1) begin
    #4
    data  <= 16'h1000 + i;
    write <= 1;
    #2
    write <= 0;
  end
  
  // send changed memory

  #10
  start <= 1;
  #2
  start <= 0;
  
  for (i = 0; i < 16; i = i + 1) begin
    wait(Request == 1)
    #2  Ack   <= 1;
    #2  Ack   <= 0;
    #2  Ack   <= 0;
  end
  #2  Ack   <= 1;
  
end

endmodule
