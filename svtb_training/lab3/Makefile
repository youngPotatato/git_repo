FILES = hdl/root.v hdl/top.sv hdl/mem.v apb_env/apb_if.sv
IFILES = env/scoreboard.sv env/env.sv apb_env/apb_gen.sv \
	apb_env/apb_master.sv apb_env/apb_monitor.sv apb_env/apb_trans.sv
FLAGS = -sverilog -debug_all +incdir+env+apb_env+env

all:	clean test

test: comp run

DIR = $(shell basename `pwd`)
tar:	clean
	cd ..;tar cvfz ${DIR}.tgz ${DIR}
	@ls -l ../${DIR}.tgz

clean:
	@rm -rf verdiLog csrc simv* *.tcl *.vpd .res* ucli* .ucli* *.old *.txt *.db 
	@rm -rf *.log *~ */*~ .*/*~ .*/*/*~
	
comp:  	tests/test.sv ${FILES} ${IFILES}
	vcs  +acc -lca +vpi -debug_access+all \
	-rdynamic \
	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
	${FLAGS} ${FILES} tests/test.sv -l comp1.log -o simv
run:
	./simv +fsdbfile+test.fsdb \
	+ntb_random_seed=$(SEED) \
	-l run1.log
view:
	verdi +v2k -sverilog +incdir+env+apb_env+env +systemverilogext+sv +verdilog2001ext+v ${FILES} tests/test.sv -ssf test.fsdb
report:
	urg -lca -dir simv.vdb -show text
