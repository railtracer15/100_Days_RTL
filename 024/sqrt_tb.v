`timescale 1ns / 1ps
module sqrt_tb();
    reg [7:0] x;
    wire [3:0] q;
    wire [4:0] r;
    integer i;
    
    sqrt uut(.x(x), .q(q), .r(r));
    initial begin
        $monitor("x = %d, q = %d, r = %d", x, q, r);
        for (i = 0; i < 256; i = i + 1) begin
            x = i;
            #5;
        end
        #10;
        $finish;
    end
endmodule
