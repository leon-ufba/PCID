module sender_memory(clk, DataIn, Address, ReadEnable, WriteEnable, DataOut);

input clk;
input ReadEnable;
input WriteEnable;
input [03:00] Address;
input [15:00] DataIn;
output reg [15:00] DataOut = 16'h00;

parameter IDLE  = 2'd00;
parameter READ  = 2'd01;
parameter WRITE = 2'd02;

//Define os registradores de endereço e memória
reg [15:00] mem [15:00]; // unpacked array of 16 16-bit vectors
reg [01:00] state      = IDLE;
reg [01:00] next_state = IDLE;

//Lê a operação e executa
always@(posedge clk) begin
  state <= next_state;
end

always@(state, ReadEnable, WriteEnable, Address, DataIn) begin
  case (state)
    IDLE: begin
    next_state     <= (ReadEnable) ? READ : (WriteEnable) ? WRITE : IDLE;
    end
    READ: begin
      DataOut      <= mem[Address];
      next_state   <= (ReadEnable) ? READ : (WriteEnable) ? WRITE : IDLE;
    end
    WRITE: begin
      mem[Address] <= DataIn;
      next_state   <= (ReadEnable) ? READ : IDLE;
    end
    default: begin
      next_state   <= IDLE;
    end
  endcase
end

endmodule
