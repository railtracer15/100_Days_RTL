`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2025 22:12:32
// Design Name: 
// Module Name: Basic_Gates
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


module Basic_Gates(A,B,P,Q,R,S,T,U);
    input A,B;
    output P,Q,R,S,T,U;
    
    and a1(P,A,B);
    or a2(Q,A,B);
    nand a3(R,A,B);
    nor a4(S,A,B);
    xor a5(T,A,B);
    xnor a6(U,A,B);
    
endmodule
