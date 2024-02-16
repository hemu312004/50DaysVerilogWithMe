// Test Bench for D Flip-Flop using JK Flip-Flops

module tb_d_ff_using_jk;

  reg clk, rst, d;
  wire q;

  // Instantiate the D Flip-Flop using JK Flip-Flops
  d_ff_using_jk uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Stimulus generation
  initial begin
    clk = 0;
    rst = 1;
    d = 0;

    #10 rst = 0;  // Release reset

    #5 d = 1;    // Apply input data
    #5 d = 0;

    #20 $finish;  // Finish simulation after 20 time units
  end

endmodule
