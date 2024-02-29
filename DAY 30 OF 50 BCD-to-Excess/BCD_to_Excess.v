module BCD_to_Excess3 (
  input [3:0] bcd_input,
  output reg [3:0] excess3_output
);

  always @* begin
    case(bcd_input)
      4'b0000: excess3_output = 4'b0011;
      4'b0001: excess3_output = 4'b0100;
      4'b0010: excess3_output = 4'b0101;
      4'b0011: excess3_output = 4'b0110;
      4'b0100: excess3_output = 4'b0111;
      4'b0101: excess3_output = 4'b1000;
      4'b0110: excess3_output = 4'b1001;
      4'b0111: excess3_output = 4'b1010;
      4'b1000: excess3_output = 4'b1011;
      4'b1001: excess3_output = 4'b1100;
      default: excess3_output = 4'b0000; // default case
    endcase
  end

endmodule
