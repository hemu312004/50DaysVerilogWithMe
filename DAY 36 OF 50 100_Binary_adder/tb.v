// Testbench for binary_adder module

// Declare the testbench module
module binary_adder_tb();

    // Declare input and output variables
    reg [99:0] a, b;      // 100-bit input vectors a and b
    reg cin;              // Input carry-in bit
    wire [99:0] sum;      // 100-bit output vector sum
    reg i;                // Loop variable for random test generation

    // Instantiate the binary_adder module (unit under test - UUT)
    binary_adder dut(a, b, cin, sum);

    // Initial block for test setup
    initial
    begin
        {a, b, cin} = 0;   // Initialize inputs to zero
        #10;               // Wait for 10 time units

        // Generate random test vectors for a and b
        for (i = 0; i < 8; i = i + 1)
        begin
            {a} = {$random} % 5000;  // Assign random value to a (limited to 5000)
            {b} = {$random} % 5000;  // Assign random value to b (limited to 5000)
            #10;                      // Wait for 10 time units
        end
    end

    // Initial block for displaying monitor messages
    initial
        $monitor("input A=%d B=%d C=%d Sum=%d", a, b, cin, sum);

    // Stop simulation after 100 time units
    initial #100 $finish();

endmodule
