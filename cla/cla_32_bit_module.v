module cla_32_bit_module(
    Cin,
    P,
    G,
    C);

    input Cin;
    input [7:0] P, G;
    output reg [7:0] C;

    always @ * begin
        C[0] <= (G[0] | P[0] & Cin);
        C[1] <= (G[1] | P[1] & C[0]);
        C[2] <= (G[2] | P[2] & C[1]);
        C[3] <= (G[3] | P[3] & C[2]);
        C[4] <= (G[4] | P[4] & C[3]);
        C[5] <= (G[5] | P[5] & C[4]);
        C[6] <= (G[6] | P[6] & C[5]);
        C[7] <= (G[7] | P[7] & C[6]);
    end

endmodule
