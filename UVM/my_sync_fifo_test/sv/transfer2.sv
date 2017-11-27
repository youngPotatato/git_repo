typedef enum {
	NOP,
	PUSH,
	POP,
	PUSH_POP
} trans_type;
  class my_transaction_base extends uvm_sequence_item;
  
  
    rand trans_type tr_type;
    //rand int unsigned size;
    rand bit [`Width-1:0] w_data;
    rand bit [`Width-1:0] r_data;
    //rand int size;
  
    //constraint c_size {
    //        size inside{[1:2**`Depth_bits]};
    //}
    //constraint data_size {
    //        w_data.size() == size;
    //        r_data.size() == size;
    //        tr_type.size() == size;
    //}
  `uvm_object_utils_begin(my_transaction_base)
    //`uvm_field_int      (size,           UVM_ALL_ON)
    //`uvm_field_array_enum  (trans_type, tr_type, UVM_ALL_ON)
    `uvm_field_enum  (trans_type, tr_type, UVM_ALL_ON)
    //`uvm_field_array_int(w_data,           UVM_ALL_ON)
    //`uvm_field_array_int(r_data,     UVM_ALL_ON) `uvm_field_int(w_data,           UVM_ALL_ON)
    `uvm_field_int(r_data,     UVM_ALL_ON)
  `uvm_object_utils_end

  // new - constructor
  function new (string name = "my_transaction_base");
    super.new(name);
  endfunction : new

  virtual function string convert2string();
    return sprint(uvm_default_line_printer);
  endfunction

  //virtual task body;
  //endtask: body

  endclass: my_transaction_base

