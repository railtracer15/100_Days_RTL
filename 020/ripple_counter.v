`timescale 1ns / 1ps
module DFF (
    input clk,
    input rst,
    input d,
    output reg q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else
            q <= d;
    end
endmodule

module ripple_counter (
    input clk,
    input rst,
    output [3:0] q
);
    wire [3:0] d;

    assign d[0] = ~q[0];
    assign d[1] = ~q[1];
    assign d[2] = ~q[2];
    assign d[3] = ~q[3];

    DFF dff0 (.clk(clk), .rst(rst), .d(d[0]), .q(q[0]));
    DFF dff1 (.clk(q[0]), .rst(rst), .d(d[1]), .q(q[1]));
    DFF dff2 (.clk(q[1]), .rst(rst), .d(d[2]), .q(q[2]));
    DFF dff3 (.clk(q[2]), .rst(rst), .d(d[3]), .q(q[3]));

endmodule
