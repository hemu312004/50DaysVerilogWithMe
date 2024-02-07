module decade_counter(
    input en, // Enable signal to control counting operation
    input clock, // Clock signal to synchronize counting
    output reg [3:0] count // Output count representing decade values
);

always @(posedge clock) // Always block triggered by positive edge of the clock signal
begin
    if(en) // If the enable signal is active
    begin
        if (count >= 4'd0 && count < 4'd10) // If count is within the range of 0 to 9
            count <= count + 4'd1; // Increment count by 1
        else // If count exceeds 9 or is less than 0
            count <= 4'd0; // Reset count to 0
    end
    else // If the enable signal is inactive
        count <= 4'd0; // Reset count to 0
end

endmodule
