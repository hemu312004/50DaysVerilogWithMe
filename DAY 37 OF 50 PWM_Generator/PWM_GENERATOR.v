module PWM_generator (
    input [7:0] PWM_ontime,
    input clk, reset,
    output reg PWM_out
);

wire [7:0] counter_out;

always @(posedge clk or posedge reset) begin
    if (reset)
        PWM_out <= 0;
    else begin
        if (PWM_ontime > counter_out)
            PWM_out <= 1;
        else
            PWM_out <= 0;
    end
end

counter counter_inst (
    .clk(clk),
    .reset(reset),
    .counter_out(counter_out)
);

endmodule

module counter (
    input clk, reset,
    output reg [7:0] counter_out
);

always @(posedge clk or posedge reset) begin
    if (reset)
        counter_out <= 8'b0;
    else
        counter_out <= counter_out + 1;
end

endmodule
