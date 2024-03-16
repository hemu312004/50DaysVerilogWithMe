`timescale 1ns / 1ps


module barrelshift_tb;
reg [7:0]In;
reg [2:0]n;
reg Lr;
wire [7:0] out;
barrelshift dut(out,In,n,Lr);
initial begin
$monitor("In=%0b n=%0b Lr=%0b out=%0b",In,n,Lr,out);
In=8'd0;n=3'b0;//no shift 
#10; 
  In=8'd128;n= 3'd4; //shift 4 bit
  #10;
  In=8'd128;n= 3'd2; //shift 2 bit
  #10;
   In=8'd128;n= 3'd1; //shift by 1 bit
  #10;
   In=8'd255;n= 3'd7; //shift by 7bit
   #10;
  end
endmodule