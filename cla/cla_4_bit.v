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
    reg [4:0] C;
    output [3:0] S, P, G;
    output Cout;

    always @ (*)
        C[0] = Cin;

    integer j;
    always @ (*) begin
        for (j = 0; j < 4; j = j + 1) begin : jate
            C[j + 1] = G[j] | P[j] & C[j];
            end
    end

    generate
        genvar i;
        for (i = 0; i < 4; i = i + 1) begin : nate
            cla_1_bit c (A[i], B[i], C[i], S[i], P[i], G[i]);
            end
    endgenerate

    assign Cout = C[4];

endmodule
