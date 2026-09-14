`timescale 1ns / 1ps

module tb_comparator_4bit;
    logic [3:0] a, b;
    logic       lt, eq, gt;
    int err_cnt = 0;

    comparator_4bit uut (
        .a(a),
        .b(b),
        .lt(lt),
        .eq(eq),
        .gt(gt)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_comparator_4bit);

        for (int i = 0; i < 256; i++) begin
            {a, b} = i[7:0];
            #10;
            if (lt !== (a < b))  err_cnt++;
            if (eq !== (a == b)) err_cnt++;
            if (gt !== (a > b))  err_cnt++;
        end

        if (err_cnt == 0) begin
            $display("LAB1_PASS comparator_4bit cases=256");
        end
        $finish;
    end
endmodule