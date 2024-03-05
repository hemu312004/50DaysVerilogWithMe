// Code your design here
module fibC (input clk, rst,
            output [3:0] out);
  
  // Registers to store the current and previous values of the fibonacci counter
  reg [3:0] RegA, RegB, RegC;
  
  always @ (posedge clk) begin
    if (rst) begin
      RegA <= 4'h1;	// Start RegA with the second value of fibonacci series - '1'
      RegB <= 4'h0;	// Start RegB with the first value of fibonacci series - '0'
      RegC <= 4'h0; // Reset RegC to '0'
    end
    else begin
      RegA <= RegB[3] ? 4'h1 : RegA + RegB; // if RegB == 8, reset RegA
      RegB <= RegB[3] ? 4'h0 : RegA;	// if RegB == 8, reset RegB
      RegC <= RegB;	// RegC is a synchronization register
    end
  end
  
  // Only one of the following two lines should be uncommented
  
  assign out = RegB;	// To ignore the '0' at the startup after reset, uncomment this line
  //assign out = RegC;	// To start with a '0' at startup after reset, uncomment this line
  
endmodule