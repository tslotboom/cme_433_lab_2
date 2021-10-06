`timescale 1 ns / 1 ps
module clock(clk);

    output reg clk = 1'b1;

    always begin
        #1;
        clk = ~clk;
    end
endmodule
