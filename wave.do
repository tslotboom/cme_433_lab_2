onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /cla_32_bit_testbench/clk
add wave -noupdate -radix hexadecimal /cla_32_bit_testbench/slow_clk
add wave -noupdate -radix hexadecimal /cla_32_bit_testbench/A
add wave -noupdate -radix hexadecimal /cla_32_bit_testbench/B
add wave -noupdate -radix hexadecimal /cla_32_bit_testbench/Cin
add wave -noupdate -radix hexadecimal /cla_32_bit_testbench/S
add wave -noupdate -radix hexadecimal /cla_32_bit_testbench/Cout
add wave -noupdate -color Orange /cla_32_bit_testbench/S_check
add wave -noupdate -color Orange /cla_32_bit_testbench/Cout_check
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {210 us}
