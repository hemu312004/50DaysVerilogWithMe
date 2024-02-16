// Up Counter

module up_counter (
    input wire clk,        // Clock input
    input wire rst,        // Reset input
    output reg [3:0] count  // 4-bit counter output
);

  // Counter logic
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      count <= 4'b0000;   // Reset the counter to 0
    end else begin
      count <= count + 1; // Increment the counter on each clock edge
    end
  end

endmodule
