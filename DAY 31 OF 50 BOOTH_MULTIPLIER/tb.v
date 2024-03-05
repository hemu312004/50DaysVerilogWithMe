module tb_Booth_Multiplier;
  wire [7:0] Y;      // Output wire for the product Y.
  reg [3:0] A, B;    // Input registers for the multiplicands A and B.
  
  Booth_Multiplier dut(Y, A, B);  // Instantiate the Booth_Multiplier module and connect inputs/outputs.

  initial
  begin
    $display("RSLT\tA x B = Y");  // Display header for the test results.

    // Test case 1
    A = 2; B = 2; #10;            // Set input values, wait for 10 time units.
    if (Y == 4)                    // Check if the output Y matches the expected result.
      $display("PASS\t%p x %p = %p", A, B, Y);  // Display pass result.
    else
      $display("FAIL\t%p x %p = %p", A, B, Y);  // Display fail result.

    // Similar test cases for other scenarios.
    
    // Test case 2
    A = 3; B = 4; #10;
    if (Y == 12)
      $display("PASS\t%p x %p = %p", A, B, Y);
    else
      $display("FAIL\t%p x %p = %p", A, B, Y);
    
    // Test case 3
    A = 3; B = -4; #10;
    if (Y == -12)
      $display("PASS\t%p x %p = %p", A, B, Y);
    else
      $display("FAIL\t%p x %p = %p", A, B, Y);
    
    // Test case 4
    A = 0; B = 0; #10;
    if (Y == 0)
      $display("PASS\t%p x %p = %p", A, B, Y);
    else
      $display("FAIL\t%p x %p = %p", A, B, Y);
    
    // Test case 5
    A = 15; B = 15; #10;
    if (Y == 225)
      $display("PASS\t%p x %p = %p", A, B, Y);
    else
      $display("FAIL\t%p x %p = %p", A, B, Y);
    
  end
  
endmodule
