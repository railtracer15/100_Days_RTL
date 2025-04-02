`timescale 1ns / 1ps
module csm( //Conttrolled Subtract Multiplex 
    input wire a, b, bi, os,   // x, y, borrow in, output select
	output wire d, bo          // difference out,  borrow out
	);  

    wire d1 = a ^ b ^ bi;
    assign d = (os & a) + (~os & d1);
	assign bo = (~a & b) + (bi & (~(a ^ b)));
	
endmodule

module divider (
    input [7:0] x,      //Dividend
    input [3:0] y,      //Divisor
    output [7:0] q,     //Quotient
    output [4:0] r      //Remainder
    );
    wire [4:0] b0, b1, b2, b3, b4, b5, b6, b7;
    wire [4:0] d0, d1, d2, d3, d4, d5, d6, d7;
    
    csm C00 (.a(x[7])   , .b(y[0])  , .bi(0)    , .os(b0[4]), .d(d0[0]), .bo(b0[0]));
    csm C01 (.a(0)      , .b(y[1])  , .bi(b0[0]), .os(b0[4]), .d(d0[1]), .bo(b0[1]));
    csm C02 (.a(0)      , .b(y[2])  , .bi(b0[1]), .os(b0[4]), .d(d0[2]), .bo(b0[2]));
    csm C03 (.a(0)      , .b(y[3])  , .bi(b0[2]), .os(b0[4]), .d(d0[3]), .bo(b0[3]));
    csm C04 (.a(0)      , .b(0)     , .bi(b0[3]), .os(b0[4]), .d(d0[4]), .bo(b0[4]));
    
    csm C10 (.a(x[6])   , .b(y[0])  , .bi(0)    , .os(b1[4]), .d(d1[0]), .bo(b1[0]));
    csm C11 (.a(d0[0])  , .b(y[1])  , .bi(b1[0]), .os(b1[4]), .d(d1[1]), .bo(b1[1]));
    csm C12 (.a(d0[1])  , .b(y[2])  , .bi(b1[1]), .os(b1[4]), .d(d1[2]), .bo(b1[2]));
    csm C13 (.a(d0[2])  , .b(y[3])  , .bi(b1[2]), .os(b1[4]), .d(d1[3]), .bo(b1[3]));
    csm C14 (.a(d0[3])  , .b(0)     , .bi(b1[3]), .os(b1[4]), .d(d1[4]), .bo(b1[4]));
    
    csm C20 (.a(x[5])   , .b(y[0])  , .bi(0)    , .os(b2[4]), .d(d2[0]), .bo(b2[0]));
    csm C21 (.a(d1[0])  , .b(y[1])  , .bi(b2[0]), .os(b2[4]), .d(d2[1]), .bo(b2[1]));
    csm C22 (.a(d1[1])  , .b(y[2])  , .bi(b2[1]), .os(b2[4]), .d(d2[2]), .bo(b2[2]));
    csm C23 (.a(d1[2])  , .b(y[3])  , .bi(b2[2]), .os(b2[4]), .d(d2[3]), .bo(b2[3]));
    csm C24 (.a(d1[3])  , .b(0)     , .bi(b2[3]), .os(b2[4]), .d(d2[4]), .bo(b2[4]));
    
    csm C30 (.a(x[4])   , .b(y[0])  , .bi(0)    , .os(b3[4]), .d(d3[0]), .bo(b3[0]));
    csm C31 (.a(d2[0])  , .b(y[1])  , .bi(b3[0]), .os(b3[4]), .d(d3[1]), .bo(b3[1]));
    csm C32 (.a(d2[1])  , .b(y[2])  , .bi(b3[1]), .os(b3[4]), .d(d3[2]), .bo(b3[2]));
    csm C33 (.a(d2[2])  , .b(y[3])  , .bi(b3[2]), .os(b3[4]), .d(d3[3]), .bo(b3[3]));
    csm C34 (.a(d2[3])  , .b(0)     , .bi(b3[3]), .os(b3[4]), .d(d3[4]), .bo(b3[4]));
    
    csm C40 (.a(x[3])   , .b(y[0])  , .bi(0)    , .os(b4[4]), .d(d4[0]), .bo(b4[0]));
    csm C41 (.a(d3[0])  , .b(y[1])  , .bi(b4[0]), .os(b4[4]), .d(d4[1]), .bo(b4[1]));
    csm C42 (.a(d3[1])  , .b(y[2])  , .bi(b4[1]), .os(b4[4]), .d(d4[2]), .bo(b4[2]));
    csm C43 (.a(d3[2])  , .b(y[3])  , .bi(b4[2]), .os(b4[4]), .d(d4[3]), .bo(b4[3]));
    csm C44 (.a(d3[3])  , .b(0)     , .bi(b4[3]), .os(b4[4]), .d(d4[4]), .bo(b4[4]));
    
    csm C50 (.a(x[2])   , .b(y[0])  , .bi(0)    , .os(b5[4]), .d(d5[0]), .bo(b5[0]));
    csm C51 (.a(d4[0])  , .b(y[1])  , .bi(b5[0]), .os(b5[4]), .d(d5[1]), .bo(b5[1]));
    csm C52 (.a(d4[1])  , .b(y[2])  , .bi(b5[1]), .os(b5[4]), .d(d5[2]), .bo(b5[2]));
    csm C53 (.a(d4[2])  , .b(y[3])  , .bi(b5[2]), .os(b5[4]), .d(d5[3]), .bo(b5[3]));
    csm C54 (.a(d4[3])  , .b(0)     , .bi(b5[3]), .os(b5[4]), .d(d5[4]), .bo(b5[4]));
    
    csm C60 (.a(x[1])   , .b(y[0])  , .bi(0)    , .os(b6[4]), .d(d6[0]), .bo(b6[0]));
    csm C61 (.a(d5[0])  , .b(y[1])  , .bi(b6[0]), .os(b6[4]), .d(d6[1]), .bo(b6[1]));
    csm C62 (.a(d5[1])  , .b(y[2])  , .bi(b6[1]), .os(b6[4]), .d(d6[2]), .bo(b6[2]));
    csm C63 (.a(d5[2])  , .b(y[3])  , .bi(b6[2]), .os(b6[4]), .d(d6[3]), .bo(b6[3]));
    csm C64 (.a(d5[3])  , .b(0)     , .bi(b6[3]), .os(b6[4]), .d(d6[4]), .bo(b6[4]));
    
    csm C70 (.a(x[0])   , .b(y[0])  , .bi(0)    , .os(b7[4]), .d(d7[0]), .bo(b7[0]));
    csm C71 (.a(d6[0])  , .b(y[1])  , .bi(b7[0]), .os(b7[4]), .d(d7[1]), .bo(b7[1]));
    csm C72 (.a(d6[1])  , .b(y[2])  , .bi(b7[1]), .os(b7[4]), .d(d7[2]), .bo(b7[2]));
    csm C73 (.a(d6[2])  , .b(y[3])  , .bi(b7[2]), .os(b7[4]), .d(d7[3]), .bo(b7[3]));
    csm C74 (.a(d6[3])  , .b(0)     , .bi(b7[3]), .os(b7[4]), .d(d7[4]), .bo(b7[4]));
    
    assign q = {~b0[4],~b1[4],~b2[4],~b3[4],~b4[4],~b5[4],~b6[4],~b7[4]};
    assign r = d7;
    
endmodule
