module cla_32_bit(
            A,
            B,
            Cin,
            S_reg,
            P_reg,
            G_reg,
            Cout_reg,
            clk);
    input clk;
    input [31:0] A, B;
    input Cin;
    reg [8:0] C;
    wire [31:0] S, P, G;
    wire Cout;

    reg [31:0] A_reg, B_reg;
	reg Cin_reg;
	output reg [31:0] S_reg, P_reg, G_reg;
	output reg Cout_reg;

    // registers
    always @ (posedge clk) begin
        A_reg <= A;
        B_reg <= B;
        Cin_reg <= Cin;
        S_reg <= S;
        P_reg <= P;
        G_reg <= G;
        Cout_reg <= Cout;
    end

    assign C[0] = Cin_reg;

    integer j;
    always @ (*) begin
        for (j = 0; j < 8; j = j + 1) begin : jate
            C[j + 1] = G[j * 4] | P[j * 4] & C[j];
            end
    end

    generate
        genvar i;
        for (i = 0; i < 8; i = i + 1) begin : nate
            cla_4_bit c (A_reg[(i + 1) * 4 - 1:i * 4],
                        B_reg[(i + 1) * 4 - 1:i * 4],
                        C[i],
                        S[(i + 1) * 4 - 1:i * 4],
                        P[(i + 1) * 4 - 1:i * 4],
                        G[(i + 1) * 4 - 1:i * 4]);
            end
    endgenerate
    assign Cout = C[8];

endmodule
