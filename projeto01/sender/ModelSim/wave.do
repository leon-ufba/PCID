onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/clk
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/Reset
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/data
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/write
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/start
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/state
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/next_state
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/counter
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/next_counter
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/Transmit
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/Ready
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/sdrDataIn
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/memDataIn
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/memDataOut
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/Address
add wave -noupdate /sender_ic_tb/sdr_ic/b2v_inst/WriteEnable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {115 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 275
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {37 ps}
