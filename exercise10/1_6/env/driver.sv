typedef virtual risc_spm_if vIf;
class Driver;
	vIf vintf;
	vIf vintf;
	function new(input inst_mbox#(Instruction)agt2drv,input vIf vintf);
		this.agt2drv = agt2drv;
		this intf = intf;
	endfunction
endclass
class Environment;
	vIf vintf;
	Driver drv;
	mailbox
	function new(input inst_mbox#(Instruction)agt2drv,virtual risc_spm_if vintf);
		drv = new (agt2drv,vintf);
	endfunction
endclass
