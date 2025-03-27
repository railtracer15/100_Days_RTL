`timescale 1ns / 1ps
module Diff(data, clk ,rst ,out);
    parameter DATA_WIDTH = 16;
    
    input signed [(DATA_WIDTH - 1):0] data;
    input clk, rst;
    output signed [(DATA_WIDTH -1):0] out;
    
    reg [(DATA_WIDTH - 1):0] z1 = 0;
    
    assign out = data -z1;
    
    always @(posedge clk ,posedge rst) begin
        if (rst) begin
            z1 <= 0;
        end else begin
            z1 <= data;
        end
    end
    
endmodule
