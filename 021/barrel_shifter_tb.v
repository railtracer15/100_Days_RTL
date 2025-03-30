`timescale 1ns / 1ps
module tb_barrel_shifter;
    parameter WIDTH = 8;
    
    reg  [WIDTH-1:0] data_in;
    reg  [$clog2(WIDTH)-1:0] shift_amt;
    reg  shift_dir;
    reg  rotate;
    wire [WIDTH-1:0] data_out;
    
    barrel_shifter #(.WIDTH(WIDTH)) uut (
        .data_in(data_in),
        .shift_amt(shift_amt),
        .shift_dir(shift_dir),
        .rotate(rotate),
        .data_out(data_out)
    );
    
    initial begin
        data_in = 8'b10101010; shift_amt = 2; shift_dir = 0; rotate = 0;
        #10;
        data_in = 8'b10101010; shift_amt = 3; shift_dir = 1; rotate = 0;
        #10;
        data_in = 8'b10101010; shift_amt = 2; shift_dir = 0; rotate = 1;
        #10;
        data_in = 8'b10101010; shift_amt = 3; shift_dir = 1; rotate = 1;
        #10;
        $stop;
    end
    
    initial begin
        $monitor("Time = %0t | Data In = %b | Shift Amt = %d | Shift Dir = %b | Rotate = %b | Data Out = %b",
                 $time, data_in, shift_amt, shift_dir, rotate, data_out);
    end
endmodule
