//half adder using Verilog Operator
module half_adder_o (
    input a,b,
    output sum,carry
);

assign {carry,sum} = a+b;

endmodule