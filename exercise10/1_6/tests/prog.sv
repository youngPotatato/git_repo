program automatic test(risc_spm_if risc_bus);
	import my_package::*;
	Environment env;
	initial begin
		env= new(agt2drv,risc_bus);
	end
endprogram
