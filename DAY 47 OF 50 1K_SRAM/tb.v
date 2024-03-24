`timescale 1ns / 1ps

module tb;

  reg [9:0] addr;
  reg [7:0] data_in;
  reg wr, cs;
  wire [7:0] data_out;

  SRAM uut (data_out, data_in, wr, cs, addr);

  initial begin
    cs = 1'b0;
    addr = 10'b0;
    wr=0;
    cs=0;#10
    data_in= 8'b11111100;
    addr=10'b0000110000;
    wr=1'b1;
    cs=1'b1;
    #10;
    cs=0;
    addr=10'b000111100;#10;
    addr=10'b0000110000;#10;
    $finish;
    end
endmodule