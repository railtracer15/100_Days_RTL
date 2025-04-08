`timescale 1s / 1ms

module Clock_tb();
    reg clk;
    reg rst;
    reg [4:0] init_hours;
    reg [5:0] init_minutes;
    reg [5:0] init_seconds;
    wire [16:0] watch;
    digital_clock uut (
        .clk(clk),
        .rst(rst),
        .init_hours(init_hours),
        .init_minutes(init_minutes),
        .init_seconds(init_seconds),
        .watch(watch)
    );

    // Generate 1Hz clock
    always #0.5 clk = ~clk;

    // Display current time
    task display_time;
        begin
            $display("Time = %02d:%02d:%02d", watch[16:12], watch[11:6], watch[5:0]);
        end
    endtask

    initial begin
        $display("Starting Clock Simulation...");

        clk = 0;
        rst = 1;
        init_hours = 5'd23;
        init_minutes = 6'd55;
        init_seconds = 6'd0;

        #1; 
        rst = 0;

        repeat (1000) begin
            @(posedge clk);
            display_time();
        end

        $finish;
    end

endmodule
