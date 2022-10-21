module receiver_control(
  clk, Reset,
  rcvDataOut, Ack, Ready,
  memDataIn, Address, WriteEnable
);

input clk;
input Reset;

input Ack;
input Ready;

input [15:00] rcvDataOut;

parameter IDLE           = 4'd00;
parameter WRITE          = 4'd01;

reg [03:00] state        = IDLE;
reg [03:00] next_state   = IDLE;
reg [03:00] counter      = 0;
reg [03:00] next_counter = 0;

output reg  [15:00] memDataIn = 16'h00;

output reg  [03:00] Address = 0;
output reg  WriteEnable     = 0;

always @(posedge clk, posedge Reset) begin
  state   <= (Reset) ? IDLE : next_state;
  counter <= (Reset) ? 0    : next_counter;
end

always @(
  state, counter, Ack,
  rcvDataOut, Ready
) begin
  case (state)
    IDLE: begin
      next_counter <= counter;
      Address      <= counter;
      WriteEnable  <= (Ack) ? 1 : 0;
      next_state   <= (Ack) ? WRITE : IDLE;
    end
    WRITE: begin
      Address      <= counter;
      memDataIn    <= rcvDataOut;
      WriteEnable  <= 0;
      next_counter <= (Ready) ? 0 : (counter < 15) ? counter + 1 : 0;
      next_state   <= IDLE;
    end
    default: begin
      next_state   <= IDLE;
    end
  endcase
end
 
endmodule
