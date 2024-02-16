`timescale 1ns/1ns

module Shiftregister_PISO_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in ns

  // Signals
  reg Clk;
  reg [3:0] Parallel_In;
  reg load;
  wire Serial_Out;

  // Instantiate the module
  Shiftregister_PISO uut (
    .Clk(Clk),
    .Parallel_In(Parallel_In),
    .load(load),
    .Serial_Out(Serial_Out)
  );

  // Clock generation
  initial begin
    Clk = 0;
    forever #((CLK_PERIOD)/2) Clk = ~Clk;
  end

  // Test stimulus
  initial begin
    // Initialize inputs
    Parallel_In = 4'b0000;
    load = 0;

    // Apply stimulus
    #10 Parallel_In = 4'b1010; load = 1;
    #10 Parallel_In = 4'b1100; load = 1;
    #10 Parallel_In = 4'b1111; load = 1;
    #10 Parallel_In = 4'b0101; load = 1;
    #10 load = 0;

    // Add more test cases as needed

    #50 $finish; // Finish simulation after some time
  end

  // Monitor signals
  always @(posedge Clk) begin
    $display("Time=%0t, Serial_Out=%b", $time, Serial_Out);
  end

endmodule
