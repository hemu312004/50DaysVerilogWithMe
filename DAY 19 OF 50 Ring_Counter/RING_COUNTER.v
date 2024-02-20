
module RING_COUNTER(input clk,rst,output reg [3:0]q);

always@(posedge clk)
    begin
        if(rst)
        q<=4'd1;
        else
            begin
             case(q)
                4'd1:q=4'd2;
                4'd2:q=4'd4;
                4'd4:q=4'd8;
                4'd8:q=4'd1;
                default:q=4'd1;
                endcase
                
            end
        
    end

endmodule