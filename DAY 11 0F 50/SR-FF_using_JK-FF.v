// Define a module for a JK Flip-Flop
module JK_FF (input J, input K, input clk, input rst, output reg Q);

    // Sequential logic for JK Flip-Flop
    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 1'b0;       // Reset: Q is set to 0 when the reset signal is asserted
        else if (J && ~K)
            Q <= 1'b1;       // Set: Q is set to 1 when J is 1 and K is 0
        else if (~J && K)
            Q <= 1'b0;       // Reset: Q is set to 0 when J is 0 and K is 1
        else if (J && K)
            Q <= ~Q;         // Toggle: Q toggles when both J and K are 1
    end

endmodule