// Code your design here
module traffic(north,south,east,west,clock,reset);
  
  //The input,outputs and internal variable are declared here.
  output reg [2:0] north,south,east,west; //declaration of 4 roads
  input clock;
  input reset;
  reg [2:0] state;
  reg [2:0] count;
  parameter[2:0] north_green= 3'b000;//declare of green light state
  parameter[2:0] north_yellow=3'b001;//declare of yellow light state
  parameter[2:0] south_green= 3'b010;//declare of green light state
  parameter[2:0] south_yellow=3'b011;//declare of yellow light state
  parameter[2:0] east_green=  3'b100;//declare of green light state
  parameter[2:0] east_yellow= 3'b101;//declare of yellow light state
  parameter[2:0] west_green=  3'b110;//declare of green light state
  parameter[2:0] west_yellow= 3'b111;//declare of yellow light state

  
  //reg [2:0] count;
 
  
  always @(posedge clock,posedge reset)
    begin
      if(reset)
        begin
          state=north_green;
          count=3'b000;
        end
      else
        begin
          case(state)
            north_green:
             begin
              case(count)
                3'b111:begin count=3'b000;//Changes to yellow light state
                       state=north_yellow;
                end
                default:begin count=count+3'b001;//Count's for 8 clock pulses
                       state=north_green;
                end
              endcase
             end
           //north_green in if else
            //north_green:
             //  begin
                //        if (count==3'b111)
                  //          begin
                   //         count=3'b000;
                  //          state=north_yellow;
                  //          end
                  //      else
                 //           begin
                 //           count=count+3'b001;
                 //           state=north_green;
                  //          end
              //  end
            north_yellow:
             begin
              case(count)
                3'b011:begin count=3'b000;//Road change
                       state=south_green;
                end
                default:begin count=count+3'b001;//Count's for 4 clock pulses
                        state=north_yellow;
                end
              endcase
             end
            //north_yellow in if else
            //north_yellow:
             //  begin
               //        if (count==3'b011)
                  //          begin
                   //         count=3'b000;
                  //          state=south_green;
                  //          end
                  //      else
                 //           begin
                 //           count=count+3'b001;
                 //           state=north_yellow;
                  //          end
              //  end
            
            
            south_green:
             begin
              case(count)
                3'b111:begin count=3'b0;//Changes to yellow light state
                             state=south_yellow;
                end
                default:begin count=count+3'b001;//Count's for 8 clock pulses
                              state=south_green;
                end
              endcase
             end
            //south_green in if else
            //south_green:
             //  begin
                //        if (count==3'b111)
                  //          begin
                   //         count=3'b000;
                  //          state=south_yellow;
                  //          end
                  //      else
                 //           begin
                 //           count=count+3'b001;
                 //           state=south_green;
                  //          end
              //  end
            south_yellow:
             begin
              case(count)
                3'b011:begin count=3'b0;//Road change
                        state=east_green;
                end
                default:begin count=count+3'b001;//Count's for 4 clock pulses
                        state=south_yellow;
                end
              endcase
             end
            //south_yellow in if else
            //south_yellow:
             //  begin
               //        if (count==3'b011)
                  //          begin
                   //         count=3'b000;
                  //          state=east_green;
                  //          end
                  //      else
                 //           begin
                 //           count=count+3'b001;
                 //           state=south_yellow;
                  //          end
              //  end
            
            east_green:
             begin
              case(count)
                3'b111:begin count=3'b0;//Changes to yellow light state
                      state=east_yellow;
                end
                default:begin count=count+3'b001;//Count's for 8 clock pulses
                              state=east_green;
                end
              endcase
             end
            //east_green in if else
            //east_green:
             //  begin
                //        if (count==3'b111)
                  //          begin
                   //         count=3'b000;
                  //          state=east_yellow;
                  //          end
                  //      else
                 //           begin
                 //           count=count+3'b001;
                 //           state=east_green;
                  //          end
              //  end
            east_yellow:
             begin
              case(count)
                3'b011:begin count=3'b0;//Road change
                             state=west_green;
                end
                default:begin count=count+3'b001;//Count's for 4 clock pulses
                              state=east_yellow;
                end
              endcase
             end
            //east_yellow in if else
            //east_yellow:
             //  begin
               //        if (count==3'b011)
                  //          begin
                   //         count=3'b000;
                  //          state=west_green;
                  //          end
                  //      else
                 //           begin
                 //           count=count+3'b001;
                 //           state=east_yellow;
                  //          end
              //  end
            
            west_green:
             begin
              case(count)
                3'b111:begin count=3'b0;//Changes to yellow light state
                             state=west_yellow;
                end
                default:begin count=count+3'b001;//Count's for 8 clock pulses   
                              state=west_green;
                end
              endcase
             end
            //west_green in if else
            //west_green:
             //  begin
                //        if (count==3'b111)
                  //          begin
                   //         count=3'b000;
                  //          state=west_yellow;
                  //          end
                  //      else
                 //           begin
                 //           count=count+3'b001;
                 //           state=west_green;
                  //          end
              //  end
            west_yellow:
             begin
              case(count)
                3'b011:begin count=3'b0;//Road change
                        state=north_green;
                end
                default:begin count=count+3'b001;//Count's for 4 clock pulses
                              state=west_yellow;
                end
              endcase
             end
            //west_yellow in if else
            //west_yellow:
             //  begin
               //        if (count==3'b011)
                  //          begin
                   //         count=3'b000;
                  //          state=north_green;
                  //          end
                  //      else
                 //           begin
                 //           count=count+3'b001;
                 //           state=west_yellow;
                  //          end
              //  end
            
          endcase
        end
    end
  //red light value='100',yellow light value='010',green light value='001'
  always @(state)
    begin
      case(state)
        north_green:
          begin
            north=3'b001;
            south=3'b100;
            east=3'b100;
            west=3'b100;
          end//north_green
        north_yellow:
          begin
            north=3'b010;
            south=3'b100;
            east=3'b100;
            west=3'b100;
          end//north_yellow
        south_green:
          begin
            north=3'b100;
            south=3'b001;
            east=3'b100;
            west=3'b100;
          end//south_green
        south_yellow:
          begin
            north=3'b100;
            south=3'b010;
            east=3'b100;
            west=3'b100;
          end//south_yellow
        east_green:
          begin
            north=3'b100;
            south=3'b100;
            east=3'b001;
            west=3'b100;
          end//east_green
        east_yellow:
          begin
            north=3'b100;
            south=3'b100;
            east=3'b010;
            west=3'b100;
          end//east_yellow
        west_green:
          begin
            north=3'b100;
            south=3'b100;
            east=3'b100;
            west=3'b001;
          end//west_green
        west_yellow:
          begin
            north=3'b100;
            south=3'b100;
            east=3'b100;
            west=3'b010;
          end//west_yellow
      endcase
    end
endmodule
            
            
            
            
        
                
                
                
                
            
                
                  
              
      
        
                  
  
  
                  
               
  