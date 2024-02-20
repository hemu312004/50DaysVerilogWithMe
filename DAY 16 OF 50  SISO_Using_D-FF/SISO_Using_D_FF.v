module siso ( din ,clk ,reset ,dout );

output dout ;

input din ;
input clk ;
input reset ;   
wire [2:0]s;

d_flip_flop u0 (.din(din),
.clk(clk),
.reset(reset),
.dout(s[0]));


d_flip_flop u1 (.din(s[0]),
.clk(clk),
.reset(reset),
.dout(s[1]));


d_flip_flop u2 (.din(s[1]),
.clk(clk),
.reset(reset),
.dout(s[2]));


d_flip_flop u3 (.din(s[2]),
.clk(clk),
.reset(reset),
.dout(dout));


endmodule

module d_flip_flop ( din ,clk ,reset ,dout );

output dout ;
reg dout;

input din ;
input clk ;
input reset ; 

always @ (posedge clk)
begin
 if (reset)
  dout <= 1;
 else
  dout <= din;
end

endmodule