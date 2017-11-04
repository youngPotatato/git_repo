class Delay_cbs extends Driver_cbs;
	virtual task pre_tx(ref apb_trans t, ref int delay_cycle);
		delay_cycle = $urandom_range(0,10);
		$display("@%0t:pre-trans callback task--delay %0d cycle",$time,delay_cycle);
		//repeat(delay_cycle) idle(); 
	endtask
endclass
