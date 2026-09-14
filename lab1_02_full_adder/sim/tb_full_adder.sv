`timescale 1ns / 1ps

module tb_full_adder;
    logic a, b, cin;
    logic s, cout;
    int err_cnt = 0;

    full_adder uut (
        .a(a), .b(b), .cin(cin),
        .s(s), .cout(cout)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_full_adder);

        for (int i = 0; i < 8; i++) begin
            {a, b, cin} = i[2:0];
            #10;
            if ({cout, s} !== (a + b + cin)) begin
                $display("ERROR at a=%b, b=%b, cin=%b", a, b, cin);
                err_cnt++;
            end
        end

        if (err_cnt == 0) begin
            $display("LAB1_PASS full_adder cases=8");
        end
        $finish;
    end
endmodule