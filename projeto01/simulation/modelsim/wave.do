onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/clk
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/Reset
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/data
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/write
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/start
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/Ack
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/Request
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/sdrDataOut
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/state
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/next_state
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/counter
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/next_counter
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/Transmit
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/Ready
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/sdrDataIn
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/memDataIn
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/memDataOut
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/Address
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/ReadEnable
add wave -noupdate -expand -group Sender_Control -radix hexadecimal /sender_control_tb/sc/WriteEnable
add wave -noupdate -expand -group Sender -radix hexadecimal /sender_control_tb/sc/sdr/clk
add wave -noupdate -expand -group Sender -radix hexadecimal /sender_control_tb/sc/sdr/Reset
add wave -noupdate -expand -group Sender -radix hexadecimal /sender_control_tb/sc/sdr/Transmit
add wave -noupdate -expand -group Sender -radix hexadecimal /sender_control_tb/sc/sdr/DataIn
add wave -noupdate -expand -group Sender -radix hexadecimal /sender_control_tb/sc/sdr/Ack
add wave -noupdate -expand -group Sender -radix hexadecimal /sender_control_tb/sc/sdr/Ready
add wave -noupdate -expand -group Sender -radix hexadecimal /sender_control_tb/sc/sdr/Request
add wave -noupdate -expand -group Sender -radix hexadecimal /sender_control_tb/sc/sdr/DataOut
add wave -noupdate -expand -group Sender -radix hexadecimal /sender_control_tb/sc/sdr/state
add wave -noupdate -expand -group Sender -radix hexadecimal /sender_control_tb/sc/sdr/next_state
add wave -noupdate -expand -group Sender -radix hexadecimal /sender_control_tb/sc/sdr/counter
add wave -noupdate -expand -group Sender -radix hexadecimal /sender_control_tb/sc/sdr/next_counter
add wave -noupdate -expand -group Sender_Memory -radix hexadecimal /sender_control_tb/sc/smem/clk
add wave -noupdate -expand -group Sender_Memory -radix hexadecimal /sender_control_tb/sc/smem/ReadEnable
add wave -noupdate -expand -group Sender_Memory -radix hexadecimal /sender_control_tb/sc/smem/WriteEnable
add wave -noupdate -expand -group Sender_Memory -radix hexadecimal /sender_control_tb/sc/smem/Address
add wave -noupdate -expand -group Sender_Memory -radix hexadecimal /sender_control_tb/sc/smem/DataIn
add wave -noupdate -expand -group Sender_Memory -radix hexadecimal /sender_control_tb/sc/smem/DataOut
add wave -noupdate -expand -group Sender_Memory -radix hexadecimal /sender_control_tb/sc/smem/mem
add wave -noupdate -expand -group Sender_Memory -radix hexadecimal /sender_control_tb/sc/smem/state
add wave -noupdate -expand -group Sender_Memory -radix hexadecimal /sender_control_tb/sc/smem/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 273
configure wave -valuecolwidth 38
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
WaveRestoreZoom {0 ps} {300 ps}
