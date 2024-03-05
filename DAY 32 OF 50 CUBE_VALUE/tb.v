`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2024 10:31:00
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


module tb();
reg[1:0] A;
wire[4:0] Y;
CUBE_VALUE UUT(A,Y);
initial begin
for(integer i=0; i<10;i=i+1) begin
A=$random();
#10;
$display("A=%d,Y=%d" ,A,Y);

end 
end 
initial begin
#110;
$finish();
end
endmodule

