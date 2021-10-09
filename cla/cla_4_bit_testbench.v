`timescale 1 ns / 1 ps
module cla_4_bit_testbench;
    reg [8:0] input_vector = 8'b0;
    wire [3:0] A, B;
    wire Cin;
    wire [3:0] S;
    wire P, G;
    wire Cout;

    reg S_check, Cout_check;

    assign A = input_vector[3:0];
    assign B = input_vector[7:4];
    assign Cin = input_vector[8];
    cla_4_bit_adder adder(A,
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
        #1
        S_check = (A + B + Cin) == S;
        Cout_check = ((S < A) || (S < B) || (A == 4'hF && B == 4'hF && Cin == 1'b1)) == Cout;
    end
endmodule
