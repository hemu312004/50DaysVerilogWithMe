module test_bench;

  reg [3:0] bcd_input;
  wire [7:0] binary_output;

  BCD_to_Binary uut (
    .bcd_input(bcd_input),
    .binary_output(binary_output)
  );

  initial begin
    // Test case 1: BCD input is 0000
    bcd_input = 4'b0000;
    #10; // Wait for 10 time units
    if (binary_output !== 8'b00000000) $display("Test case 1 failed");

    // Test case 2: BCD input is 0001
    bcd_input = 4'b0001;
    #10;
    if (binary_output !== 8'b00000001) $display("Test case 2 failed");

    // Test case 3: BCD input is 0010
    bcd_input = 4'b0010;
    #10;
    if (binary_output !== 8'b00000010) $display("Test case 3 failed");

    // Test case 4: BCD input is 0011
    bcd_input = 4'b0011;
    #10;
    if (binary_output !== 8'b00000011) $display("Test case 4 failed");

    // Test case 5: BCD input is 0100
    bcd_input = 4'b0100;
    #10;
    if (binary_output !== 8'b00000100) $display("Test case 5 failed");

    // Test case 6: BCD input is 0101
    bcd_input = 4'b0101;
    #10;
    if (binary_output !== 8'b00000101) $display("Test case 6 failed");

    // Add more test cases for 0110, 0111, 1000, 1001, 1010, 1011, 1100, 1101, 1110, 1111

    // Finish simulation
    $finish;
  end

endmodule
