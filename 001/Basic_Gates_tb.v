`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2025 22:20:59
// Design Name: 
// Module Name: stimuli
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


module stimuli();
reg A,B;
wire P,Q,R,S,T,U;
Basic_Gates uut(.A(A),.B(B),.P(P),.Q(Q),.R(R),.S(S),.T(T),.U(U));
initial begin
    A=0;B=0;#100;
    A=0;B=1;#100;
    A=1;B=0;#100;
    A=1;B=1;#100;
$finish;
end
endmodule
