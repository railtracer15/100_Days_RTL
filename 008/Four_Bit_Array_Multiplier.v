`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 17.03.2025 16:38:07
// Module Name: Four_Bit_Array_Multiplier 
//////////////////////////////////////////////////////////////////////////////////


module Half_Adder(
    input A,B,
    output S,C
);
    xor(S   ,A  ,B  );
    and(C   ,A  ,B  );
endmodule

module Full_Adder(
    input A,B,Cin,
    output S,C
);
    wire w1,w2,w3;
    xor (w1 ,A  ,B  );
    xor (S  ,w1 ,Cin);
    and (w2 ,Cin,w1 );
    and (w3 ,A  ,B  );
    or  (C  ,w3 ,w2 );
endmodule
module Four_Bit_Array_Multiplier(
    input [3:0] X,//Multiplicand
    input [3:0] Y,//Multiplier
    output [7:0] Z
    );
    wire [3:0] P0,P1,P2,P3;//Partial Products
    
    assign P0= X & {4{Y[0]}};
    assign P1= X & {4{Y[1]}};
    assign P2= X & {4{Y[2]}};
    assign P3= X & {4{Y[3]}};
    
    wire [12:1] tmp_c;//temporary wire for carry 
    wire [6:1] tmp_s;//tempoarray wire for sum
    //Level 0
    assign Z[0]=P0[0];
    
    //Level 1
    Half_Adder HA1 (.S(Z[1])    ,.C(tmp_c[1])   ,.A(P0[1])  ,.B(P1[0]));
    Full_Adder FA1 (.S(tmp_s[1]),.C(tmp_c[2])   ,.A(P1[1])  ,.B(P0[2])  ,.Cin(tmp_c[1]));
    Full_Adder FA2 (.S(tmp_s[2]),.C(tmp_c[3])   ,.A(P0[3])  ,.B(P1[2])  ,.Cin(tmp_c[2]));
    
    //Level 2
    Half_Adder HA2 (.S(Z[2])    ,.C(tmp_c[4])   ,.A(P2[0])  ,.B(tmp_s[1]));
    Full_Adder FA3 (.S(tmp_s[3]),.C(tmp_c[5])   ,.A(P2[1])  ,.B(tmp_s[2])  ,.Cin(tmp_c[4]));
    Full_Adder FA4 (.S(tmp_s[4]),.C(tmp_c[6])   ,.A(P1[3])  ,.B(tmp_c[3])  ,.Cin(tmp_c[5]));
    
    //Level 3
    Half_Adder HA3 (.S(Z[3])    ,.C(tmp_c[7])   ,.A(P3[0])  ,.B(tmp_s[3]));
    Full_Adder FA5 (.S(tmp_s[5]),.C(tmp_c[8])   ,.A(P2[2])  ,.B(tmp_s[4])  ,.Cin(tmp_c[7]));
    Full_Adder FA6 (.S(tmp_s[6]),.C(tmp_c[9])   ,.A(P2[3])  ,.B(tmp_c[6])  ,.Cin(tmp_c[8]));
    
    //Level 4
    Half_Adder HA4 (.S(Z[4])    ,.C(tmp_c[10])  ,.A(P3[1])  ,.B(tmp_s[5]));
    Full_Adder FA7 (.S(Z[5])    ,.C(tmp_c[11])  ,.A(P3[2])  ,.B(tmp_s[6])  ,.Cin(tmp_c[10]));
    Full_Adder FA8 (.S(Z[6])    ,.C(Z[7])  ,.A(P3[3])       ,.B(tmp_c[9])  ,.Cin(tmp_c[11]));  
    
    
endmodule
