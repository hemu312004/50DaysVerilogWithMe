// Test bench module for SR Flip-Flop using JK Flip-Flop
module SR_FF_using_JK_FF_tb;

    reg J, K, clk, rst;      // Declare input signals
    wire Q;                  // Declare output signal

    // Instantiate SR-FF using JK-FF
    JK_FF uut (
        .J(J),
        .K(K),
        .clk(clk),
        .rst(rst),
        .Q(Q)
    );

    // Clock generation
    always #5 clk = ~clk;     // Toggle the clock every 5 time units

    // Test stimulus
    initial begin
        // Initialize inputs
        J = 0;
        K = 0;
        clk = 0;
        rst = 1;

        // Apply reset
        #10 rst = 0;           // Assert reset for 10 time units

        // Test case 1: Set the flip-flop
        #10 J = 1;             // Set J to 1
        #10 J = 0;             // Clear J to 0

        // Test case 2: Reset the flip-flop
        #10 K = 1;             // Set K to 1
        #10 K = 0;             // Clear K to 0

        // Test case 3: Toggle the flip-flop
        #10 J = 1;             // Set J to 1
        #10 K = 1;             // Set K to 1
        #10 J = 0;             // Clear J to 0
        #10 K = 0;             // Clear K to 0

        // End simulation
        #10 $finish;           // Finish the simulation after 10 time units
    end
endmodule