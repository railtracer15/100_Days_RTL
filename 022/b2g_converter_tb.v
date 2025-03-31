`timescale 1ns / 1ps
module b2g_converter_tb();
    reg [3:0] binary;
    wire [3:0] gray;

    b2g_converter uut (.binary(binary),.gray(gray));

    initial begin
        $monitor("Time=%0t Input=%b Gray=%b", $time, binary, gray);

        binary = 4'b0000; #10;
        binary = 4'b0001; #10;
        binary = 4'b0011; #10;
        binary = 4'b0111; #10;
        binary = 4'b1111; #10;

        $finish;
    end
endmodule
