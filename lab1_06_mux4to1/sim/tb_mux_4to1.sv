`timescale 1ns / 1ps

module tb_mux_4to1;
    logic [3:0] d;
    logic [1:0] sel;
    logic       y;
    int err_cnt = 0;

    mux_4to1 uut (
        .d(d),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_mux_4to1);

        for (int i = 0; i < 64; i++) begin
            {d, sel} = i[5:0];
            #10;
            if (y !== d[sel]) err_cnt++;
        end

        if (err_cnt == 0) begin
            $display("LAB1_PASS mux_4to1 cases=64");
        end
        $finish;
    end
endmodule