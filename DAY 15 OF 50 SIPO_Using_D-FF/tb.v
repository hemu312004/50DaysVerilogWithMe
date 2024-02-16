module SIPO_Using_D_FF_tb #(parameter DATA_WIDTH = 4) ();

    reg clk;
    reg d;
    wire [DATA_WIDTH-1:0] q;

    SIPO_Using_D_FF #(DATA_WIDTH) inst (clk, d, q);

    initial begin
        clk <= 1'b0;
        forever #5 clk <= ~clk;
    end

    initial begin
        d <= 1'b0;
        #10 d <= 1'b1;
        #10 d <= 1'b0;
        #10 d <= 1'b1;
        #40 $finish;
    end

    initial begin
        $monitor($time, "clk=%b, d=%b, q=%b", clk, d, q);
    end

endmodule