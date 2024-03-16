module squarer_tb;
  reg a0, a1, a2;                // Define input registers a0, a1, a2
  wire y5, y4, y3, y2, y1, y0;   // Define output wires y5, y4, y3, y2, y1, y0
  
  // Instantiate the squarer module
  squarer uut(
    .a0(a0),                     // Connect a0 input to squarer module
    .a1(a1),                     // Connect a1 input to squarer module
    .a2(a2),                     // Connect a2 input to squarer module
    .y5(y5),                     // Connect y5 output from squarer module
    .y4(y4),                     // Connect y4 output from squarer module
    .y3(y3),                     // Connect y3 output from squarer module
    .y2(y2),                     // Connect y2 output from squarer module
    .y1(y1),                     // Connect y1 output from squarer module
    .y0(y0));                    // Connect y0 output from squarer module
    
  initial begin
    // Test case 1: a0 = 0, a1 = 0, a2 = 0
    a0 = 0; a1 = 0; a2 = 0; #10; // Set inputs and wait for 10 time units
    
    // Test case 2: a0 = 0, a1 = 0, a2 = 1
    a0 = 0; a1 = 0; a2 = 1; #10; // Set inputs and wait for 10 time units
    
    // Test case 3: a0 = 0, a1 = 1, a2 = 0
    a0 = 0; a1 = 1; a2 = 0; #10; // Set inputs and wait for 10 time units
    
    // Test case 4: a0 = 0, a1 = 1, a2 = 1
    a0 = 0; a1 = 1; a2 = 1; #10; // Set inputs and wait for 10 time units
    
    // Test case 5: a0 = 1, a1 = 0, a2 = 0
    a0 = 1; a1 = 0; a2 = 0; #10; // Set inputs and wait for 10 time units
    
    // Test case 6: a0 = 1, a1 = 0, a2 = 1
    a0 = 1; a1 = 0; a2 = 1; #10; // Set inputs and wait for 10 time units
    
    // Test case 7: a0 = 1, a1 = 1, a2 = 0
    a0 = 1; a1 = 1; a2 = 0; #10; // Set inputs and wait for 10 time units
    
    // Test case 8: a0 = 1, a1 = 1, a2 = 1
    a0 = 1; a1 = 1; a2 = 1; #10; // Set inputs and wait for 10 time units
    
    // Finish simulation after all test cases are executed
    $finish;
  end
endmodule
