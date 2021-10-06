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
    reg [32:0] C;
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

    always @ (*)
        C[0] = Cin_reg;

    integer j;
    always @ (*) begin
        for (j = 0; j < 32; j = j + 1) begin : jate
            C[j + 1] = G[j] | P[j] & C[j];
            end
    end

    generate
        genvar i;
        for (i = 0; i < 4; i = i + 1) begin : nate
            cla_16_bit c (A_reg[(i + 1) * 8 - 1:i * 8],
                        B_reg[(i + 1) * 8 - 1:i * 8],
                        C[(i + 1) * 8 - 1:i * 8],
                        S[(i + 1) * 8 - 1:i * 8],
                        P[(i + 1) * 8 - 1:i * 8],
                        G[(i + 1) * 8 - 1:i * 8]);
            end
    endgenerate
    assign Cout = C[32];

endmodule
