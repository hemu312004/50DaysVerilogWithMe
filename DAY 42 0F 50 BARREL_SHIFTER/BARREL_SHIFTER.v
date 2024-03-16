`timescale 1ns / 1ps

module barrelshift(out, In, n, Lr);
output reg [7:0] out;     // Output bus width of 8 bits
input [7:0] In;            // Input bus width of 8 bits
input [2:0] n;             // Amount of shift (up to 7 positions)
input Lr;                  // Direction of shift (1 for left, 0 for right)

always @ *
begin 
    if (Lr)                 // If Lr is 1, perform left shift operation
        out = In << n;      // Left shift input by n positions
    else                    // If Lr is 0, perform right shift operation
        out = In >> n;      // Right shift input by n positions
end

endmodule
