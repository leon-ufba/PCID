module receiver_tb;

reg clk;
reg Reset;

reg [15:00] rcvDataIn;

reg  Request;
wire Ack;
wire Ready;
wire [15:00] rcvDataOut;

receiver rcv (clk, Reset, Request, rcvDataIn, Ack, Ready, rcvDataOut);

always #1 clk = ~clk;

integer i = 0;

initial begin

   $monitor("time = %t \t ste = %0h \t nst = %0h \t req = %h \t in = %h \t ack = %h \t rdy = %h \t out = %h",
            $time, rcv.state, rcv.next_state, Reset, Request, rcvDataIn, Ack, Ready, rcvDataOut);
	
	clk         = 0;
	Reset       = 0;
	rcvDataIn   = 0;
	Request     = 0;
	
	#10	
	for (i = 0; i < 17; i = i + 1) begin
		rcvDataIn   <= 16'h1000 + i;
		#2 Request   <= 1;
		
		wait(Ack == 1);
		#2 Request   <= 0;
	end
	
end

endmodule
