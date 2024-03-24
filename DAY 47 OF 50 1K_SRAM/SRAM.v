//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2024 22:55:13
// Design Name: 
// Module Name: SRAM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SRAM (data_out, data_in, wr, cs, addr);

  parameter addr_size = 10;
  parameter word_size = 8;
  parameter memory_size = 1024;

  input [addr_size-1 :0] addr;
  input [word_size-1 :0] data_in;
  input wr, cs;

  output [word_size-1: 0] data_out;

  reg [word_size-1: 0] mem [memory_size-1 : 0];

  assign data_out =  mem[addr];

  always @(wr or cs) 
      if (wr) mem[addr] <= data_in;
    
  

endmodule
