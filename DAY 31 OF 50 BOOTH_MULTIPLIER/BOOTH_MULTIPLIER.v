`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2024 14:37:50
// Design Name: 
// Module Name: BOOTH_MULTIPLIER
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


module Booth_Multiplier(PRODUCT, A, B);
  output reg signed [7:0] PRODUCT;
  input signed [3:0] A, B;

  reg [1:0] temp;  // Two-bit temporary variable to store the concatenation of A[i] and the previous value of e.
  integer i;      // Integer for loop iteration.
  reg e;          // Single-bit variable to store the previous value of A[i].
  reg [3:0] B1;    // Four-bit variable to store the two's complement of B.

  always @(A,B)
  begin
    PRODUCT = 8'd0;  // Initialize the product to zero.
    e = 1'b0;        // Initialize e to zero.
    B1 = -B;         // Calculate the two's complement of B and store it in B1.
    
    for (i=0; i<4; i=i+1)  // Loop through the 4-bit values of A.
    begin
      temp = { A[i], e };  // Concatenate A[i] and the previous value of e into a two-bit variable temp.

      case(temp)
        2'd2 : PRODUCT[7:4] = PRODUCT[7:4] + B1;  // If temp is 2 (binary 10), add the two's complement of B to the high 4 bits of the product.
        2'd1 : PRODUCT[7:4] = PRODUCT[7:4] + B;   // If temp is 1 (binary 01), add B to the high 4 bits of the product.
      endcase

      PRODUCT = PRODUCT >> 1;     // Right shift the product by 1 bit.
      PRODUCT[7] = PRODUCT[6];    // Copy the MSB to the next bit position.
      e = A[i];                   // Update e with the current bit of A.
      
    end
  end
  
endmodule

