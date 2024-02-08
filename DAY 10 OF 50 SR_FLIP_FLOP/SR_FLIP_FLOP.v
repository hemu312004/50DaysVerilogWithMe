module SR_Flip_Flop (
    input clk, // Clock input
    input rst_n, // Active-low asynchronous reset input
    input s, r, // Set and reset inputs
    output reg q // Output representing the state of the flip-flop
);

reg q_bar; // Complementary output of q

// SR flip-flop process
always @(posedge clk or negedge rst_n) // Sensitivity list includes positive edge of clock and negative edge of reset
begin
    if (!rst_n) // If reset is asserted
    begin
        q <= 1'b0; // Set output q to logic 0
        q_bar <= 1'b1; // Set complementary output q_bar to logic 1
    end
    else // If reset is not asserted
    begin
        if (s && !r) // If set input is asserted and reset input is not asserted
        begin
            q <= 1'b1; // Set output q to logic 1
            q_bar <= 1'b0; // Set complementary output q_bar to logic 0
        end
        else if (!s && r) // If reset input is asserted and set input is not asserted
        begin
            q <= 1'b0; // Set output q to logic 0
            q_bar <= 1'b1; // Set complementary output q_bar to logic 1
        end
        else if (!s && !r) // If neither set nor reset input is asserted
        begin
            q <= q; // No change in output q
            q_bar <= q_bar; // No change in complementary output q_bar
        end
        // No need for an else statement here, as the other combinations of inputs are not valid for SR flip-flops
    end
end

endmodule
