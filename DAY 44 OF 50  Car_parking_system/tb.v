        `timescale 1ns / 1ps

        module tb_parking_system;

          // Inputs
          reg clock_in;
          reg rst_in;
          reg Front_Sensor;
          reg Back_Sensor;
          reg [1:0] pass_1;
          reg [1:0] pass_2;

          // Outputs
          wire G_LED;
          wire R_LED;
          wire [6:0] HEX_1;
          wire [6:0] HEX_2;

          // Instantiate the Unit Under Test (UUT)
          parking_system uut (
          .clock_in(clock_in), 
          .rst_in(rst_in), 
          .Front_Sensor(Front_Sensor), 
          .Back_Sensor(Back_Sensor), 
          .pass_1(pass_1), 
          .pass_2(pass_2), 
          .G_LED(G_LED), 
          .R_LED(R_LED), 
          .HEX_1(HEX_1), 
         .HEX_2(HEX_2)
         );

         initial 

         begin
         clock_in = 0;
         forever #10 clock_in = ~clock_in;
         end

         initial 
         begin
         // Initialize Inputs
         rst_in = 0;
         Front_Sensor = 0;
         Back_Sensor = 0;
         pass_1 = 0;
         pass_2 = 0;
         // Wait 100 ns for global reset to finish

         #100;
              rst_in = 1;
         #20;
         Front_Sensor = 1;
         #1000;

         Front_Sensor = 0;
         pass_1 = 1;

         pass_2 = 2;

         #2000;
         Back_Sensor =1;
         #100
         Front_Sensor = 1;
         // Add stimulus here
        end

        endmodule