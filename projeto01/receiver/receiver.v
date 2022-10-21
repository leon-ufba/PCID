module receiver(clk, Reset, Request, DataIn, Ack, Ready, DataOut);
  
input clk;
input Reset;
input Request;
input [15:00] DataIn;
output reg Ack             = 0;
output reg Ready           = 0;
output reg [15:00] DataOut = 16'h00;

parameter IDLE              = 3'd00;
parameter REQUEST_SIGNAL    = 3'd01;
parameter WAIT_WRITE        = 3'd02;

reg [02:00] state        = IDLE;
reg [02:00] next_state   = IDLE;
reg [03:00] counter      = 0;
reg [03:00] next_counter = 0;

always @(posedge clk, posedge Reset) begin
  state   <= (Reset) ? IDLE : next_state;
  counter <= (Reset) ? 0    : next_counter;
end

always @(state, counter, DataIn, Request) begin
  case (state)
    IDLE: begin
      next_counter <= counter;
      Ready        <= 0;
      DataOut      <= DataIn;
      next_state   <= (Request) ? REQUEST_SIGNAL : IDLE;
    end
    REQUEST_SIGNAL: begin
      Ack          <= 1;
      Ready        <= 1;
      DataOut      <= DataIn;
      next_state   <= WAIT_WRITE;
    end
    WAIT_WRITE: begin
      Ack          <= 0;
      Ready        <= (counter < 15) ? 0 : 1;
      next_counter <= (counter < 15) ? counter + 1 : 0;
      next_state   <= IDLE;
    end
    default: begin
      next_state <= IDLE;
    end
  endcase
end
 
endmodule
