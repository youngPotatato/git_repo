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
		//||
		//(
		//	!uvm_config_db #(vdut_rif)::get( this, "", "dut_rvi", dut_config_0.dut_rvi)
		//)
		//||
		//(
		//	!uvm_config_db #(vdut_rif)::get( this, "", "dut_rvi2", dut_config_1.dut_rvi)
		//)
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
     string switch;//turn on(1)/off(0) transaction type constraint type_c1-- only push
     int switch1;//turn on(1)/off(0) transaction type constraint type_c1-- only push
     int switch2;//turn on(1)/off(0) transaction type constraint type_c1-- only pop 
     int switch3;//turn on(1)/off(0) transaction type constraint type_c1-- only pop:push:push_pop = 10:1:1
     uvm_cmdline_processor cmdline_processor;
     function new(string name, uvm_component parent);
	super.new(name, parent);
    	cmdline_processor = uvm_cmdline_processor::get_inst();
	cmdline_processor.get_arg_value("+SW=",switch);
     endfunction: new

     function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	seq = my_random_sequence1::type_id::create("seq");
	seq2 = my_random_sequence1::type_id::create("seq2");
	switch1 = 0;
	switch2 = 0;
	switch3 = 0;
	case(switch)
		"only_push": begin
			switch1 = 1;
			$display("only push");
		end
		"only_pop": begin
			switch2 = 1;
			$display("only pop");
		end
		"more_push": begin
			switch3 = 1;
			$display("more push");
		end
		default: begin
			$display("default random");
			$display(switch);
		end
	endcase
	foreach(seq.tx[i]) begin
		seq.tx[i].constraint_mode(0);
		seq.tx[i].type_c1.constraint_mode(switch1);
		seq.tx[i].type_c2.constraint_mode(switch2);
		seq.tx[i].type_c3.constraint_mode(switch3);
	end 
	assert(seq.randomize());
	//foreach(my_transaction_base kk = seq.tx[i]){
	//foreach(seq.tx[i]) begin
	//	seq.tx[i] = my_transaction_base::type_id::create($sformatf("tx[%0d]",i));
      	// 	assert( seq.tx[i].randomize() );
	//end 
     	$display("SEQ1 INFO (@%0t: seq t_num = %0d) ",$time,seq.t_num);
	//dut_config_0.num_of_trans =  seq.size;
	dut_config_0.num_of_trans =  seq.t_num;
        $display("SEQ2 INFO (@%0t: seq2 t_num = %0d) ",$time,seq2.t_num);
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
	`uvm_info("YY DEBUG INFO",$sformatf("@%0t: drop objection",$time),UVM_LOW);
     endtask // run_phase
  endclass: test1
//   
  class test2 extends test1;
     `uvm_component_utils(test2)
     uvm_cmdline_processor cmdline_processor;
	
     function new(string name, uvm_component parent);
	super.new(name, parent);
    	cmdline_processor = uvm_cmdline_processor::get_inst();
	cmdline_processor.get_arg_value("+SW=",switch);
     endfunction: new
    
     task run_phase(uvm_phase phase);
	     super.run_phase(phase);
     endtask: run_phase
     
  endclass: test2
