  class my_monitor extends uvm_monitor;
  
    `uvm_component_utils(my_monitor)

     uvm_analysis_port #(my_transaction_base) aport;//for tr from dut

     uvm_analysis_port #(my_transaction_base) bport;//for tr to dut
    
     my_dut_config dut_config_0;
     vdut_if dut_vi;
     //vdut_rif dut_rvi;


    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction: new
    
    function void build_phase(uvm_phase phase);
       dut_config_0 = my_dut_config::type_id::create("config");
       aport = new("aport", this);
       bport = new("bport", this);
       assert( uvm_config_db #(my_dut_config)::get(this, "", "dut_config",
						   dut_config_0) );
       dut_vi = dut_config_0.dut_vi;
      // dut_rvi = dut_config_0.dut_rvi;
       // other config settings as needed
    endfunction : build_phase
   
    task run_phase(uvm_phase phase);
	fork
		begin//thread for receive tr from dut
        		my_transaction_base rx;
      			forever begin
        			@(dut_vi.tx_cb);
				if(dut_vi.tx_cb.valid) begin
        				rx = my_transaction_base::type_id::create("rx");
        				//tx.size  = dut_vi.rd_size;
					rx.r_data = dut_vi.tx_cb.r_data;
					//$display("[MONITOR] @%0t receive r_data %0d",$time,tx.r_data);
					rx.tr_type= POP;
					//foreach(tx.r_data[i]) begin	
        				//	tx.r_data[i] = dut_vi.r_data;
					//	@(posedge dut_vi.clock);
					//	while(!dut_vi.valid)
					//		@(posedge dut_vi.clock);
					//end
        				aport.write(rx);
				end
			end
		end
       		begin //thread for monitor stimulus
        		my_transaction_base tx;
			//int cnt = 1;
			forever begin
        			@(dut_vi.rx_cb);
				//`uvm_info("monitor stimulus",$sformatf("@%0t: No.%d stimulus info",$time,cnt),UVM_MEDIUM);
				case({dut_vi.rx_cb.push, dut_vi.rx_cb.pop}) 
					2'b11:begin
        					tx = my_transaction_base::type_id::create("tx");
						tx.w_data = dut_vi.rx_cb.w_data;
						tx.tr_type= PUSH_POP;
        					bport.write(tx);
						//cnt++;
					end
					2'b10:begin
        					tx = my_transaction_base::type_id::create("tx");
						tx.w_data = dut_vi.rx_cb.w_data;
						tx.tr_type= PUSH;
        					bport.write(tx);
						//cnt++;
					end
					2'b01:begin
        					tx = my_transaction_base::type_id::create("tx"); 
						tx.tr_type= POP;
        					bport.write(tx);
						//cnt++;
					end
				endcase
			end//end forever
		end
	join
    endtask: run_phase

  endclass: my_monitor

//  class my_monitor2 extends my_monitor;
//  
//    `uvm_component_utils(my_monitor2)
//
//    
//
//
//    function new(string name, uvm_component parent);
//     super.new(name, parent);
//    endfunction: new
//    
//    function void build_phase(uvm_phase phase);
////       dut_config_0 = my_dut_config::type_id::create("config");
////       aport = new("aport", this);
////       assert( uvm_config_db #(my_dut_config)::get(this, "", "dut_config",
////						   dut_config_0) );
//	super.build_phase(phase);
//       dut_vi = dut_config_0.dut_vi2;
//       // other config settings as needed
//    endfunction : build_phase
//   
//
//  endclass: my_monitor2
