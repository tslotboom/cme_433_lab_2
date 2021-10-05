`timescale 1 ns / 1 ps
module cla_1_bit_testbench;
    reg [2:0] input_vector = 3'b0;
    wire S, P, G;
    cla_1_bit_adder adder(input_vector[0],
                        input_vector[1],
                        input_vector[2],
                        S,
                        P,
                        G);
    always begin
        #10;
        input_vector = input_vector + 1;
    end
    initial #100 $stop;
endmodule
