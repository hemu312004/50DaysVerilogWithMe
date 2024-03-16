`timescale 1ns / 1ps

module parking_system(
    input clock_in, rst_in,
    input Front_Sensor, Back_Sensor,
    input [1:0] pass_1, pass_2,
    output wire G_LED, R_LED,
    output reg [6:0] HEX_1, HEX_2
);

// Define states of the FSM
parameter IDLE = 3'b000, WAIT_PASSWORD = 3'b001, WRONG_PASS = 3'b010, RIGHT_PASS = 3'b011, STOP = 3'b100;

// Present state and next state registers
reg [2:0] PS, NS;

// Waiting counter
reg [31:0] cnt_wait;

// Temporary variables for LED blinking
reg red_tmp, green_tmp;

// State transition logic
always @(posedge clock_in or negedge rst_in)
begin
    if (~rst_in)
        PS = IDLE; // Reset state to IDLE on reset
    else
        PS = NS; // Update state based on the next state
end

// Counter for waiting state
always @(posedge clock_in or negedge rst_in)
begin
    if (~rst_in)
        cnt_wait <= 0; // Reset counter on reset
    else if (PS == WAIT_PASSWORD)
        cnt_wait <= cnt_wait + 1; // Increment counter in WAIT_PASSWORD state
    else
        cnt_wait <= 0;
end

// State transition conditions
always @(*)
begin
    case (PS)
        IDLE:
            begin
                if (Front_Sensor == 1)
                    NS = WAIT_PASSWORD; // Transition to WAIT_PASSWORD state if Front_Sensor is activated
                else
                    NS = IDLE;
            end

        WAIT_PASSWORD:
            begin
                if (cnt_wait <= 3)
                    NS = WAIT_PASSWORD; // Stay in WAIT_PASSWORD state if waiting time is not exceeded
                else
                begin
                    if ((pass_1 == 2'b01) && (pass_2 == 2'b10))
                        NS = RIGHT_PASS; // Transition to RIGHT_PASS state if password is correct
                    else
                        NS = WRONG_PASS; // Transition to WRONG_PASS state otherwise
                end
            end

        WRONG_PASS:
            begin
                if ((pass_1 == 2'b01) && (pass_2 == 2'b10))
                    NS = RIGHT_PASS; // Transition to RIGHT_PASS state if password is correct
                else
                    NS = WRONG_PASS;
            end

        RIGHT_PASS:
            begin
                if (Front_Sensor == 1 && Back_Sensor == 1)
                    NS = STOP; // Transition to STOP state if both sensors are activated
                else if (Back_Sensor == 1)
                    NS = IDLE; // Transition to IDLE state if only Back_Sensor is activated
                else
                    NS = RIGHT_PASS;
            end

        STOP:
            begin
                if ((pass_1 == 2'b01) && (pass_2 == 2'b10))
                    NS = RIGHT_PASS; // Transition to RIGHT_PASS state if password is correct
                else
                    NS = STOP;
            end

        default:
            NS = IDLE; // Default state transition to IDLE
    endcase
end

// Output logic and LED blinking
always @(posedge clock_in)
begin
    case (PS)
        IDLE:
            begin
                green_tmp = 1'b0;
                red_tmp = 1'b0;
                HEX_1 = 7'b1111111; // Turn off HEX_1
                HEX_2 = 7'b1111111; // Turn off HEX_2
            end

        WAIT_PASSWORD:
            begin
                green_tmp = 1'b0;
                red_tmp = 1'b1;
                HEX_1 = 7'b000_0110; // Display 'E' on HEX_1
                HEX_2 = 7'b010_1011; // Display 'n' on HEX_2
            end

        WRONG_PASS:
            begin
                green_tmp = 1'b0;
                red_tmp = ~red_tmp; // Toggle red_tmp for blinking
                HEX_1 = 7'b000_0110; // Display 'E' on HEX_1
                HEX_2 = 7'b000_0110; // Display 'E' on HEX_2
            end

        RIGHT_PASS:
            begin
                green_tmp = ~green_tmp; // Toggle green_tmp for blinking
                red_tmp = 1'b0;
                HEX_1 = 7'b000_0010; // Display '6' on HEX_1
                HEX_2 = 7'b100_0000; // Display '0' on HEX_2
            end

        STOP:
            begin
                green_tmp = 1'b0;
                red_tmp = ~red_tmp; // Toggle red_tmp for blinking
                HEX_1 = 7'b001_0010; // Display '5' on HEX_1
                HEX_2 = 7'b000_1100; // Display 'P' on HEX_2
            end
    endcase
end

// Assignments for LED outputs
assign R_LED = red_tmp;
assign G_LED = green_tmp;

endmodule
