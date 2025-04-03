`timescale 1ns / 1ps
module csm( //Conttrolled Subtract Multiplex 
    input wire a, b, bi, os,   // x, y, borrow in, output select
	output wire d, bo          // difference out,  borrow out
	);  

    wire d1 = a ^ b ^ bi;
    assign d = (os & a) + (~os & d1);
	assign bo = (~a & b) + (bi & (~(a ^ b)));
	
endmodule

module sqrt(    //8-bit simplified-Samovi square-root
        input [7:0] x,
        output [3:0] q,
        output [4:0] r
    );
    wire [2:0] b0;
    wire [3:0] b1;
    wire [4:0] b2;
    wire [5:0] b3;
    
    wire [2:0] d0;
    wire [3:0] d1;
    wire [4:0] d2;
    wire [5:0] d3;
    
    wire [3:0] s;   //to quotient
    
    csm C00 (.a(x[6])   , .b(1)  , .bi(0)    , .os(b0[2]), .d(d0[0]), .bo(b0[0]));
    csm C01 (.a(x[7])   , .b(0)  , .bi(b0[0]), .os(b0[2]), .d(d0[1]), .bo(b0[1]));
    csm C02 (.a(0)      , .b(0)  , .bi(b0[1]), .os(b0[2]), .d(d0[2]), .bo(b0[2]));
    
    csm C10 (.a(x[4])   , .b(1)     , .bi(0)    , .os(b1[3]), .d(d1[0]), .bo(b1[0]));
    csm C11 (.a(x[5])   , .b(0)     , .bi(b1[0]), .os(b1[3]), .d(d1[1]), .bo(b1[1]));
    csm C12 (.a(d0[0])  , .b(~b0[2]), .bi(b1[1]), .os(b1[3]), .d(d1[2]), .bo(b1[2]));
    csm C13 (.a(d0[1])  , .b(0)     , .bi(b1[2]), .os(b1[3]), .d(d1[3]), .bo(b1[3]));
    
    csm C20 (.a(x[2])   , .b(1)     , .bi(0)    , .os(b2[4]), .d(d2[0]), .bo(b2[0]));
    csm C21 (.a(x[3])   , .b(0)     , .bi(b2[0]), .os(b2[4]), .d(d2[1]), .bo(b2[1]));
    csm C22 (.a(d1[0])  , .b(~b1[3]), .bi(b2[1]), .os(b2[4]), .d(d2[2]), .bo(b2[2]));
    csm C23 (.a(d1[1])  , .b(~b0[2]), .bi(b2[2]), .os(b2[4]), .d(d2[3]), .bo(b2[3]));
    csm C24 (.a(d1[2])  , .b(0)     , .bi(b2[3]), .os(b2[4]), .d(d2[4]), .bo(b2[4]));
    
    csm C30 (.a(x[0])   , .b(1)     , .bi(0)    , .os(b3[5]), .d(d3[0]), .bo(b3[0]));
    csm C31 (.a(x[1])   , .b(0)     , .bi(b3[0]), .os(b3[5]), .d(d3[1]), .bo(b3[1]));
    csm C32 (.a(d2[0])  , .b(~b2[4]), .bi(b3[1]), .os(b3[5]), .d(d3[2]), .bo(b3[2]));
    csm C33 (.a(d2[1])  , .b(~b1[3]), .bi(b3[2]), .os(b3[5]), .d(d3[3]), .bo(b3[3]));
    csm C34 (.a(d2[2])  , .b(~b0[2]), .bi(b3[3]), .os(b3[5]), .d(d3[4]), .bo(b3[4]));
    csm C35 (.a(d2[3])  , .b(0)     , .bi(b3[4]), .os(b3[5]), .d(d3[5]), .bo(b3[5]));
    
    assign q = {~b0[2], ~b1[3], ~b2[4], ~b3[5]};
    assign r = d3;
    
endmodule
