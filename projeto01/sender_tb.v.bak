module sender_tb;

reg clk;
reg Reset;

reg Transmit;
reg [15:00] sdrDataIn;

reg  Ack;
wire Ready;
wire Request;
wire [15:00] sdrDataOut;

sender sdr (clk, Reset, Transmit, sdrDataIn, Ack, Ready, Request, sdrDataOut);

always #1 clk = ~clk;

integer i = 0;

initial begin

   $monitor("time = %t \t ste = %0h \t nst = %0h \t rst = %h \t tx = %h \t in = %h \t ack = %h \t rdy = %h \t req = %h \t out = %h",
            $time, sdr.state, sdr.next_state, Reset, Transmit, sdrDataIn, Ack, Ready, Request, sdrDataOut);
	
	clk         = 0;
	Reset       = 0;
	Transmit    = 0;
	sdrDataIn   = 0;
	Ack         = 0;
	
	#10
	
	for (i = 0; i < 17; i = i + 1) begin
		#2	
		sdrDataIn   <= i + 16;
		Transmit    <= 1;
		
		#10
		Ack         <= 1;
		
		#2
		Ack         <= 0;
	end
	
end

endmodule
