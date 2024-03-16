module prbs_gen_tb();
  reg clk, reset;                  // Declare clock and reset as registers
  wire rand;                       // Declare rand as a wire
  RANDOM_BIT_GENERATOR uut (rand, clk, reset); // Instantiate the prbs_gen module with the corresponding ports
  
  // Clock generation process
  initial begin
    clk = 0;                       // Initialize clock
    forever begin
      #5;                          // Wait for 5 time units
      clk = ~clk;                  // Toggle clock
    end
  end
  
  // Reset generation process
  initial begin
    reset = 1;                     // Set reset high initially
    #12;                           // Wait for 12 time units
    reset = 0;                     // Set reset low after 12 time units
    #90;                           // Wait for 90 time units
    reset = 1;                     // Set reset high again after 90 + 12 time units
    #12;                           // Wait for 12 time units
    reset = 0;                     // Set reset low after 12 time units
  end
  
  // Monitor process to display outputs
  initial begin
    $monitor("Random bit: %b | Reset=%b | Clock=%b", rand, reset, clk);
    #1000 $finish;                 // Finish simulation after 1000 time units
  end
endmodule
