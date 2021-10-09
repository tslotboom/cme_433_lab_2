module cla_4_bit_adder(
    A,
    B,
    Cin,
    S,
    Pout,
    Gout,
    Cout);

    input [3:0] A, B;
    input Cin;
    wire [3:0] C;
    output [3:0] S;
    wire [3:0] P, G;
    output reg Pout, Gout;
    output reg Cout;



    cla_4_bit_module cla(Cin, P, G, C);

    always @ (*)
    Cout = C[3];

    cla_1_bit c0 (A[0], B[0], Cin, S[0], P[0], G[0]);

    generate
        genvar i;
        for (i = 1; i < 4; i = i + 1) begin : nate
            cla_1_bit c (A[i], B[i], C[i - 1], S[i], P[i], G[i]);
            end
    endgenerate

    always @ *
        Pout = P[0] & P[1] & P[2] & P[3];

    always @ *
        Gout = G[3] | (G[2] & P[3]) | (G[1] & P[3] & P[2]) | (G[0] & P[3] & P[2] & P[1]);

endmodule
