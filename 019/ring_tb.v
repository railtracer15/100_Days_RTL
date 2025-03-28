`timescale 1ns / 1ps

module ring_tb();
    reg clk, rst, in;
    wire [3:0] y;

    ring uut (.clk(clk), .rst(rst), .in(in), .y(y));

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;  
        in = 1;   
        #10 rst = 0; 
        #10 in = 0; 
        
        #100;
        $finish;
    end
    initial begin
        $monitor("Time = %0t | rst = %b | in = %b | y = %b", $time, rst, in, y);
    end
endmodule
