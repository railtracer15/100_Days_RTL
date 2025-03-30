`timescale 1ns / 1ps
module barrel_shifter #(
    parameter WIDTH = 8
)(
    input  wire [WIDTH-1:0] data_in,
    input  wire [$clog2(WIDTH)-1:0] shift_amt,
    input  wire shift_dir,   
    input  wire rotate,      
    output reg  [WIDTH-1:0] data_out
);

    always @(*) begin
        if (shift_dir == 0) begin  
            if (rotate)
                data_out = (data_in << shift_amt) | (data_in >> (WIDTH - shift_amt));
            else
                data_out = data_in << shift_amt;
        end else begin  
            if (rotate)
                data_out = (data_in >> shift_amt) | (data_in << (WIDTH - shift_amt));
            else
                data_out = data_in >> shift_amt;
        end
    end

endmodule

