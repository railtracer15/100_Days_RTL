`timescale 1ns / 1ps

module CMOS_inv_tb();
    reg in;        // Input signal
    wire out;      // Output signal

    CMOS_inv uut (
        .in(in),
        .out(out)
    );

    initial begin
        in = 0; #10;  

        in = 1; #10; 

        in = 0; #10;  

        in = 1; #10; 
        $finish;  
    end
endmodule
