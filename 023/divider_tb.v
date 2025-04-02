`timescale 1ns / 1ps
module divider_tb();
    reg [7:0] x;
    reg [3:0] y;
    wire [7:0] q;
    wire [4:0] r;
    integer i, j;
    
    divider uut(.x(x), .y(y), .q(q), .r(r));
    initial begin
        $monitor("x = %d, y = %d, q = %d, r = %d", x, y, q, r);
        for (i = 0; i < 256; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                x = i;
                y = j;
                #5;
            end
        end
        #10;
        $finish;
    end
endmodule
