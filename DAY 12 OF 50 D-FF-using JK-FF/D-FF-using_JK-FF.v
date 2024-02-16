// D Flip-Flop using JK Flip-Flops

module d_ff_using_jk (
    input wire clk,    // Clock input
    input wire rst,    // Reset input
    input wire d,      // Data input
    output reg q       // Output
);

  reg j, k;

  // JK Flip-Flop logic
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      j <= 0;
      k <= 0;
    end else begin
      j <= d;
      k <= ~d;
    end
  end

  // D Flip-Flop logic
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      q <= 0;
    end else begin
      if (j & ~k) begin
        q <= 1;
      end else if (~j & k) begin
        q <= 0;
      end
    end
  end

endmodule
