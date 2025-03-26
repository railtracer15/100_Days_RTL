`timescale 1ns / 1ps

module SIPO_shift_register_tb;

    // Testbench Signals
    reg clk;
    reg rst;
    reg serial_in;
    wire [3:0] parallel_out;
    
    SIPO_shift_register uut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    always #10 clk = ~clk; 

    initial begin
        clk = 0;
        rst = 1;  
        serial_in = 0;
        
        #25 rst = 0;
        
        serial_in = 1; #20;  
        serial_in = 1; #20;  
        serial_in = 0; #20;  
        serial_in = 1; #20;  
        
        serial_in = 0; #20;  
        serial_in = 1; #20;  
        serial_in = 1; #20;  
        serial_in = 0; #20;  

        #20 rst = 1; 
        #20 rst = 0; 

        serial_in = 1; #20;
        serial_in = 0; #20;
        serial_in = 1; #20;
        serial_in = 0; #20;

        #50;
        $finish;
    end
endmodule
