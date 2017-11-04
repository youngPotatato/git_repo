module top; 
	import uvm_pkg::*;
	import my_pkg::*;
	dut_if dut_if1();
	dut (._if(dut_if1));

	initial begin
		run_test("my_test");
	end
	initial begin
		$fsdbDumpfile("test.fsdb");
		$fsdbDumpvars("+all");
	end
endmodule:top
