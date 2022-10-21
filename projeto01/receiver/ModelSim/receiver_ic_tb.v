module receiver_ic_tb;

reg clk;
reg Reset;
reg Request;
reg [15:00]  data;
wire [15:00] memDataOut;
wire Ack;

receiver_ic rec_ic (
	.clk(clk),
	.Reset(Reset),
	.Request(Request),
	.DataIn(data),
	.q(memDataOut),
	.Ack(Ack)
);

always #1 clk = ~clk;

integer i = 0;

initial begin

  $monitor("time = %0t \t rst = %0h \t req = %0h \t in  = %0h \t out = %0h \t ack = %0h",
  $time, Reset, Request, data, memDataOut, Ack);
  
  clk     = 0;
  Reset   = 0;
  Request = 0;
  data    = 16'h00;
  
  #10
  for (i = 0; i < 17; i = i + 1) begin
    data <= 16'h3000 + i;
    #2 Request <= 1;
    wait(Ack == 1);
    #2 Request <= 0;
  end
  
  
end

endmodule
