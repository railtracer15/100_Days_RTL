`timescale 1ns / 1ps

module SISO_tb;

    reg clk, rst, serial_in;
    wire serial_out;

    SISO_shift_register uut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        serial_in = 0;
        
        #20 rst = 0;
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 1;
        #50 $finish;
    end

endmodule
