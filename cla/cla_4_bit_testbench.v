`timescale 1 ns / 1 ps
module cla_4_bit_testbench;
    reg [8:0] input_vector = 3'b0;
    wire [3:0] S, P, G;
    wire Cout;
    cla_4_bit adder(input_vector[3:0],
            input_vector[7:4],
            input_vector[8],
            S,
            P,
            G,
            Cout);
    always begin
        #10;
        input_vector = input_vector + 1;
    end
    initial #1000 $stop;
endmodule
