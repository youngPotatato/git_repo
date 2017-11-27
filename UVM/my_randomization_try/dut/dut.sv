//import uvm_pkg::*;
module fifo_grm 
   (
    dut_if.GOLDEN if1
   );
   typedef bit[`Width-1: 0] fifo_unit;

   fifo_unit my_queue[$:2**`Depth_bits];

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
		   if(if1.push)
		   	if((~if1.reset) && (my_queue.size()<2**`Width))
			   my_queue.push_front(if1.w_data);
	  end
  end

  initial begin
  	forever begin
		@(if1.rx_cb);
		if(if1.reset) my_queue.delete();
	end
  end

  initial begin
	  forever begin
		  @(if1.rx_cb_45);
		  if(if1.valid) if1.r_data = my_queue.pop_front();
	//  else
	//	  if1.rx_cb.r_data = 'dx;
	end
  end
  endmodule 

