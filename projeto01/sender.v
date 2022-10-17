module sender(clk, Reset, Transmit, DataIn, Ack, Ready, Request, DataOut);
  
input  clk;
input  Reset;
input  Transmit;
input  [15:00] DataIn;
input  Ack;
output reg Ready;
output reg Request;
output reg [15:00] DataOut = 0;

parameter IDLE              = 3'd00;
parameter TRANSMIT_SIGNAL   = 3'd01;
parameter TRANSMIT_SIGNAL_2 = 3'd02;
parameter REQUEST           = 3'd03;
parameter ACKNOWLEDGE       = 3'd04;
parameter NEXT_TRANSMISSION = 3'd05;

reg [02:00] state        = IDLE;
reg [02:00] next_state   = IDLE;
reg [03:00] counter      = 0;
reg [03:00] next_counter = 0;

always @(posedge clk, posedge Reset) begin
  state   <= (Reset) ? IDLE : next_state;
  counter <= (Reset) ? 0    : next_counter;
end

always @(state, counter, Transmit, DataIn, Ack) begin
  case (state)
    IDLE: begin
	   next_counter <= counter;
		Ready        <= 0;
		Request      <= 0;
		DataOut      <= DataIn;
		next_state   <= (counter != 0) ? REQUEST : (Transmit) ? TRANSMIT_SIGNAL : IDLE;
    end
    TRANSMIT_SIGNAL: begin
      next_state   <= (Transmit) ? TRANSMIT_SIGNAL_2 : IDLE;
    end
    TRANSMIT_SIGNAL_2: begin
		DataOut      <= DataIn;
      next_state   <= (Transmit) ? REQUEST : IDLE;
    end
    REQUEST: begin
		Request      <= 1;
		Ready        <= 0;
		DataOut      <= DataIn;
		next_state   <= (Ack) ? ACKNOWLEDGE : REQUEST;
    end
    ACKNOWLEDGE: begin
		Request      <= 0;
		Ready        <= 1;
		next_state   <= NEXT_TRANSMISSION;
    end
    NEXT_TRANSMISSION: begin
		Request      <= 0;
		Ready        <= (counter < 15) ? 0 : 1;
		next_counter <= (counter < 15) ? counter + 1 : 0;
		next_state   <= IDLE;
    end
    default: begin
      next_state   <= IDLE;
    end
  endcase
end
 
endmodule
