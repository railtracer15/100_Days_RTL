`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2025 12:37:19
// Design Name: 
// Module Name: ALU_four_bit_tb
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


module ALU_four_bit_tb();
    reg signed [3:0] A,B;
    reg [2:0] opcode;
    wire [3:0] Result;
    wire ZF,CF,PF;
    integer i,j,k;
    
    ALU_four_bit uut(.A(A),.B(B),.opcode(opcode),.Result(Result),.ZF(ZF),.CF(CF),.PF(PF));
    
    initial begin
        for (i=0;i<8;i=i+1) begin
            for (j=0;j<16;j=j+1) begin
                for (k=0;k<16;k=k+1) begin
                    opcode=i;
                    A=j;
                    B=k;
                    #10;
                end
            end
        end
        $finish;
     end
endmodule
