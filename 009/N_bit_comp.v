`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 18.03.2025 09:41:06
// Module Name: N_bit_comp
//////////////////////////////////////////////////////////////////////////////////


module N_bit_comp(A ,B ,gt ,ls ,eq);
    parameter N=8;
    input [N-1:0] A ,B ;
    output gt ,ls ,eq ;
    reg gt = 0 ,ls = 0 ,eq = 0 ;
    
    always @(*) begin
        if (A>B)
            begin
                gt=1'b1;
                ls=1'b0;
                eq=1'b0;
            end
            
        else if (A<B)
            begin
                gt=1'b0;
                ls=1'b1;
                eq=1'b0;
            end
            
        else
            begin
                gt=1'b0;
                ls=1'b0;
                eq=1'b1;
            end
    end
endmodule
