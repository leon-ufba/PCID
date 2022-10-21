module receiver_control(
  clk, Reset,
  data, Request, Ack
);

input clk;
input Reset;

input [15:00] data;
input  Request;

output Ack;
wire [15:00] rcvDataOut;

parameter IDLE           = 4'd00;
parameter WRITE          = 4'd01;

reg [03:00] state        = IDLE;
reg [03:00] next_state   = IDLE;
reg [03:00] counter      = 0;
reg [03:00] next_counter = 0;

wire Ready;

reg  [15:00] rcvDataIn = 16'h00;
reg  [15:00] memDataIn = 16'h00;
wire [15:00] memDataOut;

reg  [03:00] Address = 0;
reg  ReadEnable      = 0;
reg  WriteEnable     = 0;

receiver rcv (clk, Reset, Request, rcvDataIn, Ack, Ready, rcvDataOut);
receiver_memory rmem (clk, memDataIn, Address, ReadEnable, WriteEnable, memDataOut);

always @(posedge clk, posedge Reset) begin
  state   <= (Reset) ? IDLE : next_state;
  counter <= (Reset) ? 0    : next_counter;
end

always @(
  state, counter, Ack,
  data, Ready
) begin
  case (state)
    IDLE: begin
      next_counter <= counter;
      Address      <= counter;
      rcvDataIn    <= data;
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
