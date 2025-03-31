`timescale 1ns / 1ps
module b2g_converter (
    input wire [3:0] binary,
    output reg [3:0] gray
);

    always @(*) begin
        gray[3] = binary[3];
        gray[2] = binary[3] ^ binary[2];
        gray[1] = binary[2] ^ binary[1];
        gray[0] = binary[1] ^ binary[0];
    end

endmodule
