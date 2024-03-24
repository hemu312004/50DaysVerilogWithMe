`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2024 13:19:46
// Design Name: 
// Module Name: TRI_STATE_BUFFER
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


module TRI_STATE_BUFFER(b,a,en);
output reg b;
input a,en;
always @ *
begin
if(en)
b=a;
else
b=1'bz;
end


endmodule