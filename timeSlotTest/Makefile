
all:	clean test

test: comp run

clean:
	\rm -rf simv* csrc* *.log
comp:
	vcs  +acc -lca +vpi -debug_access+all \
	-rdynamic \
	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
	-f 1.f -sverilog -l comp1.log -o simv
run:
	./simv +fsdbfile+test.fsdb -l run1.log
view:
	verdi +v2k -sverilog +systemverilogext+sv _verdilog2001ext+v -f 1.f 
