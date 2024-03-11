// one_bit_FA Module: One-Bit Full Adder
module one_bit_FA(
    input a, b,         // Input bits to be added
    input cin,          // Input carry-in bit
    output cout, sum    // Output carry-out bit and sum bit
);
    // Calculate sum bit using XOR operation
    assign sum = a ^ b ^ cin;
    // Calculate carry-out bit using OR of bitwise AND operations
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule

// binary_adder Module: 100-Bit Binary Adder
module binary_adder(
    input [99:0] a,     // 100-bit input vector a
    input [99:0] b,     // 100-bit input vector b
    input cin,          // Input carry-in bit
    output [99:0] sum   // 100-bit output vector sum
);
    wire [99:0] c_out;   // Internal wire to store carry-out bits
    genvar i;            // Generate variable for loop indexing

    // Instantiate the first one-bit full adder (LSB)
    one_bit_FA FA1(a[0], b[0], cin, c_out[0], sum[0]);

    // Generate loop to instantiate remaining full adders
    generate
        for (i = 1; i < 100; i = i + 1)
            begin : Full_adder_block
                // Instantiate one-bit full adder for each bit position
                one_bit_FA FA(a[i], b[i], c_out[i-1], c_out[i], sum[i]);
            end
    endgenerate
endmodule
