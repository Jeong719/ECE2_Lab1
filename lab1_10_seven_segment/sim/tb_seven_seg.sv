`timescale 1ns / 1ps

module tb_seven_seg;

    reg  [3:0] bcd;
    wire [7:0] seg_data;

    integer idx;
    integer pass_count = 0;
    reg [7:0] exp_seg;

    // DUT 인스턴스화
    seven_seg uut (
        .bcd(bcd),
        .seg_data(seg_data)
    );

    // 1. wave.vcd 파일 덤프
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_seven_seg);
    end

    // 2. 16개 BCD 케이스 검증
    initial begin
        for (idx = 0; idx < 16; idx = idx + 1) begin
            bcd = idx;

            case (idx)
                4'h0: exp_seg = 8'b1111_1100;
                4'h1: exp_seg = 8'b0110_0000;
                4'h2: exp_seg = 8'b1101_1010;
                4'h3: exp_seg = 8'b1111_0010;
                4'h4: exp_seg = 8'b0110_0110;
                4'h5: exp_seg = 8'b1011_0110;
                4'h6: exp_seg = 8'b1011_1110;
                4'h7: exp_seg = 8'b1110_0000;
                4'h8: exp_seg = 8'b1111_1110;
                4'h9: exp_seg = 8'b1111_0110;
                4'hA: exp_seg = 8'b1110_1110;
                4'hB: exp_seg = 8'b0011_1110;
                4'hC: exp_seg = 8'b1001_1100;
                4'hD: exp_seg = 8'b0111_1010;
                4'hE: exp_seg = 8'b1001_1110;
                4'hF: exp_seg = 8'b1000_1110;
                default: exp_seg = 8'b0000_0000;
            endcase

            #5; // 구간 중간값 체크 (5ns, 15ns, 35ns, 85ns, 155ns 등)
            if (seg_data === exp_seg) begin
                pass_count = pass_count + 1;
            end
            #5;
        end

        if (pass_count == 16) begin
            $display("LAB1_PASS seven_seg cases=16");
        end else begin
            $display("LAB1_FAIL seven_seg passed %0d/16", pass_count);
        end
        $finish;
    end

endmodule