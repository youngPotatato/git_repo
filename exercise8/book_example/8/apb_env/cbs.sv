virtual class Driver_cbs;
	virtual task pre_tx(ref apb_trans t, ref int delay_cycle);
	endtask

	virtual task post_tx(ref apb_trans t, ref int delay_cycle);
	endtask
endclass