//  class my_basic_sequence extends uvm_sequence #(my_transaction_base);
//  
//    `uvm_object_utils(my_basic_sequence)
//r{
//    rand int size;//means how many trans(pop) to be check in the scoreboard
//    constraint c_size{
//	    size  == 1;
//    }
//    
//    function new (string name = "");
//      super.new(name);
//    endfunction: new
//
//
//      task body;
//      my_transaction_base tx;
//
//      tx = my_transaction_base::type_id::create("tx");
//      start_item(tx);
//      assert( tx.randomize() );
//      `uvm_info("YY DEBUG INFO",$sformatf("@%0t: tx is randomized",$time),UVM_MEDIUM);
//      tx.tr_type = PUSH;
//      finish_item(tx);
//
//
//      tx = my_transaction_base::type_id::create("tx");
//      start_item(tx);
//      assert( tx.randomize() );
//      `uvm_info("YY DEBUG INFO",$sformatf("@%0t: tx is randomized",$time),UVM_MEDIUM);
//      tx.tr_type = POP;
//      finish_item(tx); //
//      //tx = my_transaction_base::type_id::create("tx");
//      //start_item(tx);
//      //assert( tx.randomize() );
//      //`uvm_info("YY DEBUG INFO",$sformatf("@%0t: tx is randomized",$time),UVM_MEDIUM);
//      //tx.tr_type = NOP;
//      //finish_item(tx);
//    endtask: body
//   
//  endclass: my_basic_sequence

  class my_random_sequence1 extends uvm_sequence #(my_transaction_base);
  
   // `uvm_object_utils(my_random_sequence1)


    int ii;
    rand bit rdA[];
    rand bit wrA[];
    rand int t_num;
    rand int size;//means how many trans(pop) to be check in the scoreboard
    rand my_transaction_base tx[];

    constraint c_size{
	    size  == sumi(rdA,rdA.size());
            //solve rdA before size;
    }
    constraint c_num{
            t_num inside{
//        	     [1:2*2**`Depth_bits]
        	     //[2**`Depth_bits:2*2**`Depth_bits]
        	     [14:16]
             };
             solve t_num before rdA;
             //solve t_num before wrA;
    }

    constraint tx_num{
	    tx.size() == t_num;
    }
    constraint wrr{
            wrA.size() == t_num;
            rdA.size() == t_num;
	    rdA[0] == 0;
            foreach(rdA[i]) {
		    sumi(rdA,i) <= sumi(wrA,i);// + 2**`Depth_bits+1;
		    sumi(rdA,i) + 2**`Depth_bits+1 > sumi(wrA,i) ;
		    //&& 
            }
            
    }

   // constraint rdr{
   //         rdA.size() == t_num;
   //         rdA[0] == 0;
   //         foreach(rdA[i]) {
   //                 rdA[i] inside{[0:1]};
   //                 sumi(rdA,i) <= sumi(wrA,i);// + 2**`Depth_bits+1;
   //         }
   //         
   // }

    function int sumi(bit a[], int i);
	int result=0;
	for(int m=0; m < i+1; m++) 
		result += a[m];
	return result;
    endfunction



    
    function new (string name = "");
      super.new(name);
      tx = new[2*2**`Depth_bits];
      foreach (tx[i])
	      tx[i] = new();
    endfunction: new

  	`uvm_object_utils_begin(my_random_sequence1)
  	  //`uvm_field_int      (ii,           UVM_ALL_ON)
  	  `uvm_field_int      (t_num,           UVM_ALL_ON)
  	  //`uvm_field_enum  (trans_type, tr_type, UVM_ALL_ON)
  	  `uvm_field_array_int(wrA,           UVM_ALL_ON)
  	  `uvm_field_array_int(rdA,     UVM_ALL_ON) 
	  //`uvm_field_int(w_data,           UVM_ALL_ON)
  	  `uvm_field_int(size,     UVM_ALL_ON)
  	  `uvm_field_array_object(tx,     UVM_ALL_ON)
  	`uvm_object_utils_end
    task body;
      use_response_handler(1);
      ii = 0;

      `uvm_info("",$sformatf("@%0t: sequence is randomized,t_num is %0d,size is %0d",$time,t_num,size),UVM_MEDIUM);
	      $write("rd wr is ");
      while(ii < t_num) begin 
	      $write("%0d %0d,\n",rdA[ii],wrA[ii]);
	      ii++;
      end
      $display();
      ii = 0;
      while(ii<t_num) begin
      	//tx = my_transaction_base::type_id::create("tx");
      	start_item(tx[ii]);
      	//assert( tx.randomize() );
      	//`uvm_info("YY DEBUG INFO",$sformatf("@%0t: tx is randomized",$time),UVM_MEDIUM);
      	//case({rdA[ii][0],wrA[ii][0]}) 
      	case({rdA[ii],wrA[ii]}) 
      	        2'b00:tx[ii].tr_type = NOP;
      	        2'b10:tx[ii].tr_type = POP;
      	        2'b01:tx[ii].tr_type = PUSH;
      	        2'b11:tx[ii].tr_type = PUSH_POP;
      	endcase
      	finish_item(tx[ii]);
      	ii++;
      	$display("sequence%d fin",ii);
      end
    endtask: body

    function void response_handler(uvm_sequence_item response);
    endfunction: response_handler
   
  endclass: my_random_sequence1

//  class read_modify_write extends uvm_sequence #(my_transaction);
//  
//    `uvm_object_utils(read_modify_write)
//    
//    function new (string name = "");
//      super.new(name);
//    endfunction: new
//
//    task body;
//      my_transaction tx;
//      int a;
//      int d;
//
//      tx = my_transaction::type_id::create("tx");
//      start_item(tx);
//      assert( tx.randomize() );
//      tx.cmd = 1;
//      finish_item(tx);
//
//      a = tx.addr;      
//      d = tx.data;
//      ++d;
//
//      tx = my_transaction::type_id::create("tx");
//      start_item(tx);
//      tx.cmd = 1;
//      tx.addr = a;
//      tx.data = d;
//      finish_item(tx);
//    endtask: body
//   
//  endclass: read_modify_write
//  
//
//  class seq_of_commands extends uvm_sequence #(my_transaction);
//  
//    `uvm_object_utils(seq_of_commands)
//    `uvm_declare_p_sequencer(uvm_sequencer#(my_transaction))
//    
//    rand int n;
//    
//    constraint how_many { n inside {[2:4]}; }
//    
//    function new (string name = "");
//      super.new(name);
//    endfunction: new
//
//    task body;
//      repeat(n)
//      begin
//        read_modify_write seq;
//        seq = read_modify_write::type_id::create("seq");
//        assert( seq.randomize() );
//        seq.start(p_sequencer);
//      end
//    endtask: body
//   
//  endclass: seq_of_commands
