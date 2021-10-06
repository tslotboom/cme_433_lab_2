module cla_16_bit(
    A,
    B,
    Cin,
    S,
    P,
    G,
    Cout);

    input [15:0] A, B;
    input Cin;
    reg [16:0] C;
    output [15:0] S, P, G;
    output Cout;

    always @ (*)
        C[0] = Cin;

    integer j;
    always @ (*) begin
        for (j = 0; j < 16; j = j + 1) begin : jate
            C[j + 1] = G[j] | P[j] & C[j];
            end
    end

    generate
        genvar i;
        for (i = 0; i < 4; i = i + 1) begin : nate
            cla_4_bit c (A[(i + 1) * 4 - 1:i * 4],
                        B[(i + 1) * 4 - 1:i * 4],
                        C[(i + 1) * 4 - 1:i * 4],
                        S[(i + 1) * 4 - 1:i * 4],
                        P[(i + 1) * 4 - 1:i * 4],
                        G[(i + 1) * 4 - 1:i * 4]);
            end
    endgenerate

    assign Cout = C[16];

endmodule
