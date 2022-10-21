transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Leon/Desktop/universidade/PCID/projetos/projeto01/sender {C:/Users/Leon/Desktop/universidade/PCID/projetos/projeto01/sender/sender_memory.v}
vlog -vlog01compat -work work +incdir+C:/Users/Leon/Desktop/universidade/PCID/projetos/projeto01/sender {C:/Users/Leon/Desktop/universidade/PCID/projetos/projeto01/sender/sender_control.v}
vlog -vlog01compat -work work +incdir+C:/Users/Leon/Desktop/universidade/PCID/projetos/projeto01/sender {C:/Users/Leon/Desktop/universidade/PCID/projetos/projeto01/sender/sender.v}

vlog -vlog01compat -work work +incdir+C:/Users/Leon/Desktop/universidade/PCID/projetos/projeto01/sender {C:/Users/Leon/Desktop/universidade/PCID/projetos/projeto01/sender/sender_control_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  sender_control_tb

add wave *
view structure
view signals
run 300 ps