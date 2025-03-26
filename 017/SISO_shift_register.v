`timescale 1ns / 1ps
module SISO_shift_register(
    input clk, rst, serial_in,
    output serial_out
    );
    reg [3:0] shift_register;
    
    always @(posedge clk) begin
        if (rst)
            shift_register <= 4'b0000;
        else
            shift_register <= {shift_register[2:0], serial_in};
    end
    
    assign serial_out = shift_register[3];
endmodule
