`timescale 1ns / 1ps

module adder_4bit (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] s,
    output wire       cout
);

    // 4비트 덧셈 결과 (5비트: 캐리 1비트 + 합 4비트)
    assign {cout, s} = a + b;

endmodule