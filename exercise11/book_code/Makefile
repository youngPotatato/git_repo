FILES =  hdl/definitions.sv hdl/atm_cell.sv hdl/top.sv hdl/utopia.sv hdl/cpu_ifc.sv \
	 hdl/LookupTable.sv hdl/squat.sv hdl/utopia1_atm_rx.sv hdl/utopia1_atm_tx.sv
IFILES = env/environment.sv env/config.sv \
	 env/generator.sv   env/cbs.sv env/driver.sv env/monitor.sv env/scoreboard.sv env/coverage.sv \
	 env/cpu_driver.sv ## env/definitions.sv 
FLAGS = -sverilog -debug_all +incdir+env+env
RUN_FLAGS = +ntb_solver_mode=1 -cm line+tgl 

test: 	clean comp run 

comp: 	tests/test.sv ${FILES} ${IFILES}	
	@echo "Running debug test"
	vcs  +acc -lca +vpi -debug_access+all \
	-rdynamic \
	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
	${FLAGS} ${FILES} tests/test.sv -l comp.log -o simv
##
##comp01:	tests/test_01_directed.sv ${FILES} ${IFILES}
##	@echo "Running directed test"
##	vcs  +acc -lca +vpi -debug_access+all \
##	-rdynamic \
##	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
##	${FLAGS} ${FILES} tests/test_01_directed.sv -l comp1.log -o simv
##
##comp02: 	tests/test_02_constrained.sv ${FILES} ${IFILES}
##	@echo "Running constrained test"
##	vcs  +acc -lca +vpi -debug_access+all \
##	-rdynamic \
##	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
##	${FLAGS} ${FILES} tests/test_02_constrained.sv -l comp2.log -o simv
##
##comp03:	tests/test_03_cvr_driven.sv ${FILES} ${IFILES}
##	@echo "Running coverage driven test"
##	vcs  +acc -lca +vpi -debug_access+all \
##	-rdynamic \
##	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
##	${FLAGS} ${FILES} tests/test_03_cvr_driven.sv -l comp3.log -o simv

run:
	./simv +fsdbfile+test.fsdb \
	${RUN_FLAGS} \
	+ntb_random_seed=$(SEED) \
	-l run.log

##all:	debug directed constrained cvr_driven

report:
	urg -lca -dir simv.vdb -show text

view:
	verdi +v2k -sverilog +incdir+env+env +systemverilogext+sv +verdilog2001ext+v ${FILES} tests/test.sv -ssf test.fsdb

##view01:
##	verdi +v2k -sverilog +incdir+env+env +systemverilogext+sv +verdilog2001ext+v ${FILES} tests/test_01_directed.sv -ssf test.fsdb
##
##view02:
##	verdi +v2k -sverilog +incdir+env+env +systemverilogext+sv +verdilog2001ext+v ${FILES} tests/test_02_constrained.sv -ssf test.fsdb
##
##view03:
##	verdi +v2k -sverilog +incdir+env+env +systemverilogext+sv +verdilog2001ext+v ${FILES} tests/test_03_cvr_driven.sv -ssf test.fsdb

DIR = $(shell basename `pwd`)
tar:	clean
	cd ..;tar cvfz ${DIR}.tgz ${DIR}
	@ls -l ../${DIR}.tgz

clean:
	@rm -rf verdiLog csrc simv* *.tcl *.vpd .res* ucli* .ucli* *.old *.txt *.db 
	@rm -rf *.log *~ */*~ .*/*~ .*/*/*~

