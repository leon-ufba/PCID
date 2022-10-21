onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst/clk
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst/Reset
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst/Ack
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst/Ready
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst/rcvDataOut
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst/state
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst/next_state
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst/counter
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst/next_counter
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst/memDataIn
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst/Address
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst/WriteEnable
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst3/address
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst3/clock
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst3/data
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst3/wren
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst3/q
add wave -noupdate /receiver_ic_tb/rec_ic/b2v_inst3/sub_wire0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {107 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 271
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
WaveRestoreZoom {98 ps} {136 ps}
