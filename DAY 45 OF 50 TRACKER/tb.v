module tb;

  reg clk, rst;

  reg [1:0] in;

  wire gpssignalout;

  TRACKER uut (clk,rst,in, gpssignalout);

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    in = 2'b00;
    #10;

    rst = 0;
    in = 2'b11;
    #10;

    in = 2'b00;
    #10;

    in = 2'b01;
    #10;

    in = 2'b00;
    #10;

    in = 2'b11;
    #10;

    $finish;
  end

endmodule