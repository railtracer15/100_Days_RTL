`timescale 1ns / 1ps
module D_flipflop(
    input clk, rst,
    input D,
    output reg q,
    output q_bar
    );
    
    always @(posedge clk) begin
        if (rst) q <= 0;
        else 
            q <= D;
    end
    assign q_bar = ~q ;
endmodule
