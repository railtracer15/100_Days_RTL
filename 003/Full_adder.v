`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2025 22:45:48
// Design Name: 
// Module Name: Full_adder
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
module Half_adder(
    input a,b,
    output s,c
);
    assign s=a^b;
    assign c=a&b;
endmodule

module Full_adder(
    input A,B,Cin,
    output Sum,Carry
    );
    wire S1,C1,C2;
    //First Half Adder
    Half_adder HA1 (.a(A),.b(B),.s(S1),.c(C1));
    //Second Half Adder
    Half_adder HA2 (.a(S1),.b(Cin),.s(Sum),.c(C2));
    
    assign Carry=C1|C2;
endmodule
