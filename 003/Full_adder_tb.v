`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2025 22:54:38
// Design Name: 
// Module Name: Full_adder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Full_adder_tb(
    
    );
    reg A,B,Cin;
    wire Sum,Cout;
    Full_adder uut(
        .A(A),.B(B),.Cin(Cin),.Sum(Sum),.Carry(Cout)
        );
    initial begin
    A=0;B=0;Cin=0;#10;
    A=0;B=0;Cin=1;#10;
    A=0;B=1;Cin=0;#10;
    A=0;B=1;Cin=1;#10;
    A=1;B=0;Cin=0;#10;
    A=1;B=0;Cin=1;#10;
    A=1;B=1;Cin=0;#10;
    A=1;B=1;Cin=1;#10;
    $stop;
    end
endmodule
