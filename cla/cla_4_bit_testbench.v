`timescale 1 ns / 1 ps
module cla_4_bit_testbench;
    reg [8:0] input_vector = 8'b0;
    wire [3:0] A, B;
    wire Cin;
    wire [3:0] S, P, G;
    wire Cout;

    reg S_check, P_check, G_check, Cout_check;

    assign A = input_vector[3:0];
    assign B = input_vector[7:4];
    assign Cin = input_vector[8];
    cla_4_bit adder(A,
            B,
            Cin,
            S,
            P,
            G,
            Cout);
    always begin
        #10;
        input_vector = input_vector + 1;
    end
    initial #10000 $stop;
    always @ * begin
        #0
        S_check = (A + B + Cin) == S;
        P_check = (A ^ B) == P;
        G_check = (A & B) == G;
        Cout_check = (G[3] | P[3] & G[2] | P[3] & P[2] & G[1] |
        P[3] & P[2] & P[1] & G[0] | P[3] & P[2] & P[1] & P[0] & Cin) == Cout;

    end
endmodule
