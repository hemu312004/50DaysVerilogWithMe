module T_Flip_Flop(
    input clk, // Clock input
    input rstn, // Active-low asynchronous reset input
    input t, // Toggle input
    output reg q // Output representing the state of the T flip-flop
);

// T flip-flop process
always @(posedge clk or negedge rstn) // Sensitivity list includes positive edge of clock and negative edge of reset
begin
    if (!rstn) // If reset is asserted (active low)
        q <= 1'b0; // Set output q to logic 0
    else // If reset is not asserted
    begin
        if (t) // If toggle input is asserted
            q <= ~q; // Toggle output q (invert its value)
        // No need for an else statement here, as q should remain unchanged if t is not asserted
    end
end

endmodule
