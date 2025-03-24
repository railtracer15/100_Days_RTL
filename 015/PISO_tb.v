`timescale 1ns / 1ps

module piso_tb();
    reg clock, load, rst;
    reg [3:0] pin;
    wire sout;

    PISO_shift_register dut (.clk(clock), .rst(rst), .load(load), .parallel_in(pin), .serial_out(sout));
    always #5 clock = ~clock;

    // Stimulus
    initial begin
        clock = 0;
        rst = 1;  // Apply reset initially
        load = 0;
        pin = 4'b0000;

        #10 rst = 0; // De-assert reset

        // Test Case 1: Load 1010 and shift out
        #10 load = 1; pin = 4'b0010;  
        #10 load = 0;
        #10;
        #10;
        #10;
        #10;

        // Test Case 2: Apply reset in the middle of shifting
        #10 rst = 1; // Apply reset while shifting
        #10 rst = 0; // De-assert reset

        // Test Case 3: Load 0101 and shift out
        #10 load = 1; pin = 4'b0101;  
        #10 load = 0;
        #10;
        #10;
        #10;
        #10;

        // Test Case 4: Load 1111 and shift
        #10 load = 1; pin = 4'b1111;
        #10 load = 0;
        #10;
        #10;
        #10;
        #10;

        // Test Case 5: Load 0000 and shift (Checking if all 0s shift correctly)
        #10 load = 1; pin = 4'b0000;
        #10 load = 0;
        #10;
        #10;
        #10;
        #10;

        // Test Case 6: Load 1100, then reset before shifting
        #10 load = 1; pin = 4'b1100;
        #10 rst = 1; // Apply reset before shifting starts
        #10 rst = 0;
        #10 load = 0; // Continue shifting to verify it's reset
        #10;
        #10;
        #10;
        #10;

        // Test Case 7: Load 0011, shift two bits, then reload with 1010 mid-shift
        #10 load = 1; pin = 4'b0011;
        #10 load = 0;
        #10;
        #10;
        #10 load = 1; pin = 4'b1010; //Mid shift
        #10 load = 0;
        #10;
        #10;
        #10;
        #10;
        
        #50 $finish;
    end
endmodule
