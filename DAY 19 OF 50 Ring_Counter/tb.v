module tb();
	reg clk,rst;
	wire [3:0] q;
	
	RING_COUNTER dut(clk,rst,q);

initial
		begin
				clk = 0;
				rst = 0;		
		end
always #10 clk = ~clk;

initial
	begin
		rst = 1;
		#20;
		rst = 0;
		#500 $finish;
	end
endmodule