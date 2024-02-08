module tb_T_Flip_Flop;

reg clk; // Clock signal
reg rstn; // Reset signal (active low)
reg t; // Toggle signal
wire q; // Output of T flip-flop

// Instantiate T flip-flop module
T_Flip_Flop uut (
    .clk(clk), // Connect clock signal to T flip-flop input
    .rstn(rstn), // Connect reset signal to T flip-flop input
    .t(t), // Connect toggle signal to T flip-flop input
    .q(q) // Connect T flip-flop output to q
);

// Clock generation
always #5 clk = ~clk; // Generate clock signal with 10ns period (50% duty cycle)

// Testbench stimulus
initial begin
    // Initialize signals
    clk = 0;
    rstn = 0;
    t = 0;

    // Apply reset
    #10 rstn = 1;

    // Toggle input and observe output
    #10 t = 1;
    #10 t = 0;
    #10 t = 1;
    #10 t = 0;

    // Apply reset again
    #10 rstn = 0;

    // Toggle input and observe output
    #10 t = 1;
    #10 t = 0;
    #10 t = 1;
    #10 t = 0;

    // End simulation
    #10 $finish;
end

endmodule
