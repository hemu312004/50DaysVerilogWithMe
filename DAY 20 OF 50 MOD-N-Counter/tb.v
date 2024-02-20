module tb;
  // Module parameters
  parameter N = 10;
  parameter WIDTH = 4;

  // Declare reg and wire signals
  reg clk;      // Clock signal
  reg rstn;     // Active-low asynchronous reset
  wire [WIDTH-1:0] out;  // Output signal

  // Instantiate the MOD_N_COUNTER module
  MOD_N_COUNTER uut (.clk(clk),
                    .rstn(rstn),
                    .out(out));

  // Clock generation
  always #10 clk = ~clk;  // Toggle the clock every 10 time units

  // Testbench initial block
  initial begin
    {clk, rstn} <= 0;  // Initialize clock and reset signals

    // Display simulation information
    $monitor("T=%0t rstn=%0b out=0x%0h", $time, rstn, out);

    // Wait for 2 rising edges of the clock
    repeat(2) @ (posedge clk);
    
    // Release the reset (active-low)
    rstn <= 1;

    // Wait for 20 more rising edges of the clock
    repeat(20) @ (posedge clk);

    // Finish simulation
    $finish;
  end
endmodule
