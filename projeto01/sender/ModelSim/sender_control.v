module sender_control(
  clk, Reset,
  data, write, start,
  
  Transmit, Ready, sdrDataIn,
  memDataIn, memDataOut, Address, WriteEnable
);

input clk;
input Reset;

input [15:00] data;
input write;
input start;

parameter IDLE           = 4'd00;
parameter WRITE          = 4'd01;
parameter AFTER_WRITE    = 4'd02;
parameter READ           = 4'd03;
parameter AFTER_READ     = 4'd04;
parameter TRANSMISSION   = 4'd05;
parameter TRANSMISSION_2 = 4'd06;
parameter TRANSMISSION_3 = 4'd07;
parameter WAIT_READY     = 4'd08;
parameter WAIT_READY_2   = 4'd09;

reg [03:00] state        = IDLE;
reg [03:00] next_state   = IDLE;
reg [03:00] counter      = 0;
reg [03:00] next_counter = 0;

output reg  Transmit = 0;
input  wire Ready;

output reg  [15:00] sdrDataIn = 16'h00;
output reg  [15:00] memDataIn = 16'h00;
input  wire [15:00] memDataOut;

output reg  [03:00] Address = 4'h00;
output reg  WriteEnable = 0;

always @(posedge clk, posedge Reset) begin
  state   <= (Reset) ? IDLE : next_state;
  counter <= (Reset) ? 0    : next_counter;
end

always @(
  state, counter,
  data, write, start,
  memDataOut, Ready
) begin
  case (state)
    IDLE: begin
      next_counter <= (write) ? counter : (start) ? 0 : counter;
      Transmit     <= 0;
      WriteEnable  <= (write) ? 1 : 0;
      Address      <= (write) ? counter : (start) ? 0 : Address;
      memDataIn    <= (write) ? data    : memDataIn;
      next_state   <= (write) ? WRITE   : (start) ? READ : IDLE;
    end
    WRITE: begin
      WriteEnable  <= 1;
      next_state   <= AFTER_WRITE;
    end
    AFTER_WRITE: begin
      WriteEnable  <= 0;
      next_counter <= (counter < 15) ? counter + 1 : 0;
      next_state   <= IDLE;
    end
    READ: begin
      sdrDataIn    <= memDataOut;
      next_state   <= (Ready) ? IDLE : AFTER_READ;
    end
    AFTER_READ: begin
	   Address      <= counter;
      next_counter <= (Ready) ? 0 : (counter < 15) ? counter + 1 : 0;
      next_state   <= (counter == 0) ? TRANSMISSION : WAIT_READY;
    end
    TRANSMISSION: begin
      Transmit     <= 1;
      next_state   <= TRANSMISSION_2;
    end
    TRANSMISSION_2: begin
      Transmit     <= 1;
      next_state   <= TRANSMISSION_3;
    end
    TRANSMISSION_3: begin
      Transmit     <= 1;
      next_state   <= WAIT_READY;
    end
    WAIT_READY: begin
      Transmit     <= 0;
      next_state   <= (Ready) ? READ : WAIT_READY;
    end
    default: begin
      next_state   <= IDLE;
    end
  endcase
end
 
endmodule
