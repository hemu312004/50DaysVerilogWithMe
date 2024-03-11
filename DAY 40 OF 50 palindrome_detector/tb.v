`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 11:43:40
// Design Name: 
// Module Name: tb
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


module palindrome_detector_tb();

        reg clk;
        reg [7:0] data_in;
        wire is_palindrome;
        
        palindrome_detector dut(.clk(clk),.data_in(data_in),.is_palindrome(is_palindrome));
        
        initial
        begin
            clk = 0;
            forever #5 clk = ~clk;
        end
        
        initial
        begin
            data_in = 8'b11001101;
            #10;
            data_in = 8'b00111100;
            #10;
            data_in = 8'b10101010;
            #10;
            data_in = 8'b11110000;
            #10;
            data_in = 8'b11011011;
            #10;   
        end
        
        initial
        begin
            $monitor("clk = %b,data_in = %b,is_palindrome = %b",clk,data_in,is_palindrome);
            #50;
            $finish;
        end
                  
endmodule