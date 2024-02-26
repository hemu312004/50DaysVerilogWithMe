module mealy1011_test(   );
    
    reg rst,clk,din;
     wire dout;
      mealy1011 DUT(rst,clk,din,dout);
      initial begin
      clk=0;din=0;
      rst=1; #40;
      rst=0;
      //test input
      din=0;#20;
      din=1;#20;
      din=0;#20;
      din=1;#20;
      din=1;#20;
      din=0;#20;
      din=1;#20;
      din=1;#20;
      din=0;#20;
      din=0;#20;
      din=1;#20;
      din=0;#20;
      din=1;#20;
      din=1;#20;
      $finish;
      end
      always #10 clk=!clk;
    endmodule