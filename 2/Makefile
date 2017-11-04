
all:	clean test1 test2 test3

test1: comp1 run1

test2: comp2 run2

test3: comp3 run3

clean:
	\rm -rf simv* csrc* *.log
comp1:
	vcs  +acc -lca +vpi -debug_access+all \
	-rdynamic \
	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
	-f run1.f -sverilog -l comp1.log -o simv1
comp2:
	vcs  +acc -lca +vpi -debug_access+all \
	-rdynamic \
	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
	-f run2.f -sverilog -l comp2.log -o simv2
comp3:
	vcs  +acc -lca +vpi -debug_access+all \
	-rdynamic \
	-LDFLAGS"-wl,--rpth,$(VERDI_HOME)/share/PLI/VCS/LINUX" \
	-f run3.f -sverilog -l comp3.log -o simv3
run1:
	./simv1 +fsdbfile+test1.fsdb -l run1.log
run2:
	./simv2 +fsdbfile+test2.fsdb -l run2.log
run3:
	./simv3 +fsdbfile+test3.fsdb -l run3.log
view1:
	verdi +v2k -sverilog +systemverilogext+sv _verdilog2001ext+v -f run1.f 
