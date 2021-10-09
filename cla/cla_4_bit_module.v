module cla_4_bit_module(
    Cin,
    P,
    G,
    C);

    input Cin;
    input [3:0] P, G;
    output reg [3:0] C;

    always @ * begin
        C[0] <= (G[0] | P[0] & Cin);
        C[1] <= (G[1] | P[1] & C[0]);
        C[2] <= (G[2] | P[2] & C[1]);
        C[3] <= (G[3] | P[3] & C[2]);
    end

endmodule
