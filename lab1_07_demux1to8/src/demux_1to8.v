`timescale 1ns / 1ps

module demux_1to8 (
    input  wire       din,
    input  wire [2:0] sel,
    output reg  [7:0] y
);
    always @(*) begin
        y = 8'b00000000;
        case (sel)
            3'b000: y[0] = din;
            3'b001: y[1] = din;
            3'b010: y[2] = din;
            3'b011: y[3] = din;
            3'b100: y[4] = din;
            3'b101: y[5] = din;
            3'b110: y[6] = din;
            3'b111: y[7] = din;
        endcase
    end
endmodule