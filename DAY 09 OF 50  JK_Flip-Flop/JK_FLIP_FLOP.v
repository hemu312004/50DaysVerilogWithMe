module JK_flipflop (
  input clk, rst_n, // Clock and active-low asynchronous reset inputs
  input j, k, // JK inputs
  output reg q, // Output representing the state of the JK flip-flop
  output q_bar // Complementary output of q
);

// Flip-flop process sensitive to positive edge of clock
always @(posedge clk) begin
  if (!rst_n) // If reset is asserted
    q <= 1'b0; // Set output q to logic 0
  else begin
    case ({j, k}) // Case statement based on JK inputs
      2'b00: q <= q; // No change
      2'b01: q <= 1'b0; // Reset
      2'b10: q <= 1'b1; // Set
      2'b11: q <= ~q; // Toggle
    endcase
  end
end

// Assign complementary output
assign q_bar = ~q;

endmodule
