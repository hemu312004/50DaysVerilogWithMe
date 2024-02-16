module Shiftregister_PISO(
  input Clk,            // Clock input
  input [3:0] Parallel_In, // Parallel input data
  input load,           // Load control signal
  output reg Serial_Out  // Serial output data
);
  reg [3:0] tmp;          // Shift register storage

  always @(posedge Clk) begin
    if (load)             // Check if load is active
      tmp <= Parallel_In; // Load parallel data into shift register
    else
      begin
        Serial_Out <= tmp[3]; // Output the most significant bit serially
        tmp <= {tmp[2:0], 1'b0}; // Shift data to the left
      end
  end
endmodule
