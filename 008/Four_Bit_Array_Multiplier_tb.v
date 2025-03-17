`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 17.03.2025 18:17:33
// Design Name: 
// Module Name: Four_Bit_Array_Multiplier_tb
//////////////////////////////////////////////////////////////////////////////////


module Four_Bit_Array_Multiplier_tb(

    );
    reg [3:0] A,B;
    wire [7:0] result;
    Four_Bit_Array_Multiplier uut(.X(A),.Y(B),.Z(result));
    integer i,j;
    
    initial begin
        for(i=0;i<16;i=i+1) begin
            for (j=0;j<16;j=j+1) begin
                A=i;
                B=j;
                #10;
            end
        end
    $finish;
    end
endmodule
