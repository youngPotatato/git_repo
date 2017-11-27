  class my_driver extends uvm_driver #(my_transaction_base);
  
    `uvm_component_utils(my_driver)

     my_dut_config dut_config_0;
     vdut_if dut_vi;
     //event rst_done;

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction: new
    
    function void build_phase(uvm_phase phase);
       assert( uvm_config_db #(my_dut_config)::get(this, "", "dut_config", 
						   dut_config_0) );
       dut_vi = dut_config_0.dut_vi;
       // other config settings from dut_config_0 object as needed
    endfunction : build_phase
   
    virtual task run_phase(uvm_phase phase);
	            reset_task();
	            get_and_drive();
    endtask: run_phase

    virtual protected task get_and_drive();
        automatic my_transaction_base tx;
      	wait(~dut_vi.reset);
	forever begin
        	seq_item_port.get_next_item(tx);
        	`uvm_info("YY DEBUG INFO",$sformatf("@%0t: item type:%0s",$time,tx.tr_type),UVM_MEDIUM);
        	@(dut_vi.tx_cb);
			dut_vi.pop  = 0;
			dut_vi.tx_cb.push <= 0;
		if(tx.tr_type == NOP) begin
			//dut_vi.pop  = 0;
			dut_vi.tx_cb.push <= 0;
		end
		else if(tx.tr_type == PUSH) begin
			while(dut_vi.tx_cb.ful) @(dut_vi.tx_cb);
			dut_vi.tx_cb.push   <= 1;
			dut_vi.tx_cb.w_data <= tx.w_data;
		end
		else if(tx.tr_type == POP) begin
			wait(~dut_vi.ept);// @(dut_vi.tx_cb);
			dut_vi.pop = 1;
		end
		else if(tx.tr_type == PUSH_POP) begin
			fork 
				begin
					while(dut_vi.tx_cb.ful) @(dut_vi.tx_cb);
					dut_vi.tx_cb.push <= 1;
					dut_vi.tx_cb.w_data <= tx.w_data;
				end
				begin
					wait(~dut_vi.ept);// @(dut_vi.tx_cb);
					dut_vi.pop = 1;
				end
			join
		end
        	seq_item_port.item_done(tx);
	end // end forever
        //@(dut_vi.tx_cb);
        //`uvm_info("YY DEBUG INFO",$sformatf("@%0t: deassert pop and push",$time),UVM_MEDIUM);
	//dut_vi.tx_cb.pop = 0;
	//dut_vi.tx_cb.push = 0;
    endtask: get_and_drive 

    virtual protected task reset_task();
        	    @(dut_vi.tx_cb);
		    wait(dut_vi.reset);
        	    //`uvm_info("YY DEBUG INFO",$sformatf("@%0t: reset task start",$time),UVM_MEDIUM);
		    dut_vi.tx_cb.w_data <= 'dz;
		    dut_vi.tx_cb.pop <= 'dz;
		    dut_vi.tx_cb.push <= 'dz;
		    wait(~dut_vi.reset);
//		    ->r_done;
        	    //`uvm_info("YY DEBUG INFO",$sformatf("@%0t: rst de-activated ",$time),UVM_MEDIUM);
    endtask: reset_task

  endclass: my_driver
