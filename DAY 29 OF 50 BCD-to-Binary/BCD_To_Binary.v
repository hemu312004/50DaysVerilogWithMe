module BCD_to_Binary (
  input [3:0] bcd_input,
  output reg [7:0] binary_output
);

  always @* begin
    case(bcd_input)
      4'b0000: binary_output = 8'b00000000;
      4'b0001: binary_output = 8'b00000001;
      4'b0010: binary_output = 8'b00000010;
      4'b0011: binary_output = 8'b00000011;
      4'b0100: binary_output = 8'b00000100;
      4'b0101: binary_output = 8'b00000101;
      4'b0110: binary_output = 8'b00000110;
      4'b0111: binary_output = 8'b00000111;
      4'b1000: binary_output = 8'b00001000;
      4'b1001: binary_output = 8'b00001001;
      // Add more cases for BCD values 1010 to 1111 if needed
      default: binary_output = 8'b00000000; // default case
    endcase
  end

endmodule
