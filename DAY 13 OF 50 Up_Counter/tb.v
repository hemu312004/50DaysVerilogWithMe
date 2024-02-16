// Test Bench for Up Counter

module tb_up_counter;

  reg clk, rst;
  wire [3:0] count;

  // Instantiate the Up Counter
  up_counter uut (
    .clk(clk),
    .rst(rst),
    .count(count)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Stimulus generation
  initial begin
    clk = 0;
    rst = 1;

    #10 rst = 0;  // Release reset

    #20 $finish;  // Finish simulation after 20 time units
  end

endmodule
