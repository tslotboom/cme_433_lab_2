`timescale 1 ns / 1 ps
module slow_clock(slow_clk);

    output reg slow_clk = 1'b1;

    always begin
        #10;
        slow_clk = ~slow_clk;
    end
endmodule
