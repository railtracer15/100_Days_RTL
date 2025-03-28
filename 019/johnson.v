`timescale 1ns / 1ps
module D_ff(
        input clk, rst,
        input D,
        output reg q,
        output qbar
    );
    
    always @(posedge clk) begin
        if (rst)
            q <= 0;
        else
            q <= D;    
    end
    assign qbar = ~q;
endmodule
module johnson(
    input clk, rst,
    output [3:0] y
    );
    wire [3:0] w;
    D_ff D3 (.clk(clk), .rst(rst), .D(~w[0]),.q(w[3]));
    D_ff D2 (.clk(clk), .rst(rst), .D(w[3]),.q(w[2]));
    D_ff D1 (.clk(clk), .rst(rst), .D(w[2]),.q(w[1]));
    D_ff D0 (.clk(clk), .rst(rst), .D(w[1]),.q(w[0]));
    
    assign y = w;
endmodule
