module testbench;
    reg [3:0] data;
    reg [1:0] sel;
    wire out;

    mux4to1 uut (
        .data(data),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test Case 1
        data = 4'b0000;
        sel = 2'b00;
        #10 $display("Output: %b", out); // Expected output: 0

        // Test Case 2
        data = 4'b1010;
        sel = 2'b01;
        #10 $display("Output: %b", out); // Expected output: 1

        // Test Case 3
        data = 4'b1100;
        sel = 2'b10;
        #10 $display("Output: %b", out); // Expected output: 1

        // Test Case 4
        data = 4'b1111;
        sel = 2'b11;
        #10 $display("Output: %b", out); // Expected output: 1

        $stop;
    end
endmodule