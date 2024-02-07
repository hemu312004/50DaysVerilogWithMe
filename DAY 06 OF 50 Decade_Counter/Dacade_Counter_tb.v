`timescale 1ns/1ps

module decadecounter_tb;
  
  // Declare signals
  wire [3:0] count; // Output of the counter
  reg en, clock;    // Control signals
  
  // Instantiate the decade counter module
  decade_counter dut (.en(en), .clock(clock), .count(count));
  
  // Start of simulation
  initial begin
    $display($time, " << Starting the Simulation >>");
    en = 0;
    clock = 0;
    #20 en = 1'd1; // Enable the counter after 20 time units
  end
  
  // Toggle clock every 5 time units
  always #5 clock = ~clock;
  
  // Monitor the signals and display their values
  initial
    $monitor ($time, "clock= %b, count= %d, en= %b", clock, count, en);
  
endmodule
