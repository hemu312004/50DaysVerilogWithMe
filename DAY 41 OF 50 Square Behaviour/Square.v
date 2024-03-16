module squarer(a0,a1,a2,y5,y4,y3,y2,y1,y0);
  input a0,a1,a2;
  output y5,y4,y3,y2,y1,y0;
  assign y0 = a2;
  assign y1 = 1'b0;
  assign y2 = a1&(~a2);
  assign y3 = ((~a0)&a1&(a2) | a0&(~a1)&(a2));
  assign y4 = (a0&(~a1) | a0&a2);
  assign y5 = a0&a1;
  endmodule
  