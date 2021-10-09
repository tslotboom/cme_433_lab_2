`timescale 1 ns / 1 ps
module cla_32_bit_testbench;
    wire clk, slow_clk;
    clock clk_(clk);
    slow_clock slow_clk_(slow_clk);

    reg [31:0] A, B;
    reg Cin;
    wire [31:0] S;
    wire Cout;

    reg S_check, Cout_check;

    cla_32_bit_adder adder(A,
            B,
            Cin,
            S,
            Cout,
            clk);

    always @(posedge slow_clk) begin
        A = $random;
        B = $random;
        Cin = $random;
    end

    always @(posedge slow_clk) begin
        @(posedge clk)
        @(posedge clk)
        #1;
        S_check = (A + B + Cin) == S;
        Cout_check = ((S < A) || (S < B)) == Cout;
    end

    initial #200000 $stop;
endmodule
