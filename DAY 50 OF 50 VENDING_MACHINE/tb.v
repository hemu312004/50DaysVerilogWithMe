// Define timescale for simulation
`timescale 1ns / 1ps




// Module definition for testbench
module tb_Vending_Machine();
    reg clk, rst; // Define clock and reset as registers
    reg [1:0] coin_in; // Define coin_in as a 2-bit register
    wire product_out; // Define product_out as a wire

    // Instantiate Vending_Machine module
    Vending_Machine dut(clk, rst, coin_in, product_out);

    // Task to initialize input signals
    task initialize();
    begin
        clk = 1'b0; // Initialize clk to 0
        rst = 1'b0; // Initialize rst to 0
        coin_in = 2'b0; // Initialize coin_in to 00
    end
    endtask

    // Toggle clock every 10 time units
    always #10 clk = ~clk;

    // Task to generate reset signal
    task reset();
    begin
        @(negedge clk) // Wait for falling edge of clock
            rst = 1'b1; // Set reset to 1
        @(negedge clk) // Wait for next falling edge of clock
            rst = 1'b0; // Clear reset to 0
    end
    endtask

    // Task to apply stimulus to coin_in input
    task stimulus(input [1:0] i);
    begin
        @(negedge clk) // Wait for falling edge of clock
        coin_in = i; // Apply input i to coin_in
    end
    endtask

    // Initial block to start simulation
    initial
    begin
        initialize(); // Call initialize task to set initial values
        #10 // Wait for 10 time units
        reset(); // Call reset task to perform reset sequence
        #10 // Wait for 10 time units
        stimulus(2'b01); // Apply input 01 to coin_in
        #10 // Wait for 10 time units
        stimulus(2'b10); // Apply input 10 to coin_in
        #10 // Wait for 10 time units
        stimulus(2'b11); // Apply input 11 to coin_in
    end
endmodule
