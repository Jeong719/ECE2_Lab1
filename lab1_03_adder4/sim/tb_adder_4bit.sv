`timescale 1ns / 1ps

module tb_adder_4bit;

    reg  [3:0] a;
    reg  [3:0] b;
    wire [3:0] s;
    wire       cout;

    integer pass_count = 0;

    // DUT 인스턴스화
    adder_4bit uut (
        .a(a),
        .b(b),
        .s(s),
        .cout(cout)
    );

    // 1. wave.vcd 파일 덤프
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_adder_4bit);
    end

    // 검증 태스크
    task verify_step(input [3:0] exp_s, input exp_cout);
        begin
            #5; // 중간값 시점
            if (s === exp_s && cout === exp_cout) begin
                pass_count = pass_count + 1;
            end
            #5;
        end
    endtask

    // 2. 자극 인가 및 채점
    initial begin
        // case 1 (중간값 5ns): a=0000, b=0000 -> s=0000, cout=0
        a = 4'b0000; b = 4'b0000;
        verify_step(4'b0000, 1'b0);

        // case 2 (중간값 15ns): a=0000, b=0001 -> s=0001, cout=0
        a = 4'b0000; b = 4'b0001;
        verify_step(4'b0001, 1'b0);

        // case 3 (중간값 35ns): a=0000, b=0011 -> s=0011, cout=0
        #10;
        a = 4'b0000; b = 4'b0011;
        verify_step(4'b0011, 1'b0);

        // case 4 (중간값 1285ns): a=1000, b=0000 -> s=1000, cout=0
        #1240;
        a = 4'b1000; b = 4'b0000;
        verify_step(4'b1000, 1'b0);

        // case 5 (중간값 2555ns): a=1111, b=1111 -> s=1110, cout=1
        #1260;
        a = 4'b1111; b = 4'b1111;
        verify_step(4'b1110, 1'b1);

        #10;
        if (pass_count == 5) begin
            $display("LAB1_PASS adder_4bit cases=5");
        end else begin
            $display("LAB1_FAIL adder_4bit passed %0d/5", pass_count);
        end
        $finish;
    end

endmodule