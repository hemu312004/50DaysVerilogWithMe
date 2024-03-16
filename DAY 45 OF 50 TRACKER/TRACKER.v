// Module Declaration
module TRACKER (clk, rst, in, gpssignalout);
  input clk, rst;                   // Clock and reset input
  input [1:0] in;                   // 2-bit input
  output reg gpssignalout;          // Output GPS signal

// Parameter Declaration
  parameter beaconstate = 1'b0;      // Parameter for the state 'beconstate'
  parameter gpsstate = 1'b1;        // Parameter for the state 'gpsstate'

// Sequential Logic
  reg [1:0] cst, nst;               // Registers for current and next states

  always @(posedge clk) begin       // Always block triggered on positive clock edge
    if (rst) begin                  // Reset condition
      gpssignalout <= 1'b0;         // Set GPS signal to 0 on reset
      cst <= beaconstate;            // Set current state to 'beconstate'
      nst <= beaconstate;            // Set next state to 'beconstate' on reset
    end else begin
      cst <= nst;                   // Update current state to next state
      case (cst)                    // Case statement based on current state
        beaconstate: if (in == 2'b00) begin  // If current state is 'beconstate'
          nst <= beaconstate;                // Stay in 'beconstate' state
          gpssignalout <= 1'b0;             // Set GPS signal to 0
        end else if (in == 2'b01) begin     // If input is '01'
          nst <= gpsstate;                  // Move to 'gpsstate'
        end
        gpsstate: if (in == 2'b11) begin    // If current state is 'gpsstate'
          nst <= gpsstate;                  // Stay in 'gpsstate'
          gpssignalout <= 1'b1;             // Set GPS signal to 1
        end else if (in == 2'b01) begin     // If input is '01'
          nst <= beaconstate;                // Move back to 'beconstate'
        end
      endcase                            // End of case statement
    end                                 // End of else block
  end                                   // End of always block
endmodule                              // End of module
