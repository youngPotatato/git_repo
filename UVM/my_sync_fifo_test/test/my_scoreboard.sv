  class my_scoreboard extends uvm_scoreboard;
  
    `uvm_component_utils(my_scoreboard)
    
   uvm_blocking_get_port #(my_transaction_base) actual_port;
   uvm_blocking_get_port #(my_transaction_base) exped_port;
   uvm_blocking_get_port #(my_transaction_base) actual_port_tx;
   uvm_blocking_get_port #(my_transaction_base) exped_port_tx;
   trans_type t_type;
   int usedDepth;//the used depth of lifo/fifo
   my_transaction_base tr;
   my_transaction_base tr2;//from golden reference model

   //stimulus transaction
   my_transaction_base tx_tr;
   my_transaction_base tx_tr2;//for golden reference model
    my_dut_config dut_config_0;
    int trans_num;//num of tr from dut which should be received
    //int t_num;//
    int i;
    bit check_state;
    vdut_if dut_vi;
        
    covergroup cover_type;
            coverpoint t_type{
        	    ignore_bins NOP = {NOP};
            }
    endgroup: cover_type
    covergroup crossTypeUsedDepth;
	    ty:coverpoint t_type
	    	{
			bins ty_pu = {PUSH};
			bins ty_po = {POP};
			bins ty_pupo = {PUSH_POP};
			option.weight=0;
		}
	    depth:coverpoint usedDepth
	    {
		        bins empty = {0};
			bins other = {[1:(2**`Depth_bits - 1)]};
			bins full  = {2**`Depth_bits};
			option.weight=0;
	    }

	    crossC: cross ty, depth
	    {
		    bins pu_empth   = binsof(ty.ty_pu)   && binsof(depth.empty);
		    bins pu_other   = binsof(ty.ty_pu)   && binsof(depth.other);
		    bins pu_full    = binsof(ty.ty_pu)   && binsof(depth.full);
		    bins po_empth   = binsof(ty.ty_po)   && binsof(depth.empty);
		    bins po_other   = binsof(ty.ty_po)   && binsof(depth.other);
		    bins po_full    = binsof(ty.ty_po)   && binsof(depth.full);
		    bins pupo_empth = binsof(ty.ty_pupo) && binsof(depth.empty);
		    bins pupo_other = binsof(ty.ty_pupo) && binsof(depth.other);
		    bins pupo_full  = binsof(ty.ty_pupo) && binsof(depth.full);
	    }
    endgroup: crossTypeUsedDepth
    
    
    function new(string name, uvm_component parent);
      super.new(name, parent);
      cover_type= new;  
      crossTypeUsedDepth = new;
      actual_port = new("actual_port", this);		
      exped_port= new("exped_port", this);		
      actual_port_tx = new("actual_port_tx", this);		
      exped_port_tx= new("exped_port_tx", this);		
    endfunction: new

    function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		//$display("[SUBCCRIBER] build_phase",$time);
       		assert( uvm_config_db #(my_dut_config)::get(this, "", "dut_config",
       		 					   dut_config_0) );
		check_state = 0;
		i = 0;
		dut_vi = dut_config_0.dut_vi;
    endfunction

    function void phase_ready_to_end(uvm_phase phase);
	    phase.raise_objection(this,"not ready to end test,wait for scoreboard to finish");
	    fork 
		    begin 
	    		wait_for_ok_to_finish();
			phase.drop_objection(this,"now scoreboard finishes, ending test!");
    	    	    end
    	    join_none
    endfunction:phase_ready_to_end

    task wait_for_ok_to_finish();
	    fork
	    begin
		    repeat(2**`Depth_bits) @dut_vi.tx_cb;
	    end
	    wait(check_state);
    	    join_any
    endtask: wait_for_ok_to_finish
	task run_phase(uvm_phase phase);
		fork
			begin//thread: tr received from dut
       				trans_num = dut_config_0.num_of_trans;
				//$display("[SUBCCRIBER] run_phase_start",$time);
				//$display("[SUBCCRIBER] there %0d trans to check",trans_num);
				if(trans_num == 0) begin
					this.check_state = 1;
				end
				else begin
					forever begin
						actual_port.get(tr);
						//$display("[SUBCCRIBER] @%0t received actual trans:",$time);
						exped_port.get(tr2);
						//$display("[SUBCCRIBER] @%0t received ecped trans:",$time);
						//tr2.print($sformat("@%0t monitor receiced expected tr",$time));	
						if(!tr.compare(tr2)) begin
      							`uvm_error("scoreboard",$sformatf("@%0t: expected tr is not matched to actual tr!!!!",$time));
							tr.print();	
							tr2.print();	
						end
						else begin
      							`uvm_info("scoreboard",$sformatf("@%0t: expected tr is  matched to actual tr",$time),UVM_DEBUG);
						end
						i ++;
						if(i == trans_num)
							break;
						end
					end//end forever end
					this.check_state = 1;
				end//end else
			begin//thread for stimulus tr
				forever begin
					actual_port_tx.get(tx_tr);
					exped_port_tx.get(tx_tr2);
					if(!tx_tr.compare(tx_tr2)) begin
      						`uvm_error("scoreboard",$sformatf("@%0t: stimulus to dut and golden reference model not matched!!!!",$time));
						tx_tr.print();
						tx_tr2.print();
					end
					else begin
      						`uvm_info("scoreboard",$sformatf("@%0t: stimulus to dut and golden reference model matched",$time),UVM_DEBUG);
					end
					t_type = tx_tr.tr_type;
					usedDepth = $root.top.grm.used_depth;
					cover_type.sample();
					crossTypeUsedDepth.sample();
				end//end forever
			end
		join_none
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

