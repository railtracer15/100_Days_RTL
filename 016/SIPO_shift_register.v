`timescale 1ns / 1ps
module SIPO_shift_register(
    input wire clk, rst ,serial_in,
    output [3:0] parallel_out
    );
    reg [3:0] shift_register;
    always @(posedge clk) begin
        if (rst)
            shift_register = 4'b0000;
        else 
            shift_register = {shift_register[2:0],serial_in};
    end
    
    assign parallel_out = shift_register;
endmodule
