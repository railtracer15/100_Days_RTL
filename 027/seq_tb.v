`timescale 1ns / 1ps
`timescale 1ns / 1ps

module tb_sequence_detect();

    // Inputs
    reg clk;
    reg rst;
    reg in;

    // Outputs
    wire out;

    // Instantiate the module under test
    sequence_detect dut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out)
    );

    // Clock generation
    always begin
        clk = 0;
        #5;
        clk = 1;
        #5;
    end

    initial begin
        rst = 1;
        in = 0;
        #10;
        rst = 0;
    end

    initial begin
        #20;
        in = 1;
        #10;
        in = 0;
        #10;
        in = 1;
        #10;
        in = 1;
        #10;
        in = 0;
        #10;

        in = 1;
        #10;
        in = 0;
        #10;
        in = 1;
        #10;
        in = 0;
        #10;
        in = 1;
        #10;
        in = 1;
        #10;
        in = 0;
        #10;
        in = 1;
        #10;
        in = 1;
        #10;
        in = 1;
        #10;
        in = 0;
        #10;
        $finish;
    end

endmodule

