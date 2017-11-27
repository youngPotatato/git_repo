  class my_scoreboard extends uvm_scoreboard;
  
    `uvm_component_utils(my_scoreboard)
    
   uvm_blocking_get_port #(my_transaction_base) actual_port;
   trans_type t_type;
   my_transaction_base tr;
    my_dut_config dut_config_0;
    int trans_num,i;
    bit check_state;
        
    covergroup cover_type;
	    coverpoint t_type;
//      coverpoint type { 
//	      bins a[`Depth_bits] = {[1:(2**(`Depth_bits-1))]};
//}
    endgroup: cover_type
    
    function new(string name, uvm_component parent);
      super.new(name, parent);
      cover_type= new;  
      actual_port = new("actual_port", this);		
    endfunction: new

    function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		//$display("[SUBCCRIBER] build_phase",$time);
       		assert( uvm_config_db #(my_dut_config)::get(this, "", "dut_config",
       		 					   dut_config_0) );
		check_state = 0;
		i = 0;

    endfunction

    function void phase_ready_to_end(uvm_phase phase);
            phase.raise_objection(this);
	    fork 
		    begin 
	    		wait_for_ok_to_finish();
            		phase.drop_objection(this);
    	    	    end
    	    join_none
    endfunction:phase_ready_to_end

    task wait_for_ok_to_finish();
	    //#5000;
	    wait(check_state);
    endtask: wait_for_ok_to_finish
	task run_phase(uvm_phase phase);
       		trans_num = dut_config_0.num_of_trans;
		$display("[SUBCCRIBER] run_phase_start",$time);
		$display("[SUBCCRIBER] there %0d trans to check",trans_num);
		if(trans_num == 0) begin
			this.check_state = 1;
		end
		else begin
			forever begin
				actual_port.get(tr);
				t_type = tr.tr_type;
				cover_type.sample();
				$display("[SUBCCRIBER] @%0t received:",$time);
				tr.print();	
				i ++;
				if(i == trans_num)
					break;
			end
			this.check_state = 1;
		end
	endtask		
    //function void write(my_transaction_base t);
    //  `uvm_info("mg", $psprintf("Subscriber received tx %s", t.convert2string()), UVM_NONE);
    //  
    //  t_type = t.tr_type;
    //  cover_size.sample();
    //  /*
    //  begin
    //    my_transaction expected;
    //    expected = new;
    //    expected.copy(t);
    //    if ( !t.compare(expected))
    //      `uvm_error("mg", "Transaction differs from expected");
    //  end
    //  //*/
    //endfunction: write

  endclass: my_scoreboard

