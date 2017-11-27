  class my_dut_config extends uvm_object;
     `uvm_object_utils(my_dut_config)

     function new(string name = "");
	     super.new(name);
     endfunction
     // optionally add other config fields as needed
     
     vdut_if dut_vi;// 
     //vdut_rif dut_rvi;//for monitoring tr sent to dut 
     int num_of_trans;
     //int t_num;// total transaction number of stimulus to dut, excluding NOP
  endclass:my_dut_config // my_dut_config

