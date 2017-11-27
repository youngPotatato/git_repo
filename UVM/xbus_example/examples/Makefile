##DIR := ../sv
##all: clean comp run
##
##clean:
##	rm -rf simv* csrc *.log vc_hdrs.h ucli.key
##
##comp:
##	if [ -d $(DIR) ]; then \
##	(vcs -sverilog -timescale=1ns/1ns -ntb_opts uvm-1.1 +incdir+$(DIR) xbus_tb_top.sv -l comp.log); \
##	else \
##	echo "copy the sv directory from ../sv"; \
##	fi	
##
##run:
##	simv  +UVM_NO_RELNOTES   +UVM_TESTNAME=test_read_modify_write -l run.log 

TEST = /usr/bin/test
N_ERRS = 0
N_FATALS = 0
ENV_DIR := ../sv

UVM_VERBOSITY = UVM_LOW
FILES =  ../sv/xbus.svh ./test_lib.sv xbus_tb_top.sv dut_dummy.v ../sv/xbus_if.sv
##	 hdl/LookupTable.sv hdl/squat.sv hdl/utopia1_atm_rx.sv hdl/utopia1_atm_tx.sv
##IFILES = env/package.sv ##\
##	 env/generator.sv  env/driver.sv env/monitor.sv env/scoreboard.sv env/coverage.sv \
##	 env/cpu_driver.sv ## env/definitions.sv 
FLAGS = -sverilog -timescale=1ns/1ns -debug_all +incdir+env+$(ENV_DIR)
RUN_FLAGS = +ntb_solver_mode=1 -cm line+tgl +UVM_NO_RELNOTES +UVM_TESTNAME=test_read_modify_write
VERDI_FLAGS = +v2k -sverilog +incdir+env+$(ENV_DIR)+$(UVM_HOME)/src $(UVM_HOME)/src/uvm.sv +systemverilogext+sv +verdilog2001ext+v

test: 	clean comp run 

comp: 	${FILES}	 
	@echo "Running debug test"
	vcs  +acc -lca +vpi -debug_access+all \
	-rdynamic \
	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
	+incdir+$(UVM_HOME)/src $(UVM_HOME)/src/uvm.sv \
	$(UVM_HOME)/src/dpi/uvm_dpi.cc -CFLAGS -DVCS \
	${FLAGS} ${FILES} -l comp.log -o simv

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
	verdi $(VERDI_FLAGS) ${FILES} -ssf test.fsdb

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

