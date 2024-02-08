module TB;

reg clk; // Clock signal
reg rst_n; // Reset signal (active low)
reg s, r; // Set and reset inputs
wire q; // Output representing the state of the flip-flop

// Instantiate flip-flop module
SR_Flip_Flop uut (
    .clk(clk), // Connect clock signal to flip-flop input
    .rst_n(rst_n), // Connect reset signal to flip-flop input
    .s(s), // Connect set input to flip-flop input
    .r(r), // Connect reset input to flip-flop input
    .q(q) // Connect flip-flop output to q
);

// Clock generation
always #5 clk = ~clk; // Generate clock signal with 10ns period (50% duty cycle)

// Testbench stimulus
initial begin
    // Initialize signals
    clk = 0;
    rst_n = 1;
    s = 0;
    r = 0;

    // Apply reset
    #10 rst_n = 0;

    // Toggle input s and observe output
    #10 s = 1;
    #10 s = 0;

    // Toggle input r and observe output
    #10 r = 1;
    #10 r = 0;

    // End simulation
    #10 $finish;
end

endmodule
