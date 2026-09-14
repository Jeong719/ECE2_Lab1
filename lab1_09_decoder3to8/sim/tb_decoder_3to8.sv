`timescale 1ns / 1ps

module tb_decoder_3to8;

    // 1. 입출력 신호 정의
    reg  [2:0] in;   // in[2]=a, in[1]=b, in[0]=c
    wire [7:0] out;  // o[7:0]

    // 2. DUT (Device Under Test) 인스턴스화
    decoder_3to8 uut (
        .in(in),
        .out(out)
    );

    // 3. VCD 파일 덤프 (VaporView / GTKWave 등 파형 확인용)
    initial begin
        $dumpfile("decoder_3to8.vcd");
        $dumpvars(0, tb_decoder_3to8);
    end

    // 4. 자극 인가 (Stimulus) - 10ns 주기로 변경하여 중간값 5, 15, 25, 35...ns 생성
    initial begin
        // 0ns ~ 10ns (중간값 5ns): a=0, b=0, c=0 -> out = 00000001
        in = 3'b000;
        #10;

        // 10ns ~ 20ns (중간값 15ns): a=0, b=0, c=1 -> out = 00000010
        in = 3'b001;
        #10;

        // 20ns ~ 30ns (중간값 25ns): a=0, b=1, c=0 -> out = 00000100
        in = 3'b010;
        #10;

        // 30ns ~ 40ns (중간값 35ns): a=0, b=1, c=1 -> out = 00001000
        in = 3'b011;
        #10;

        // 40ns ~ 50ns (중간값 45ns): a=1, b=0, c=0 -> out = 00010000
        in = 3'b100;
        #10;

        // 50ns ~ 60ns (중간값 55ns): a=1, b=0, c=1 -> out = 00100000
        in = 3'b101;
        #10;

        // 60ns ~ 70ns (중간값 65ns): a=1, b=1, c=0 -> out = 01000000
        in = 3'b110;
        #10;

        // 70ns ~ 80ns (중간값 75ns): a=1, b=1, c=1 -> out = 10000000
        in = 3'b111;
        #10;

        // 시뮬레이션 종료
        $finish;
    end

endmodule