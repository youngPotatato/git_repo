  class my_test extends uvm_test;
  
    `uvm_component_utils(my_test)
    
     my_dut_config dut_config_0;
     my_dut_config dut_config_1;//for golden reference model
    
     my_env my_env_h;   
   
     function new(string name, uvm_component parent);
	super.new(name, parent);
     endfunction: new
    
     function void build_phase(uvm_phase phase);
	dut_config_0 = new();
	dut_config_1 = new();

	if(
		(
			!uvm_config_db #(vdut_if)::get( this, "", "dut_vi", dut_config_0.dut_vi)
		)
		||
		(
			!uvm_config_db #(vdut_if)::get( this, "", "dut_vi2", dut_config_1.dut_vi)
		)
	)
          `uvm_fatal("NOVIF", "No virtual interface set")
	// other DUT configuration settings
	uvm_config_db #(my_dut_config)::set(this, "my_env_h.my_agent_h.my_driver_h", "dut_config", 
					    dut_config_0);
	uvm_config_db #(my_dut_config)::set(this, "my_env_h.my_agent2_h.my_driver_h", "dut_config", 
					    dut_config_1);
	uvm_config_db #(my_dut_config)::set(this, "my_env_h.my_agent_h.my_monitor_h", "dut_config", 
					    dut_config_0);
	uvm_config_db #(my_dut_config)::set(this, "my_env_h.my_agent2_h.my_monitor_h", "dut_config", 
					    dut_config_1);
	uvm_config_db #(my_dut_config)::set(this, "my_env_h.my_scoreboard_h", "dut_config", 
					    dut_config_0);
	my_env_h = my_env::type_id::create("my_env_h", this);
     endfunction: build_phase
     
  endclass // my_test

  class test1 extends my_test;
   `uvm_component_utils(test1)
    my_random_sequence1 seq;
    my_random_sequence1 seq2;

     function new(string name, uvm_component parent);
	super.new(name, parent);
     endfunction: new
     function void build_phase(uvm_phase phase);
	     super.build_phase(phase);
	     seq = my_random_sequence1::type_id::create("seq");
	     seq2 = my_random_sequence1::type_id::create("seq2");
	     assert(seq.randomize());
     $display("SEQ1 INFO (@%0t: seq2 t_num = %0d size = %0d) ",$time,seq.t_num,seq.size);
	     //dut_config_0.num_of_trans = 1;
	     dut_config_0.num_of_trans =  seq.size;
     $display("SEQ2 INFO (@%0t: seq2 t_num = %0d size = %0d) ",$time,seq2.t_num,seq2.size);
	     $display("[TEST1 BUILD] num trans is %0d",dut_config_0.num_of_trans);
     endfunction: build_phase
    
     task run_phase(uvm_phase phase);
`uvm_info("YY DEBUG INFO",$sformatf("@%0t: raise objection",$time),UVM_MEDIUM);
	phase.raise_objection(this);
	seq2.copy(seq);
	fork
		seq.start(my_env_h.my_agent_h.my_sequencer_h);
		seq2.start(my_env_h.my_agent2_h.my_sequencer_h);
	join
	phase.drop_objection(this);
	`uvm_info("YY DEBUG INFO",$sformatf("@%0t: drop objection",$time),UVM_MEDIUM);
     endtask // run_phase
  endclass: test1
//   
//  class test2 extends my_test;
//     `uvm_component_utils(test2)
//	
//     function new(string name, uvm_component parent);
//	super.new(name, parent);
//     endfunction: new
//    
//     task run_phase(uvm_phase phase);
//	seq_of_commands seq;
//	seq = seq_of_commands::type_id::create("seq");
//	assert( seq.randomize() );
//	phase.raise_objection(this);
//	seq.start( my_env_h.my_agent_h.my_sequencer_h );
//	phase.drop_objection(this);
//     endtask: run_phase
//     
//  endclass: test2
//   
//  class test3 extends my_test;
//     `uvm_component_utils(test3)
//	
//     function new(string name, uvm_component parent);
//	super.new(name, parent);
//     endfunction: new
//    
//     task run_phase(uvm_phase phase);
//	seq_of_commands seq;
//	seq = seq_of_commands::type_id::create("seq");
//	seq.how_many.constraint_mode(0);
//	assert( seq.randomize() with {seq.n > 10 && seq.n < 20;});
//	phase.raise_objection(this);
//	seq.start( my_env_h.my_agent_h.my_sequencer_h );
//	phase.drop_objection(this);
//     endtask: run_phase
//     
//  endclass: test3
//
