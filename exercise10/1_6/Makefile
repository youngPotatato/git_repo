FILES = hdl/root.v hdl/top.v hdl/mem.v apb_env/apb_if.sv
IFILES = env/scoreboard.sv env/env.sv apb_env/apb_gen.sv \
	apb_env/apb_master.sv apb_env/apb_monitor.sv apb_env/apb_trans.sv
FLAGS = -sverilog -debug_all +incdir+env+apb_env+env


comp00: 	tests/test_00_debug.sv ${FILES} ${IFILES}	
	@echo "Running debug test"
	vcs  +acc -lca +vpi -debug_access+all \
	-rdynamic \
	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
	${FLAGS} ${FILES} tests/test_00_debug.sv -l comp0.log -o simv

comp01:	tests/test_01_directed.sv ${FILES} ${IFILES}
	@echo "Running directed test"
	vcs  +acc -lca +vpi -debug_access+all \
	-rdynamic \
	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
	${FLAGS} ${FILES} tests/test_01_directed.sv -l comp1.log -o simv

comp02: 	tests/test_02_constrained.sv ${FILES} ${IFILES}
	@echo "Running constrained test"
	vcs  +acc -lca +vpi -debug_access+all \
	-rdynamic \
	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
	${FLAGS} ${FILES} tests/test_02_constrained.sv -l comp2.log -o simv

comp03:	tests/test_03_cvr_driven.sv ${FILES} ${IFILES}
	@echo "Running coverage driven test"
	vcs  +acc -lca +vpi -debug_access+all \
	-rdynamic \
	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
	${FLAGS} ${FILES} tests/test_03_cvr_driven.sv -l comp3.log -o simv

run:
	./simv +fsdbfile+test.fsdb \
	+ntb_random_seed=$(SEED) \
	-l run.log

##all:	debug directed constrained cvr_driven

report:
	urg -lca -dir simv.vdb -show text

view00:
	verdi +v2k -sverilog +incdir+env+apb_env+env +systemverilogext+sv +verdilog2001ext+v ${FILES} tests/test_00_debug.sv -ssf test.fsdb

view01:
	verdi +v2k -sverilog +incdir+env+apb_env+env +systemverilogext+sv +verdilog2001ext+v ${FILES} tests/test_01_directed.sv -ssf test.fsdb

view02:
	verdi +v2k -sverilog +incdir+env+apb_env+env +systemverilogext+sv +verdilog2001ext+v ${FILES} tests/test_02_constrained.sv -ssf test.fsdb

view03:
	verdi +v2k -sverilog +incdir+env+apb_env+env +systemverilogext+sv +verdilog2001ext+v ${FILES} tests/test_03_cvr_driven.sv -ssf test.fsdb

DIR = $(shell basename `pwd`)
tar:	clean
	cd ..;tar cvfz ${DIR}.tgz ${DIR}
	@ls -l ../${DIR}.tgz

clean:
	@rm -rf verdiLog csrc simv* *.tcl *.vpd .res* ucli* .ucli* *.old *.txt *.db 
	@rm -rf *.log *~ */*~ .*/*~ .*/*/*~

