`timescale 1ns / 1ps
module D_tb();
    reg clk, rst, D;
    wire q, q_bar;

    D_flipflop DUT (
        .clk(clk),
        .rst(rst),
        .D(D),
        .q(q),
        .q_bar(q_bar)
    );

    always begin
        clk = 0;
        #5;  // 5 ps delay
        clk = 1;
        #5;  // 5 ps delay
    end

    initial begin
        rst = 1;
        D = 0;

        #10;  
        rst = 0;

        #10;  
        D = 0;
        #10;  

        D = 1;
        #10;

        rst = 1;
        #10; 

        rst = 0;
        #10; 
        $finish;
    end

endmodule
