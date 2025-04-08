module digital_clock (
    input clk,
    input rst,
    input [4:0] init_hours,
    input [5:0] init_minutes,
    input [5:0] init_seconds,
    output [16:0] watch
);

reg [4:0] hours;
reg [5:0] minutes;
reg [5:0] seconds;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        hours   <= init_hours;
        minutes <= init_minutes;
        seconds <= init_seconds;
    end else begin
        if (seconds == 59) begin
            seconds <= 0;
            if (minutes == 59) begin
                minutes <= 0;
                if (hours == 23) begin
                    hours <= 0;
                end else begin
                    hours <= hours + 1;
                end
            end else begin
                minutes <= minutes + 1;
            end
        end else begin
            seconds <= seconds + 1;
        end
    end
end

assign watch = {hours, minutes, seconds};

endmodule
