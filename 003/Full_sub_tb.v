`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2025 23:14:21
// Design Name: 
// Module Name: Full_sub_tb
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


module Full_sub_tb(

    );
    reg A,B,Bin;
    wire Diff,Bout;
    Full_sub uut(
        .A(A),.B(B),.Bin(Bin),.Diff(Diff),.Bout(Bout)
    );
    initial begin
        $monitor ("Time=%t | A=%b | B=%b | Bin=%b | Diff=%b | Bout=%b",
                    $time, A,B,Bin,Diff,Bout );
        //test cases
        A=0;B=0;Bin=0;#10;
        A=0;B=0;Bin=1;#10;
        A=0;B=1;Bin=0;#10;
        A=0;B=1;Bin=1;#10;
        A=1;B=0;Bin=0;#10;
        A=1;B=0;Bin=1;#10;
        A=1;B=1;Bin=0;#10;
        A=1;B=1;Bin=1;#10;
        $finish;
    end
endmodule
