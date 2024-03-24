// Define timescale for simulation
`timescale 1ns / 1ps

// Module definition
module Vending_Machine(clk, rst, coin_in, product_out);

    // Input and output ports
    input clk;
    input rst;
    input [1:0] coin_in;
    output product_out;

    // Define parameters for states and coin values
    parameter idle = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;
    parameter s3 = 2'b11;

    parameter rupee_0 = 2'b00;
    parameter rupee_1 = 2'b01;
    parameter rupee_2 = 2'b10;

    // Define state and next state registers
    reg [1:0] present_state, next_state;

    // Sequential logic for state transition
    always @(posedge clk) begin
        if (rst)
            present_state = idle; // Initialize to idle state on reset
        else
            present_state = next_state; // Update state based on next_state
    end

    // Combinational logic for state transition based on input and current state
    always @(coin_in, present_state) begin
        next_state = idle; // Default next_state is idle
        case (present_state)
            idle:
                if (coin_in == rupee_0)
                    next_state = idle; // Stay in idle state if no coin is inserted
                else if (coin_in == rupee_1)
                    next_state = s1; // Move to state s1 if a rupee_1 coin is inserted
                else if (coin_in == rupee_2)
                    next_state = s2; // Move to state s2 if a rupee_2 coin is inserted
            s1:
                if (coin_in == rupee_0)
                    next_state = s1; // Stay in s1 state if no coin is inserted
                else if (coin_in == rupee_1)
                    next_state = s2; // Move to state s2 if a rupee_1 coin is inserted
                else if (coin_in == rupee_2)
                    next_state = s3; // Move to state s3 if a rupee_2 coin is inserted
            s2:
                if (coin_in == rupee_0)
                    next_state = s2; // Stay in s2 state if no coin is inserted
                else if (coin_in == rupee_1 || coin_in == rupee_2)
                    next_state = s3; // Move to state s3 if a rupee_1 or rupee_2 coin is inserted
            s3:
                next_state = idle; // Return to idle state after product is dispensed
            default:
                next_state = idle; // Default to idle state
        endcase
    end

    // Assign output based on current state (product_out is true in s3 state)
    assign product_out = (present_state == s3);

endmodule
