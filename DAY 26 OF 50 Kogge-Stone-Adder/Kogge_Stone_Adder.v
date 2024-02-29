module Kogge_Stone_Adder(input [3:0]a,
input [3:0]b,
input cin,
output [3:0]sum,

output carryout
    );
      // Declare internal wires for intermediate signals

    
wire [3:0] p,g,cp,cg,ccg,ccp,c;  
/* p: Propagate signal
   g: Generate signal
    cp: Carry Propagate
    cg: Carry Generate
    ccg: Cascade Carry Generate
    ccp: Cascade Carry Propagate
    c: Final Carry*/

  // Compute propagate (p) and generate (g) signals

 assign p = a ^ b;  // XOR of input bits
  assign g = a & b;  // AND of input bits
  
    // Compute carry propagate (cp) signals
      // Compute carry generate (cg) signals

assign cg[0]=(g[0]);
assign cp[0]=(p[0]);

assign cg[1]=(p[1]&g[0])|g[1];
assign cp[1]=(p[1]&p[0]);

assign cg[2]=(p[2]&g[1])|g[2];
assign cp[2]=p[2]&p[1];

assign cg[3]=(p[3]&g[2])|g[3];
assign cp[3]=p[3]&p[2];
  // Compute complemented carry propagate (ccp) signals
  // Compute complemented carry generate (ccg) signals

assign ccg[0]=cg[0];
assign ccp[0]=cp[0];

assign ccg[1]=cg[1];
assign ccp[1]=cp[1];

assign ccg[2]=(cp[2]&cg[0])|cg[2];
assign ccp[2]=cp[2]&cp[0];

assign ccg[3]=(cp[3]&cg[1])|cg[3];
assign ccp[3]=cp[3]&cp[1];
  // Compute final carry (c) signal
assign c=ccg;
  // Compute sum output

assign sum[0]=p[0]^cin;
assign sum[1]=p[1]^c[0];
assign sum[2]=p[2]^c[1];
assign sum[3]=p[3]^c[2];
  // Output carryout

assign carryout=c[3];


endmodule