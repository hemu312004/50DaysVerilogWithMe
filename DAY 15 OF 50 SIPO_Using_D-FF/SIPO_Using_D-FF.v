module SIPO_Using_D_FF #(parameter DATA_WIDTH = 4) (
    input clk,
    input d,
    output reg [DATA_WIDTH-1:0] q
);

    always @(posedge clk) begin
        q <= {q[DATA_WIDTH-2:0], d};
    end

endmodule