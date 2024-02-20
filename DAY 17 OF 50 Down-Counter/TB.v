module TB();
  reg clk, reset;         // Clock and reset signals
  wire [3:0] counter;      // 4-bit counter output

  // Instantiate Down_Counter module
  Down_Counter uut(
    .clk(clk),             // Connect clk to Down_Counter module
    .reset(reset),         // Connect reset to Down_Counter module
    .counter(counter)      // Connect counter to Down_Counter module
  );

  // Clock generation
  initial begin 
    clk = 0;
    forever #5 clk = ~clk;  // Toggle clk every 5 time units
  end

  // Initial block to apply reset after a delay
  initial begin
    reset = 1;             // Activate reset initially
    #20;                   // Wait for 20 time units
    reset = 0;             // Deactivate reset
  end

endmodule
