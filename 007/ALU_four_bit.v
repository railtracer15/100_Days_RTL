`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2025 21:22:16
// Design Name: 
// Module Name: ALU_four_bit 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_four_bit(
    input [3:0] A,B,
    input [2:0] opcode,
    output reg [3:0] Result,
    output wire ZF,CF,PF
    );
    
    wire [3:0] Sum;
    wire Cout;
    reg [3:0] B_mux;
    reg Cin;
    
    //Multiplexer for B input and Cin selection
    always @(*) begin
        case (opcode)
            3'b000: begin B_mux = B ;Cin = 0; end //A+B
            3'b001: begin B_mux = ~B ;Cin = 1; end //A-B
            3'b010: begin B_mux = 4'b0000 ;Cin = 0; end //A+1
            3'b011: begin B_mux = 4'b1111 ;Cin = 1; end //A-1
            default: begin B_mux = B ;Cin = 0; end //other cases
        endcase
    end
    
    //Ripple carry adder
    Ripple_Carry RCA(
        .A(A),.B(B_mux),.Cin(Cin),.Sum(Sum),.Cout(Cout)
    );
    
    always @(*)
        case (opcode)
            3'b000: Result = Sum; //ADD
            3'b001: Result = Sum; //SUB
            3'b010: Result = Sum; //INC
            3'b011: Result = Sum; //DEC
            3'b100: Result = A&B; //AND
            3'b101: Result = A|B; //OR
            3'b110: Result = A^B; //XOR
            3'b111: Result = ~A; //COMP
            default:Result = 4'bXXXX;
        endcase
        
    assign ZF = (Sum == 4'b0000) ? 1'b1 : 1'b0 ;
    assign CF = (opcode == 3'b001) ? ~Cout : Cout;
    assign PF = ~^Result;
endmodule
