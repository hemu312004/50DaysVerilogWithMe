`timescale 1ns / 1ps // Specify the timescale for the Verilog code

module d_flip_flop (Q, D, clk, reset); // Define a Verilog module named d_flip_flop with input and output ports
input D; // Input data signal
input clk; // Clock signal
input reset; // Reset signal
output reg Q; // Output register representing the flip-flop output

always @(posedge clk or posedge reset) // Always block sensitive to positive edge of clock or positive edge of reset
begin
    if (reset == 1'b1) // Check if reset signal is asserted (logic level 1)
        Q <= 1'b0; // If reset is active, set output Q to logic 0
    else // If reset is not active
        Q <= D; // Set output Q to input data signal D
end

endmodule // End of Verilog module definition
