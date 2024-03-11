`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 11:39:15
// Design Name: 
// Module Name: palindrome_detector
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


module palindrome_detector(
    input [7:0] data_in,
    input clk,
    output reg is_palindrome);

    integer i;
    reg [7:0] reversed_data;
    
    always @(*) begin
        for (i = 0; i < 8; i = i + 1) begin
            reversed_data[i] = data_in[7 - i];
        end
    end
    
    always @(posedge clk) begin
        if (data_in == reversed_data)
            is_palindrome <= 1;
        else
            is_palindrome <= 0;
    end

endmodule