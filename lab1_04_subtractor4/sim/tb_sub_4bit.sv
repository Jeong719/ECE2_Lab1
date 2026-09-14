// PDF를 보며 입력 자극과 기대값을 검사할 테스트벤치를 직접 작성하세요.
// 파형 파일명은 wave.vcd로 지정하고, 종료와 오류 검사를 포함하세요.
// 파일명 또는 TB 모듈명이 바뀌면 simulation.json도 수정하세요.
`timescale 1ns / 1ps

module tb_sub_4bit;
    logic [3:0] a, b;
    logic [3:0] diff;
    logic       borrow;
    int err_cnt = 0;

    sub_4bit uut (
        .a(a), .b(b),
        .diff(diff), .borrow(borrow)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_sub_4bit);

        for (int i = 0; i < 16; i++) begin
            for (int j = 0; j < 16; j++) begin
                a = i[3:0];
                b = j[3:0];
                #10;
                if ({borrow, diff} !== ({1'b0, a} - {1'b0, b})) begin
                    err_cnt++;
                end
            end
        end

        if (err_cnt == 0) begin
            $display("LAB1_PASS sub_4bit cases=256");
        end
        $finish;
    end
endmodule