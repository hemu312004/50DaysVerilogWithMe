module SRAM (clok, wri, rd, add, data_out, data_in);

  input clok, wri, rd;
  input [7:0] data_in;
  input [2:0] add;
  output [7:0] data_out;

 // Define an 8x8 memory array
  // Here, each element represents an 8-bit data word
  //The exact size of the memory is defined by the width name depth
  reg [7:0] ram [0:7];
// Assign data_out based on read control (rd) and address (add)
    // If rd is high, data_out will be the content of the memory at the given address
    // If rd is low, data_out will be high impedance (disconnected)
  assign data_out = rd ? ram[add] : 8'bZ;

  always @ (posedge clok) begin
    if (wri) begin
          // Write data_in into the memory at the specified address

      ram[add] <= data_in;
    end
  end

endmodule