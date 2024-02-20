// This module implements a counter with configurable parameters.
// The counter counts upwards on each positive edge of the clock signal.
// It has an optional asynchronous reset (active-low) that resets the counter to 0 when asserted.

module MOD_N_COUNTER
  #(
    parameter N = 10,       // Maximum count value before wrapping around
    parameter WIDTH = 4      // Width of the counter output
  )
  (
    input   clk,             // Clock input
    input   rstn,            // Active-low asynchronous reset input
    output  reg[WIDTH-1:0] out // Counter output
  );

  // Counter logic triggered on the positive edge of the clock
  always @ (posedge clk) begin
    // Reset condition: If reset (active-low) is asserted
    if (!rstn) begin
      out <= 0;  // Reset the counter value to 0
    end else begin
      // Increment condition: If the counter is not at its maximum value (N-1)
      if (out == N-1)
        out <= 0; // Wrap around to 0 when the maximum is reached
      else
        out <= out + 1; // Increment the counter value
    end
  end

endmodule
