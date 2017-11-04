
all:	clean comp run
clean:
	\rm -rf simv* csrc* *.log
comp:
	vcs  +acc -lca +vpi -debug_access+all \
	-rdynamic \
	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
	-sverilog example_assoc_array.v -l comp.log 
run:
	./simv +fsdbfile+test.fsdb -l run.log
view:
	verdi +v2k -sverilog +systemverilogext+sv _verdilog2001ext+v \example_assoc_array.v
