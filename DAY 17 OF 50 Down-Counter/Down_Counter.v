module Down_Counter(input clk, reset, output [3:0] counter
    );
reg [3:0] counter_down;

// down counter
always @(posedge clk or posedge reset)   
begin
if(reset)      // If reset is active
      // Reset counter to 15 (4'b1111)
 counter_down <= 4'hf;
else
 counter_down <= counter_down - 4'd1;   // Decrement counter by 1
end 
assign counter = counter_down;    // Output assignment

endmodule