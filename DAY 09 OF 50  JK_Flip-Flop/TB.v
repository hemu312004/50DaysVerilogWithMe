module tb_JK_flipflop;

reg clk; // Clock signal
reg rst_n; // Reset signal (active low)
reg j, k; // JK inputs
wire q, q_bar; // Output and complementary output of JK flip-flop

// Instantiate JK flip-flop module
JK_flipflop uut (
    .clk(clk), // Connect clock signal to JK flip-flop input
    .rst_n(rst_n), // Connect reset signal to JK flip-flop input
    .j(j), // Connect JK input j to JK flip-flop input
    .k(k), // Connect JK input k to JK flip-flop input
    .q(q), // Connect JK flip-flop output to q
    .q_bar(q_bar) // Connect complementary output to q_bar
);

// Clock generation
always #5 clk = ~clk; // Generate clock signal with 10ns period (50% duty cycle)

// Testbench stimulus
initial begin
    // Initialize signals
    clk = 0;
    rst_n = 1;
    j = 0;
    k = 0;

    // Apply reset
    #10 rst_n = 0;

    // Toggle input j and observe output
    #10 j = 1;
    #10 j = 0;

    // Toggle input k and observe output
    #10 k = 1;
    #10 k = 0;

    // End simulation
    #10 $finish;
end

endmodule
