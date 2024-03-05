`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2024 10:23:00
// Design Name: 
// Module Name: CUBE_VALUE
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


module CUBE_VALUE(
  input [1:0] A,            // 2-bit input A
  output [4:0] Y            // 5-bit output Y
);
  // Assignments to compute the cube value based on the input bits
  
  // Output Y[0] is directly assigned the value of the least significant bit of input A[0].
  assign Y[0] = A[0];
  
  // Output Y[1] is assigned the result of the bitwise AND operation between A[1] and A[0].
  assign Y[1] = A[1] & A[0];
  
  // Output Y[2] is hard-wired to 0.
  assign Y[2] = 1'b0;
  
  // Output Y[3] is directly assigned the value of the most significant bit of input A[1].
  assign Y[3] = A[1];
  
  // Output Y[4] is assigned the result of the bitwise AND operation between A[1] and A[0].
  assign Y[4] = A[1] & A[0];
endmodule
