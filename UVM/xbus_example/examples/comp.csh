#!/bin/csh -f

set DIR = "../sv";
if ( -d $DIR ) then
vcs -sverilog -timescale=1ns/1ns -ntb_opts uvm-1.1 +incdir+$DIR xbus_tb_top.sv -l comp.log;
else
echo "copy the sv directory from ../sv";
endif
