// PDF의 회로 코드를 여기에 직접 작성하고 저장하세요.
// 파일명을 바꾸거나 하위 모듈을 추가하면 simulation.json의 sources도 수정하세요.
`timescale 1ns / 1ps

module logic_gates (
    input  wire a,
    input  wire b,
    output wire out_and,
    output wire out_or,
    output wire out_xor
);
    assign out_and = a & b;
    assign out_or  = a | b;
    assign out_xor = a ^ b;
endmodule