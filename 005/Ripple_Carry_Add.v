`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2025 17:49:49
// Design Name: 
// Module Name: Ripple_Carry_Add
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


module full_adder(
    input A,B,Cin,
    output Sum,Cout
    );
    
    assign Sum= A ^ B ^ Cin;
    assign Cout= A & B | ( Cin & (A ^ B ));
endmodule

module ripple_carry(
    input [3:0] A,[3:0] B, 
    input Cin,
    output [3:0] Sum, 
    output Cout
);
    wire C0,C1,C2;
    full_adder FA0(.A(A[0]),.B(B[0]),.Cin(Cin),.Sum(Sum[0]),.Cout(C0));
    full_adder FA1(.A(A[1]),.B(B[1]),.Cin(C0),.Sum(Sum[1]),.Cout(C1));
    full_adder FA2(.A(A[2]),.B(B[2]),.Cin(C1),.Sum(Sum[2]),.Cout(C2));
    full_adder FA3(.A(A[3]),.B(B[3]),.Cin(C2),.Sum(Sum[3]),.Cout(Cout));
    
endmodule


