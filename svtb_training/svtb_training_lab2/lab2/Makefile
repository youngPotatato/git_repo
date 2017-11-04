FILES = hdl/root.v hdl/top.v hdl/mem.v apb_env/apb_if.sv
IFILES =  apb_env/apb_gen.sv apb_env/apb_master.sv apb_env/apb_trans.sv
FLAGS = -sverilog -debug_all +incdir+apb_env

all:	clean test

test: comp run

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
	verdi +v2k -sverilog +systemverilogext+sv _verdilog2001ext+v -f 1.f -ssf test.fsdb
