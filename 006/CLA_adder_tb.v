`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2025 16:29:17
// Module Name: CLA_adder_tb
//////////////////////////////////////////////////////////////////////////////////


module CLA_adder_tb(

    );
    reg [3:0] A,B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;
    integer i,j;
    CLA_adder uut(.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
    initial begin
        Cin=0;
        for(i=0;i<16;i=i+1) begin
            for(j=0;j<16;j=j+1) begin
                A=i;
                B=j;
                #10;
                $display("A=%b,B=%b,Cin=%b => Sum=%b,Cout=%b",A,B,Cin,Sum,Cout);
            end
        end
        
        Cin=1;
        for(i=0;i<16;i=i+1) begin
            for(j=0;j<16;j=j+1) begin
                A=i;
                B=j;
                #10;
                $display("A=%b,B=%b,Cin=%b => Sum=%b,Cout=%b",A,B,Cin,Sum,Cout);
            end
        end
        $finish;
    end
endmodule
