// Testbench for Gray Counter
module tb;

  reg clk;
  reg rst;
  wire [3:0] gray_out;

  // Instantiate the Gray Counter module
  Gray_Counter uut (
    .clk(clk),
    .rst(rst),
    .gray_out(gray_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Test scenario
  initial begin
    rst = 1; // Assert reset initially
    #10 rst = 0; // De-assert reset after 10 time units

    // Monitor the Gray counter output
    $monitor("Time = %0t, Gray Counter = %b", $time, gray_out);

    // Simulate for 30 time units
    #30 $finish; // Finish simulation after 30 time units
  end

endmodule
