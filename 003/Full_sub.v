`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2025 23:01:55
// Design Name: 
// Module Name: Full_sub
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

module Half_sub(
    input A,B,
    output Diff,Borr
);
    assign Diff=A^B;
    assign Borr=~A&B;
endmodule

module Full_sub(
    input A,B,Bin,
    output Diff,Bout
    );
    wire D1,B1,B2;
    //First Half Subtractor
    Half_sub HS1(.A(A),.B(B),.Diff(D1),.Borr(B1));
    //Secind Half Subtractor
    Half_sub HS2(.A(D1),.B(Bin),.Diff(Diff),.Borr(B2));
    
    assign Bout=B1|B2;
endmodule
