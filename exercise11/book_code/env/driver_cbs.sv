typedef class Driver
class Driver_cbs;
	virtual task pre_tx(
			input Driver drv,
			input UNI_cell c,
			inout bit drop
		);
	end:pre_tx
	virtual task post_tx(
			input Driver drv
			input UNI_cell c
		);
	end:post_tx
endclass:Driver_cbs
