module RANDOM_BIT_GENERATOR(rand, clk, reset);
  //Inputs
  input clk, reset;
  //Output
  output rand;
  wire rand;
  reg [3:0] temp; // Register to hold the PRBS state

  // Reset initialization
  always @(posedge reset)
  begin
    temp <= 4'hf; // Initialize the PRBS state to 1111
  end

  // PRBS generation process triggered on positive edge of clock
  always @(posedge clk)
  begin
    if (~reset) // If reset is active
    begin
      // Generate next PRBS bit using XOR feedback
      temp <= {temp[0]^temp[1], temp[3], temp[2], temp[1]};
    end
  end

  // Output the first bit of the PRBS sequence
  assign rand = temp[0];
endmodule
