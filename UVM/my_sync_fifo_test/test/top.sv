module top;

//  import uvm_pkg::*;
//  import my_pkg::*;
logic clock,clock_45,clock_60,clock_90,clock_315;
  
  dut_if dut_if1 (clock,clock_45,clock_60,clock_90,clock_315);//for dut
  dut_if dut_if2 (clock,clock_45,clock_60,clock_90,clock_315);//for golden reference model
  
  fifo#(
		.B(`Width),
		.W(`Depth_bits)
  	)dut1 ( 
		.clk	(dut_if1.clock), 
		.reset	(dut_if1.reset),
		.rd	(dut_if1.pop),
		.wr	(dut_if1.push),
		.w_data	(dut_if1.w_data),
		.empty	(dut_if1.ept), 
		.full	(dut_if1.ful),
		.r_data	(dut_if1.r_data),
		.valid	(dut_if1.valid)
	);



  fifo_grm grm ( 
	  .if1(dut_if2.GOLDEN)
	);

  // Clock and reset generator
  initial
  begin
    clock = 0;
    forever #8 clock = ~clock;
  end

  initial
  begin
    #2;
    clock_45 = 0;
    forever #8 clock_45 = ~clock_45;
  end

  initial
  begin
    #3;
    clock_60 = 0;
    forever #8 clock_60 = ~clock_60;
  end

  initial
  begin
    #4;
    clock_90 = 0;
    forever #8 clock_90 = ~clock_90;
  end

  initial
  begin
    #14;
    clock_315 = 0;
    forever #8 clock_315 = ~clock_315;
  end

  initial
  begin
    dut_if1.reset = 0;
    dut_if2.reset = 0;
    repeat(1) @(posedge dut_if1.clock);
    `uvm_info("DEBUG INFO",$sformatf("@%0t: reset posedge",$time),UVM_MEDIUM);
    dut_if1.reset = 1;
    dut_if2.reset = 1;
    repeat(3) @(posedge dut_if1.clock);
    `uvm_info("DEBUG INFO",$sformatf("@%0t: reset negedge",$time),UVM_MEDIUM);
    dut_if1.reset = 0;
    dut_if2.reset = 0;
  end

  initial
  begin: blk
     uvm_config_db #(vdut_if)::set(null, "uvm_test_top",
	                                  "dut_vi", dut_if1.TB);
     uvm_config_db #(vdut_if)::set(null, "uvm_test_top",
	                                  "dut_vi2", dut_if2.TB);
     //uvm_config_db #(vdut_rif)::set(null, "uvm_test_top",
     //	                                  "dut_rvi", dut_if1.RB);
     //uvm_config_db #(vdut_rif)::set(null, "uvm_test_top",
     //	                                  "dut_rvi2", dut_if2.RB);

     //uvm_top.finish_on_completion  = 1;
    
     run_test();
  end

  initial begin
	  $fsdbDumpfile("test.fsdb");
	  $fsdbDumpvars("+all");
  end
endmodule:top