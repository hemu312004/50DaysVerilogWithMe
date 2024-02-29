module test_bench;

  reg [3:0] bcd_input;
  wire [3:0] excess3_output;

  BCD_to_Excess3 uut (
    .bcd_input(bcd_input),
    .excess3_output(excess3_output)
  );

  initial begin
    // Test case 1: BCD input is 0
    bcd_input = 4'b0000;
    #10; // Wait for 10 time units
    if (excess3_output !== 4'b0011) $display("Test case 1 failed");

    // Test case 2: BCD input is 1
    bcd_input = 4'b0001;
    #10;
    if (excess3_output !== 4'b0100) $display("Test case 2 failed");

    // Test case 3: BCD input is 2
    bcd_input = 4'b0010;
    #10;
    if (excess3_output !== 4'b0101) $display("Test case 3 failed");
    
     bcd_input = 4'b0011;
       #10; // Wait for 10 time units
       if (excess3_output !== 4'b0110) $display("Test case 1 failed");
       
        bcd_input = 4'b0101;
          #10; // Wait for 10 time units
          if (excess3_output !== 4'b0111) $display("Test case 1 failed");
          

    // Add more test cases for BCD values 3 to 9

    // Finish simulation
    $finish;
  end

endmodule
