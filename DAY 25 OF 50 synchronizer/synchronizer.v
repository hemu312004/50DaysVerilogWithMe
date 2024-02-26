module synchronizer #(parameter SYNC_STAGES = 2)(
    input async_in,
    input clk,
    output reg sync_out,
    output reg rise_edge_tick,
    output reg fall_edge_tick
);

//CONSTANT DECLARATIONS 

    /* General shortcuts */
        localparam T = 1'b1;
        localparam F = 1'b0;
        
//** BODY
    reg [SYNC_STAGES-1:0] sync_regs = {SYNC_STAGES{1'b0}};  // init with zeros

    always @(posedge clk) begin
        sync_regs <= {sync_regs[SYNC_STAGES-2:0], async_in};    // shift left
        sync_out <= sync_regs[SYNC_STAGES-1];

        rise_edge_tick <= (sync_out != sync_regs[SYNC_STAGES-1]) & (sync_regs[SYNC_STAGES - 1] == T) ? T : F; 
        fall_edge_tick <= (sync_out != sync_regs[SYNC_STAGES-1]) & (sync_regs[SYNC_STAGES - 1] == F) ? T : F; 
  
    end
endmodule