`timescale 1ns / 1ps
module JK_tb();
    reg clk, rst, J, K;
    wire q, q_bar;

    JK_flipflop DUT (
        .clk(clk),
        .rst(rst),
        .J(J),
        .K(K),
        .q(q),
        .q_bar(q_bar)
    );

    always begin
        clk = 0;
        #5;
        clk = 1;
        #5;
    end

    initial begin
        rst = 1;
        J = 0; K = 0;
        #10;
        rst = 0;
        #10;
        J = 0; K = 0;
        #10;
        J = 1; K = 0;
        #10;
        J = 0; K = 1;
        #10;
        J = 1; K = 1;
        #10;
        rst = 1;
        #10;
        rst = 0;
        #10;
        $finish;
    end
endmodule
