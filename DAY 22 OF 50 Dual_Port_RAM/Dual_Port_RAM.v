`timescale 1ns / 1ps

module dual_port_ram (
    input clock,
    input write_enable_A,
    input write_enable_B,
    input [7:0] data_in_A,
    input [7:0] data_in_B,
    input [7:0] address_A,
    input [7:0] address_B,
    output [7:0] data_out_A,
    output [7:0] data_out_B
);

// Declare an 8-bit wide memory array with 16 locations
reg [7:0] mem [15:0];

// Always block triggered on the positive edge of the clock
always @(posedge clock) begin
    // If write_enable_A is asserted, write data_in_A to the specified address
    if (write_enable_A) begin
        mem[address_A] <= data_in_A;
    end

    // If write_enable_B is asserted, write data_in_B to the specified address
    if (write_enable_B) begin
        mem[address_B] <= data_in_B;
    end
end

// Assign the output data for port A and port B from the specified addresses
assign data_out_A = mem[address_A];
assign data_out_B = mem[address_B];

endmodule
