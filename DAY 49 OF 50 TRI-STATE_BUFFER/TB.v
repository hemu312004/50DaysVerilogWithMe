`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2024 13:21:11
// Design Name: 
// Module Name: TB
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


module tristatebuffer_tb;
reg a,en;
wire b;
TRI_STATE_BUFFER dut(b,a,en);
initial begin
$monitor("a=%0b en=%0b b=%0b",a,en,b);
  en = 0; a = 1; #10;
  en = 1; a = 1; #10;
  en = 1; a = 0; #10;
  en = 1; a = 0; #10;
  end
endmodule