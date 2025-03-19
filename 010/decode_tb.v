`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 17:45:44
// Design Name: 
// Module Name: decode_tb
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


module decode_tb(

    );
    reg A,B,C;
    wire Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
    
    decoder uut(A,B,C,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
    
    initial begin
        A=0;B=0;C=0;#10;
        A=0;B=0;C=1;#10;
        A=0;B=1;C=0;#10;
        A=0;B=1;C=1;#10;
        A=1;B=0;C=0;#10;
        A=1;B=0;C=1;#10;
        A=1;B=1;C=0;#10;
        A=1;B=1;C=1;#10;
    $stop;
    end
    
endmodule
