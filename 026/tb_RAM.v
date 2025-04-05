`timescale 1ns / 1ps

module tb_RAM();
    parameter addr_size = 10;
    parameter word_size = 8;
    parameter memory_size = 1024;

    reg [addr_size-1:0] addr;
    reg wr, cs;
    reg [word_size-1:0] data_in;
    wire [word_size-1:0] data_out;

    RAM #(addr_size, word_size, memory_size) uut (
        .data_out(data_out),
        .data_in(data_in),
        .addr(addr),
        .wr(wr),
        .cs(cs)
    );

    initial begin
        addr = 0;
        data_in = 0;
        wr = 0;
        cs = 0;

        #10;

        cs = 1;
        wr = 1;
        
        addr = 10;
        data_in = 8'hAB;
        #10;

        addr = 20;
        data_in = 8'hCD;
        #10;

        wr = 0; 
        #5;

        addr = 10;
        #10;
        $display("Read from addr 10: %h (expected AB)", data_out);

        addr = 20;
        #10;
        $display("Read from addr 20: %h (expected CD)", data_out);

        $finish;
    end

endmodule
