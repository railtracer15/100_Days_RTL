`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2025 18:15:15
// Design Name: 
// Module Name: Ripple_carry_add_tb
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


module Ripple_carry_add_tb(

    );
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;
    integer i,j;
    ripple_carry uut(
        .A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout)
    );
    initial begin
        
        Cin=0;
        for(i=0;i<16;i=i+1) begin
            for (j=0;j<16;j=j+1) begin
                A=i;
                B=j;
                #10;
                $display("A = %b, B = %b, Cin = %b => Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);
            end
        end
        
        Cin=1;
        for(i=0;i<16;i=i+1) begin
            for (j=0;j<16;j=j+1) begin
                A=i;
                B=j;
                #10;
                $display("A = %b, B = %b, Cin = %b => Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);
            end
        end
        $finish;
    end
endmodule
