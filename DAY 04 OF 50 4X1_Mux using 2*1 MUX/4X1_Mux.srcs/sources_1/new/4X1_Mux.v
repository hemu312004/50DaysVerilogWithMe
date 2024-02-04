

module mux4to1 (
    input wire [3:0] data,
    input wire [1:0] sel,
    output wire out
);
    wire [1:0] sel_2to1;
    wire w1, w2;

    assign sel_2to1[0] = sel[0];
    assign sel_2to1[1] = sel[1];

    mux2to1 m1 (data[0], data[1], sel_2to1[0], w1);
    mux2to1 m2 (data[2], data[3], sel_2to1[0], w2);
    
    mux2to1 m3 (w1, w2, sel_2to1[1], out);
endmodule

module mux2to1 (
    input wire a,
    input wire b,
    input wire sel,
    output wire out
);
    assign out = (sel == 1'b0) ? a : b;
endmodule


