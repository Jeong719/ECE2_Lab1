`timescale 1ns / 1ps

module tb_demux_1to8;
    logic       din;
    logic [2:0] sel;
    logic [7:0] y;
    int err_cnt = 0;

    demux_1to8 uut (
        .din(din),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_demux_1to8);

        for (int i = 0; i < 16; i++) begin
            {din, sel} = i[3:0];
            #10;
            if (din == 1'b0) begin
                if (y !== 8'b00000000) err_cnt++;
            end else begin
                if (y !== (8'b00000001 << sel)) err_cnt++;
            end
        end

        if (err_cnt == 0) begin
            $display("LAB1_PASS demux_1to8 cases=16");
        end
        $finish;
    end
endmodule