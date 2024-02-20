// Gray Counter module
module Gray_Counter (
  input wire clk,
  input wire rst,
  output reg [3:0] gray_out
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      gray_out <= 4'b0000; // Reset to 0 when rst is asserted
    end else begin
      gray_out <= gray_out + 1; // Increment the Gray counter
    end
  end

endmodule
