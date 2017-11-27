module top; 
	import uvm_pkg::*;
	import my_pkg::*;
	dut_if dut_if1();
	dut (._if(dut_if1));

	initial begin
				//data_base type   prefix  path            field name  value(pointer)
		uvm_config_db #(virtual dut_if)::set(null,"uvm_test_top","dut_vi",dut_if1);
		//run_test will creat a instance of my_test class
		run_test("my_test");
	end
	initial begin
		$fsdbDumpfile("test.fsdb");
		$fsdbDumpvars("+all");
	end
endmodule:top
