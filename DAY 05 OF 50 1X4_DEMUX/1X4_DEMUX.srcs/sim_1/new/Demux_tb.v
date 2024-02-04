module demux_4x1_tb;

  // Inputs
  reg [3:0] data_in;
  reg [1:0] sel;

  // Output
  wire data_out;

  // Instantiate the demux
  demux_4x1 uut (
    .data_in(data_in),
    .sel(sel),
    .data_out(data_out)
  );

  // Stimulus generation
  initial begin
    // Test case 1
    data_in = 4'b1010;
    sel = 2'b00;
    #10;

    // Test case 2
    data_in = 4'b1100;
    sel = 2'b01;
    #10;

    // Test case 3
    data_in = 4'b1111;
    sel = 2'b10;
    #10;

    // Test case 4
    data_in = 4'b0101;
    sel = 2'b11;
    #10;

    // Add more test cases as needed

    $finish;
  end

endmodule