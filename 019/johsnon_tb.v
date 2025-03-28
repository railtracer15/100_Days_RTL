`timescale 1ns / 1ps
module johnson_tb();
    reg clk, rst;
    wire [3:0] y;
    
    johnson uut(.clk(clk),.rst(rst),.y(y));
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0;
        
        #100;
        $finish;
    end
    
endmodule