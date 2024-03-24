module tb;

  reg clok, wri, rd;
  reg [7:0] data_in;
  reg [2:0] add;
  wire [7:0] data_out;

  SRAM uut (clok, wri, rd, add, data_out, data_in);

  initial begin
    clok = 0;
    forever #5 clok = ~clok;
  end

  initial begin
    rd = 0;
    wri= 0;
    data_in = 8'b11010010;
    add = 3'b011;

    wri = 1'b1;
    #10;

    wri = 1'b0;
    add = 3'b000;
    rd = 1'b1;
    #10;

    add = 3'b011;
    rd = 1'b1;
    #10;

    $finish;
  end

endmodule