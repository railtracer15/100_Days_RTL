`timescale 1ns / 1ps
module SR_tb();
    reg clk, rst, S, R;
    wire q, q_bar;

    SR_flipflop DUT (
        .clk(clk),
        .rst(rst),
        .S(S),
        .R(R),
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
        S = 0; R = 0;
        #10;
        rst = 0;
        #10;
        S = 0; R = 0;
        #10;
        S = 1; R = 0;
        #10;
        S = 0; R = 1;
        #10;
        S = 1; R = 1;
        #10;
        rst = 1;
        #10;
        rst = 0;
        #10;
        $finish;
    end
endmodule
