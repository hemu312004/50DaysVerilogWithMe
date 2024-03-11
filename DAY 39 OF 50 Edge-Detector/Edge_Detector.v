`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 09:48:25
// Design Name: 
// Module Name: Edge_Detector
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


module Edge_Detector(

  input sig,
  input clk,
  output pe  );
  
  reg sig_dly;
  
  always @(posedge clk) begin
  sig_dly <= sig;
  end 
  
  assign pe=sig&~sig_dly;
endmodule
