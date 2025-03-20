`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2025 10:19:19
// Design Name: 
// Module Name: D_latch_tb
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


module D_latch_tb(

    );
  reg D, EN;
  wire Q;
  
  D_latch D_latch_inst (
    .D(D),
    .EN(EN),
    .Q(Q)
  );
  
  
  initial begin
    D = 0;
    EN = 0;             //Q=X
    #10 D = 1; EN = 1; //Q=1
    #10 D = 1; EN = 0; //Q=1
    #10 D = 0; EN = 0; //Q=1
    #10 D = 0; EN = 1; //Q=0
    #10 D = 0; EN = 0;  //Q=0
    #10 D = 1; EN = 0; //Q=1
    #10 $finish;
  end
endmodule
