`timescale 1ns / 1ps
module T_flipflop( 
    input clk, rst,
    input T,
    output reg q,
    output q_bar
    );
    always @(posedge clk) begin
        if (rst) q <= 0;
        else 
            q <= q ^ T;
    end
    assign q_bar = ~q;
endmodule
