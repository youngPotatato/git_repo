//import uvm_pkg::*;
module fifo_grm 
   (
    dut_if.GOLDEN if1
   );
   typedef bit[`Width-1: 0] fifo_unit;

   fifo_unit my_queue[$:2**`Depth_bits];
   fifo_unit temp;
   int used_depth;//for functional coverage

   initial begin
	   forever begin
		   @(if1.rx_cb_45);
		   	if1.ept = (my_queue.size()== 0);
	   end
  end
  assign if1.valid = (~if1.ept)&&(if1.pop);

   initial begin
	   forever begin
		   @(if1.rx_cb);
		        if1.ful = (my_queue.size()==2**`Width);
	   end
  end

   initial begin
	   forever begin
		   @(if1.rx_cb);
		        used_depth = my_queue.size();
	   end
  end

  initial begin 
	  forever begin
		   @(if1.rx_cb);
		   if(if1.push) begin
		   	if((~if1.reset) && (my_queue.size()<2**`Width)) begin
			   	my_queue.push_front(if1.w_data);
		   	end
		   end
	  end
  end

  initial begin
  	forever begin
		@(if1.reset) my_queue.delete();
	end
  end
  initial begin
	  forever begin
		  @(if1.rx_cb_90);
		  if(if1.valid) begin
			  temp = my_queue.pop_back();
			  //`uvm_info("[YY GOLDEN]:", $sformatf("@%0t push data(%0d)",$time,temp),UVM_HIGH);
			  if1.r_data = temp;
		  end
	end
  end
  endmodule 

