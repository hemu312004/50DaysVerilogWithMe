`timescale 1ns/1ns

module PWM_generator_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg clk;
    reg reset;
    reg [7:0] PWM_ontime;
    wire PWM_out;

    // Instantiate the DUT
    PWM_generator DUT (
        .PWM_ontime(PWM_ontime),
        .clk(clk),
        .reset(reset),
        .PWM_out(PWM_out)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Stimulus
    initial begin
        clk = 0;
        reset = 1;
        PWM_ontime = 8'b0000_0000; // Initially set PWM on-time to 0
        #20; // Wait for a few clock cycles
        reset = 0; // De-assert reset
        #100; // Simulate for some time

        // Test case: PWM on-time greater than counter output
        PWM_ontime = 8'b1111_1111; // Set PWM on-time to maximum
        #100; // Simulate for some time

        // Test case: PWM on-time less than counter output
        PWM_ontime = 8'b0000_1111; // Set PWM on-time to a value less than maximum
        #100; // Simulate for some time

        // Add more test cases as needed

        $stop; // End simulation
    end

endmodule
