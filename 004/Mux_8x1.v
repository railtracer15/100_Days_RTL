`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2025 18:31:31
// Design Name: 
// Module Name: Mux_8x1
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


module Mux_8x1(
    input [7:0] data_in, [2:0] sel,
    output reg data_out
    );
    
    always @(*) begin
    case (sel)
        3'b000: data_out=data_in[0];
        3'b001: data_out=data_in[1];
        3'b010: data_out=data_in[2];
        3'b011: data_out=data_in[3];
        3'b100: data_out=data_in[4];
        3'b101: data_out=data_in[5];
        3'b110: data_out=data_in[6];
        3'b111: data_out=data_in[7];
        
        endcase
    end
endmodule
