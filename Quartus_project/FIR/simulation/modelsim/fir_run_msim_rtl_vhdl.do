transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/intelFPGA_lite/13.0sp1/projects/FIR/fir.vhd}

vcom -93 -work work {D:/intelFPGA_lite/13.0sp1/projects/FIR/testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 100 ms
