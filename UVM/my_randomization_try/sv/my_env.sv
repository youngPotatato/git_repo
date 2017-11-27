  class my_env extends uvm_env;

    `uvm_component_utils(my_env)
    
    UVM_FILE file_h;

    my_agent      my_agent_h;
    my_scoreboard my_scoreboard_h;
    //my_scoreboard my_scoreboard_h;
    uvm_tlm_analysis_fifo #(my_transaction_base) monitor2subs_fifo;
    
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction: new
    
    function void build_phase(uvm_phase phase);
      my_agent_h      = my_agent     ::type_id::create("my_agent_h", this);
      my_scoreboard_h = my_scoreboard::type_id::create("my_scoreboard_h", this);
      //my_scoreboard   = my_subscriber::type_id::create("my_scoreboard", this);
      monitor2subs_fifo = new("monitor2subs_fifo",this);
    endfunction: build_phase
    
    function void connect_phase(uvm_phase phase);
      my_agent_h.aport.connect( monitor2subs_fifo.analysis_export );
      my_scoreboard_h.actual_port.connect(monitor2subs_fifo.blocking_get_export);
    endfunction: connect_phase
    
    function void start_of_simulation_phase(uvm_phase phase);
    
      //uvm_top.set_report_verbosity_level_hier(UVM_NONE);
      uvm_top.set_report_verbosity_level_hier(UVM_HIGH);
      //uvm_top.set_report_severity_action_hier(UVM_INFO, UVM_NO_ACTION);
      //uvm_top.set_report_id_action_hier("ja", UVM_NO_ACTION);
      
      file_h = $fopen("uvm_basics_complete.log", "w");
      uvm_top.set_report_default_file_hier(file_h);
      uvm_top.set_report_severity_action_hier(UVM_INFO, UVM_DISPLAY + UVM_LOG);

    endfunction: start_of_simulation_phase

  endclass: my_env

