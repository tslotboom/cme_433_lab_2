`timescale 1 ns / 1 ps
module cla_16_bit_testbench;
    reg [15:0] A, B;
    reg Cin;
    wire [15:0] S, P, G;
    wire Cout;

    reg S_check, P_check, G_check, Cout_check;

    cla_16_bit adder(A,
            B,
            Cin,
            S,
            P,
            G,
            Cout);

    always begin
        #10;
        A = $random;
        B = $random;
        Cin = $random;
    end

    initial #100000 $stop;
    always @ * begin
        #0
        S_check = (A + B + Cin) == S;
        P_check = (A ^ B) == P;
        G_check = (A & B) == G;
        Cout_check = ((S < A) | (S < B)) == Cout;

    end
endmodule
