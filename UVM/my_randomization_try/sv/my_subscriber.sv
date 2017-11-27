  class my_scoreboard extends uvm_scoreboard;
  
    `uvm_component_utils(my_scoreboard)
    
   uvm_blocking_get_port #(my_transaction_base) actual_port;
   trans_type t_type;
   my_transaction_base tr;
        
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
		$display("[SUBCCRIBER] build_phase",$time);
    endfunction

    //function void my_component::phase_ready_to_end(uvm_phase phase);
    //        phase.raise_objection();
    //        run_phase(phase);
    //        phase.drop_objection();
    //endfunction phase_ready_to_end
	task run_phase(uvm_phase phase);
		//phase.raise_objection(this);
		$display("[SUBCCRIBER] run_phase_start",$time);
		forever begin
			actual_port.get(tr);
			t_type = tr.tr_type;
			cover_type.sample();
			//result = tr_exp.compare(tr_act);
			//if (result)
			//	$display("Compare SUCCESSFULLY");
			//else
            		//`uvm_warning("WARNING", "Compare FAILED")
			//$display("The expected data is");
			//tr_exp.print();
			//$display("The actual data is");
			$display("[SUBCCRIBER] @%0t received:",$time);
			tr.print();	
		end
		//phase.drop_objection(this);
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

