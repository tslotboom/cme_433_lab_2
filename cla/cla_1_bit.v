module cla_1_bit(
			A,
			B,
            Cin,
			S,
            P,
            G);

    input A, B, Cin;
    output S, P, G;

    assign P = A ^ B;
    assign G = A & B;
    assign S = A ^ B ^ Cin;

endmodule
