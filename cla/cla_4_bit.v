module cla_4_bit(
    A,
    B,
    Cin,
    S,
    P,
    G,
    Cout);

    input [3:0] A, B;
    input Cin;
    wire [4:0] C;
    output [3:0] S, P, G;
    output Cout;

    assign C[0] = Cin;

    generate
        genvar j;
        for (j = 1; j < 4; j = j + 1) begin : jate
            assign C[j] = G[j - 1] | P[j - 1] & C[j - 1];
            end
    endgenerate

    generate
        genvar i;
        for (i = 0; i < 4; i = i + 1) begin : nate
            cla_1_bit c (A[i], B[i], C[i], S[i], P[i], G[i]);
            end
    endgenerate

    assign Cout = C[4];

endmodule
