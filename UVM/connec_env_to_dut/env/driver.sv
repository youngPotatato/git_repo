class my_driver extends uvm_driver;
	`uvm_component_utils(my_driver)

	virtual dut_if dut_vi;

	function new(string name, uvm_component parent);
		super.new(name,parent);
	endfunction:new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction:build_phase

	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		#10;
		dut_vi.data = 1;
		#10;
		dut_vi.data = 1;
		#10;
		phase.drop_objection(this);
	endtask:run_phase
endclass:my_driver