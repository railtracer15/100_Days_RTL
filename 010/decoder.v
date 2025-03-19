`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 17:38:13
// Design Name: 
// Module Name: decoder
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


module decoder(
    input A ,B, C,
    output Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7
    );
    wire A_n ,B_n ,C_n;
    
    not( A_n ,A  );
    not( B_n ,B  );
    not( C_n ,C  );
    
    and(Y0  ,A_n    ,B_n    ,C_n    );
    and(Y1  ,A_n    ,B_n    ,C      );
    and(Y2  ,A_n    ,B      ,C_n    );
    and(Y3  ,A_n    ,B      ,C      );
    and(Y4  ,A      ,B_n    ,C_n    );
    and(Y5  ,A      ,B_n    ,C     );
    and(Y6  ,A      ,B      ,C_n    );
    and(Y7  ,A      ,B      ,C      );
    
endmodule
