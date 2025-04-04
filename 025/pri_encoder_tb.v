`timescale 1ns / 1ps

module pri_encoder_tb();
    reg [7:0] in;
    wire [2:0] out;
    wire valid;
    pri_encoder uut (.in(in), .out(out), .valid(valid));
    initial begin
        $monitor("Time=%0t | in=%b | out=%b | valid=%b", $time, in, out, valid);
        
        in = 8'b0000_0000; #10; // No input active (valid = 0)
        in = 8'b0000_0001; #10; // Lowest priority active
        in = 8'b0000_0010; #10; // Higher priority (bit 2)
        in = 8'b0000_0100; #10; // Higher priority (bit 3)
        in = 8'b0000_1010; #10; // Highest priority in bit 4 (ignore bit 2)
        in = 8'b0001_0000; #10; // Higher priority (bit 5)
        in = 8'b0010_0000; #10; // Higher priority (bit 6)
        in = 8'b0100_0100; #10; // Bit 7 takes priority over bit 3
        in = 8'b1000_0000; #10; // Highest priority (bit 8)
        in = 8'b0011_0000; #10; // Multiple bits set, highest should win (bit 6)
        in = 8'b1001_0001; #10; // Multiple bits set, highest should win (bit 8)

        $finish;
    end
endmodule
