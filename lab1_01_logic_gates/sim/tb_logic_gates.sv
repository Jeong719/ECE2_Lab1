// PDF를 보며 입력 자극과 기대값을 검사할 테스트벤치를 직접 작성하세요.
// 파형 파일명은 wave.vcd로 지정하고, 종료와 오류 검사를 포함하세요.
// 파일명 또는 TB 모듈명이 바뀌면 simulation.json도 수정하세요.
`timescale 1ns / 1ps

module tb_logic_gates;
    logic a, b;
    logic out_and, out_or, out_xor;
    int err_cnt = 0;

    logic_gates uut (
        .a(a), .b(b),
        .out_and(out_and), .out_or(out_or), .out_xor(out_xor)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_logic_gates);

        for (int i = 0; i < 4; i++) begin
            {a, b} = i[1:0];
            #10;
            if (out_and !== (a & b) || out_or !== (a | b) || out_xor !== (a ^ b)) begin
                $display("ERROR at a=%b, b=%b", a, b);
                err_cnt++;
            end
        end

        if (err_cnt == 0) begin
            $display("LAB1_PASS logic_gates cases=4");
        end
        $finish;
    end
endmodule