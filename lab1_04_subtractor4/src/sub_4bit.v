`timescale 1ns / 1ps

module sub_4bit (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] diff,
    output wire       borrow
);
    // a - b 연산: 2의 보수 가산 기반
    assign {borrow, diff} = {1'b0, a} - {1'b0, b};
endmodule