`timescale 1ns / 1ps
module T_tb();
    reg clk, rst, T;
    wire q, q_bar;

    T_flipflop DUT (
        .clk(clk),
        .rst(rst),
        .T(T),
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
        T = 0;
        #10;
        rst = 0;
        #10;
        T = 0;
        #10;
        T = 1;
        #10;
        T = 0;
        #10;
        T = 1;
        #10;
        rst = 1;
        #10;
        rst = 0;
        #10;
        $finish;
    end
endmodule
