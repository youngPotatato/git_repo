  class my_dut_config extends uvm_object;
     `uvm_object_utils(my_dut_config)

     function new(string name = "");
	     super.new(name);
     endfunction
     // optionally add other config fields as needed
     
     vdut_if dut_vi;//for dut
     //vdut_if dut_vi2;//for golden reference model
     int num_of_trans;
  endclass:my_dut_config // my_dut_config

