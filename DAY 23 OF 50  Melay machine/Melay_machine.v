module mealy1011(
    input rst,clk,din,
    output reg dout
    );
    
    reg [1:0] state;
    parameter s0=0,s1=1,s2=2,s3=3;
    always @(posedge clk) begin
    if(rst) begin
    dout=0;
    state=s0;
    end
    else
    case(state)
    s0: begin
    if(din)
    state=s1;
    else
    state=s0;
    dout=0;
    end
    s1: begin
        if(din)
        state=s1;
        else
        state=s2;
        dout=0;
        end
s2: begin
                if(din)
                state=s3;
                else
                state=s0;
                dout=0;
                end
s3: begin
        if(din) begin
        state=s0;
        dout=1;
        end
        else begin
        state=s2;
        dout=0;
        end
        end
    
    endcase
    end
    endmodule