TEST = /usr/bin/test
N_ERRS = 0
N_FATALS = 0

UVM_VERBOSITY = UVM_LOW
FILES = 
##FILES =  hdl/definitions.sv hdl/atm_cell.sv hdl/top.sv hdl/utopia.sv hdl/cpu_ifc.sv \
##	 hdl/LookupTable.sv hdl/squat.sv hdl/utopia1_atm_rx.sv hdl/utopia1_atm_tx.sv
IFILES =
##IFILES = env/environment.sv env/config.sv \
##	 env/generator.sv  env/driver.sv env/monitor.sv env/scoreboard.sv env/coverage.sv \
##	 env/cpu_driver.sv ## env/definitions.sv 
FLAGS = -sverilog -debug_all +incdir+env+env
RUN_FLAGS = +ntb_solver_mode=1 -cm line+tgl 

test: 	clean comp run 

comp: 	tests/test.sv ${FILES} ${IFILES}	
	@echo "Running debug test"
	vcs  +acc -lca +vpi -debug_access+all \
	-rdynamic \
	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
	+incdir+$(UVM_HOME)/src $(UVM_HOME)/src/uvm.sv \
	$(UVM_HOME)/src/dpi/uvm_dpi.cc -CFLAGS -DVCS \
	${FLAGS} ${FILES} tests/test.sv -l comp.log -o simv

run:
	./simv +fsdbfile+test.fsdb \
	${RUN_FLAGS} \
	+ntb_random_seed=$(SEED) \
	+UVM_VERBOSITY=$(UVM_VERBOSITY) \
	+UVM_VERDI_TRACE="UVM_AWARE+RAL+TLM+MSG+HIER+PRINT" \
	+UVM_VERDI_TRACE +UVM_TR_RECORD +UVM_LOG_RECORD \
	-l run.log

report:
	urg -lca -dir simv.vdb -show text

view:
	verdi +v2k -sverilog +incdir+env+env+$(UVM_HOME)/src $(UVM_HOME)/src/uvm.sv +systemverilogext+sv +verdilog2001ext+v ${FILES} tests/test.sv -ssf test.fsdb

CHECK = \
	@$(TEST) \( `grep -c 'UVM_ERROR :    $(N_ERRS)' run.log` -eq 1 \) -a \
		 \( `grep -c 'UVM_FATAL :    $(N_FATALS)' run.log` -eq 1 \)
DIR = $(shell basename `pwd`)

tar:	clean
	cd ..;tar cvfz ${DIR}.tgz ${DIR}
	@ls -l ../${DIR}.tgz

clean:
	@rm -rf verdiLog urgReport csrc simv* *.tcl *.vpd .res* ucli* .ucli* *.old *.txt *.db *.fsdb 
	@rm -rf *.log *~ */*~ .*/*~ .*/*/*~

