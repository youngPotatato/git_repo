  class my_monitor extends uvm_monitor;
  
    `uvm_component_utils(my_monitor)

     uvm_analysis_port #(my_transaction_base) aport;
    
     my_dut_config dut_config_0;
     vdut_if dut_vi;


    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction: new
    
    function void build_phase(uvm_phase phase);
       dut_config_0 = my_dut_config::type_id::create("config");
       aport = new("aport", this);
       assert( uvm_config_db #(my_dut_config)::get(this, "", "dut_config",
						   dut_config_0) );
       dut_vi = dut_config_0.dut_vi;
       // other config settings as needed
    endfunction : build_phase
   
    task run_phase(uvm_phase phase);
      forever begin
        my_transaction_base tx;
        
        @(dut_vi.tx_cb);
	if(dut_vi.tx_cb.valid) begin
        	tx = my_transaction_base::type_id::create("tx");
        	//tx.size  = dut_vi.rd_size;
		tx.r_data = dut_vi.tx_cb.r_data;
		$display("[MONITOR] @%0t receive r_data %0d",$time,tx.r_data);
		tx.tr_type= POP;
		//foreach(tx.r_data[i]) begin	
        	//	tx.r_data[i] = dut_vi.r_data;
		//	@(posedge dut_vi.clock);
		//	while(!dut_vi.valid)
		//		@(posedge dut_vi.clock);
		//end
        	aport.write(tx);
	end
      end
    endtask: run_phase

  endclass: my_monitor

