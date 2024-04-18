module test;
    reg [31:0] A;
    reg [31:0] B;
    wire [31:0] Res;
    matrixx uut(
        .A(A), 
        .B(B), 
        .Res(Res)
    );
    initial begin
        A = 0;  B = 0;  #100;
        A = {8'd3,8'd1,8'd0,8'd1};
        B = {8'd1,8'd2,8'd9,8'd0};
    end  
endmodule