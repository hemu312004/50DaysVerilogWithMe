// Code your testbench here
// or browse Examples
module traffic_tb();
  wire [2:0] north,south,east,west;
  reg clock,reset;
  traffic DUT(north,south,east,west,clock,reset);
  initial
    begin
      clock=1'b1;
      forever #5 clock=~clock;
    end
  initial
    begin
      reset=1'b1;
      #10 reset=1'b0;
      #1000;
      $dumpfile("dump.vcd");
      $dumpvars(1);
      $monitor("clock=%d,north road=%b,south road=%b,east road=%b,west road=%b,reset=%b",clock,north,south,east,west,reset);//printf
      clock=0;
      #8000;//limitiation of output
      $finish;
    end
endmodule
