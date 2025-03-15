`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2025 16:04:39
// Design Name: 
// Module Name: CLA_adder
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


module CLA_adder(
    input [3:0] A,B,
    input Cin,
    output [3:0] Sum,
    output Cout
    );
    
    wire [2:0] C;
    wire [3:0] P,G;
    assign P=A^B;
    assign G=A&B;
    
    assign C[0] = G[0] | (P[0]&Cin);
    assign C[1] = G[1] | (P[1]&G[0]) | (P[1]&P[0]&Cin );
    assign C[2] = G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&Cin );
    assign Cout = G[3] | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&P[1]&P[0]&Cin);
    
    assign Sum[0]=P[0]^Cin;
    assign Sum[1]=P[1]^C[0];
    assign Sum[2]=P[2]^C[1];
    assign Sum[3]=P[3]^C[2];
    
endmodule
