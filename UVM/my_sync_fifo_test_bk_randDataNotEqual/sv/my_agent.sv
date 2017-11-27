  class my_agent extends uvm_agent;

    `uvm_component_utils(my_agent)
    
    uvm_analysis_port #(my_transaction_base) aport;
    
    my_sequencer my_sequencer_h;
    my_driver    my_driver_h;
    my_monitor   my_monitor_h;
    
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction: new
    
    function void build_phase(uvm_phase phase);
       aport = new("aport", this);
       my_sequencer_h = my_sequencer::type_id::create("my_sequencer_h", this);
       my_driver_h    = my_driver   ::type_id::create("my_driver_h"   , this);
       my_monitor_h   = my_monitor  ::type_id::create("my_monitor_h"  , this);
    endfunction: build_phase
    
    function void connect_phase(uvm_phase phase);
      my_driver_h.seq_item_port.connect( my_sequencer_h.seq_item_export );
      my_monitor_h.       aport.connect( aport );
    endfunction: connect_phase
    
  endclass: my_agent


//  class my_agent2 extends my_agent;
//
//    `uvm_component_utils(my_agent2)
//    function new(string name, uvm_component parent);
//      super.new(name, parent);
//    endfunction: new
//    
//    //uvm_analysis_port #(my_transaction_base) aport;
//    
//    //my_sequencer my_sequencer_h;
//    //my_driver2    my_driver_h;
//    //my_monitor2   my_monitor_h;
//    
//    //function new(string name, uvm_component parent);
//    //  super.new(name, parent);
//    //endfunction: new
//    //
//    function void build_phase(uvm_phase phase);
//       super.build_phase(phase);
//       //aport = new("aport", this);
//       //my_sequencer_h = my_sequencer::type_id::create("my_sequencer_h", this);
//       my_driver   ::type_id::set_inst_override(my_driver2::get_type(),"top.my_env_h.my_agent2_h.my_driver_h");
//       my_monitor   ::type_id::set_inst_override(my_monitor2::get_type(),"top.my_env_h.my_agent2_h.my_monitor_h");
//    endfunction: build_phase
//    //
//    //function void connect_phase(uvm_phase phase);
//    //  my_driver_h.seq_item_port.connect( my_sequencer_h.seq_item_export );
//    //  my_monitor_h.       aport.connect( aport );
//    //endfunction: connect_phase
//    
//  endclass: my_agent2
