`timescale 1ns/1ns

module tb_siso;

reg din;
reg clk;
reg reset;
wire [2:0] s;
wire dout;

siso uut (
  .din(din),
  .clk(clk),
  .reset(reset),
  .dout(dout)
);

// Declare s values
assign s[0] = dout;
assign s[1] = uut.s[1];
assign s[2] = uut.s[2];

// Clock generation
initial begin
  clk = 1;
  forever #1 clk = ~clk;
end

// Stimulus generation
initial begin
  reset = 1;
  din = 1;

  // Apply reset and then deassert it
  #10 reset = 0;

  // Test case 1
  #10 din = 1;

  // Test case 2
  #10 din = 0;

  // Test case 3
  #10 din = 1;

  // Test case 4
  #10 din = 0;

  // You can add more test cases as needed

  #100 $finish; // End simulation after 100 time units
end

endmodule
