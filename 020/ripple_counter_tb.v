`timescale 1ns / 1ps
module ripple_counter_tb;
    reg clk, rst;
    wire [3:0] q;

    ripple_counter uut (.clk(clk), .rst(rst), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0;
        #200 $stop;
    end

    initial begin
        $monitor("Time: %0t | q = %b", $time, q);
    end
endmodule

