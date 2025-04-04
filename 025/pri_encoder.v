`timescale 1ns / 1ps
module pri_encoder(
    input [7:0] in,
    output reg [2:0] out,
    output reg valid
);

always @(*) begin
    casez (in)
        8'b0000_0000 : begin out = 3'bxxx; valid = 0; end
        8'b0000_0001 : begin out = 3'b000; valid = 1; end
        8'b0000_001? : begin out = 3'b001; valid = 1; end
        8'b0000_01?? : begin out = 3'b010; valid = 1; end
        8'b0000_1??? : begin out = 3'b011; valid = 1; end
        8'b0001_???? : begin out = 3'b100; valid = 1; end
        8'b001?_???? : begin out = 3'b101; valid = 1; end
        8'b01??_???? : begin out = 3'b110; valid = 1; end
        8'b1???_???? : begin out = 3'b111; valid = 1; end
    endcase
end

endmodule
