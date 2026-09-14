`timescale 1ns / 1ps

module tb_encoder_8to3;

    reg  [7:0] i;
    wire [2:0] a;

    integer idx;
    integer pass_count = 0;
    reg [2:0] exp_a;

    // DUT 인스턴스화
    encoder_8to3 uut (
        .i(i),
        .a(a)
    );

    // 1. wave.vcd 파일 덤프
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_encoder_8to3);
    end

    // 2. 256개 케이스 순회 검증
    initial begin
        for (idx = 0; idx < 256; idx = idx + 1) begin
            i = idx;

            // One-Hot 기준 기대값 매핑
            case (idx)
                8'b1000_0000: exp_a = 3'b000;
                8'b0100_0000: exp_a = 3'b001;
                8'b0010_0000: exp_a = 3'b010;
                8'b0001_0000: exp_a = 3'b011;
                8'b0000_1000: exp_a = 3'b100;
                8'b0000_0100: exp_a = 3'b101;
                8'b0000_0010: exp_a = 3'b110;
                8'b0000_0001: exp_a = 3'b111;
                default:      exp_a = 3'b000;
            endcase

            #5; // 구간 중간값 체크
            if (a === exp_a) begin
                pass_count = pass_count + 1;
            end
            #5;
        end

        if (pass_count == 256) begin
            $display("LAB1_PASS encoder_8to3 cases=256");
        end else begin
            $display("LAB1_FAIL encoder_8to3 passed %0d/256", pass_count);
        end
        $finish;
    end

endmodule