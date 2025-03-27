`timescale 1ns / 1ps
module Diff_tb ;
    parameter DATA_WIDTH = 16;
    reg signed [(DATA_WIDTH-1) : 0] data;
    reg clk, rst;
    wire signed [(DATA_WIDTH-1) : 0] out;
    
    Diff #(DATA_WIDTH) uut(
        .data(data),
        .clk(clk),
        .rst(rst),
        .out(out)  
    );
    
    always #5 clk =  ~clk;
        initial begin
        clk = 0;
        rst = 1;
        data = 0;
    
        // Apply reset
        #10 rst = 0;

        // Test Sequence
        #10 data = 5;       // Previous value: 0, Expected out = 5 - 0 = 5
        #10 data = 10;      // Previous value: 5, Expected out = 10 - 5 = 5
        #10 data = 3;       // Previous value: 10, Expected out = 3 - 10 = -7
        #10 data = -4;      // Previous value: 3, Expected out = -4 - 3 = -7
        #10 data = 8;       // Previous value: -4, Expected out = 8 - (-4) = 12
        #10 data = 8;       // Previous value: 8, Expected out = 8 - 8 = 0
        #10 rst = 1;        // Applying reset, Expected out: X (unpredictable), z1 resets to 0 
        #10 rst = 0;        // Release reset
        #10 data = 15;      // Previous value: 0, Expected out = 15 - 0 = 15
        #10 data = -10;     // Previous value: 15, Expected out = -10 - 15 = -25
        #10 data = 20;      // Previous value: -10, Expected out = 20 - (-10) = 30
        #10 $finish;
    end

endmodule
