module tb_synchronizer();

    /* Module Inputs */
        reg clk_1;
        reg clk_2;
        reg in;

    /* Module Outputs */
        wire sync_out;
        wire rise_edge_tick;
        wire fall_edge_tick;

    /* Testbench Specific */


//** CONSTANT DECLARATION 
    /* Local */

    /* Clock simulation */
        localparam clock_1_T_ns = 10;     // 100 MHz
        localparam clock_2_T_ns = 17;     // 59 MHz
    /* General shortcuts */
        localparam T = 1'b1;
        localparam F = 1'b0;

//** SYMBOLIC STATE DECLARATIONS *

//** SIGNAL DECLARATIONS

//** INSTANTIATE THE UNIT UNDER TEST (UUT)

    synchronizer #( .SYNC_STAGES(2) )    // Example with 2 stage flip flop
    synchronizer(                        // Instance name
        .clk(clk_1),                     // Your clock signal
        .async_in(in),                   // Asynchronous input signal
        .sync_out(sync_out),             // Safe synchronized signal
        .rise_edge_tick(rise_edge_tick), // Pulse on rise edge of safe signal
        .fall_edge_tick(fall_edge_tick)  // Pulse on fall edge of safe signal
    );


//** ASSIGN STATEMENTS 

//** CLOCK

    always begin
        clk_1 = T;
        #(clock_1_T_ns/2);
        clk_1 = F;
        #(clock_1_T_ns/2);
    end

    always begin
        clk_2 = T;
        #(clock_2_T_ns/2);
        clk_2 = F;
        #(clock_2_T_ns/2);
    end

//** UUT Tests

    initial begin

        initial_conditions();

    /* Begin tests */
        delay_N_clk_2_cycles(5);
        in = T;
        delay_N_clk_2_cycles(5);
        in = F;
        delay_N_clk_2_cycles(5);
        in = T;
        delay_N_clk_2_cycles(5);
        in = F;
        delay_N_clk_2_cycles(5);
        
//        $monitor($realtime, " count = %d", cnt);

        $finish;
    end

//** FUNCTIONS 

//** Tasks 
    task initial_conditions; begin
        repeat(5) @(posedge clk_1)
        in = F;
        end
    endtask


    task delay_N_clk_1_cycles(input integer N); begin
        repeat(N) @(posedge clk_1);
        end
    endtask
    
       task delay_N_clk_2_cycles(input integer N); begin
        repeat(N) @(posedge clk_2);
        end
    endtask
    
endmodule
