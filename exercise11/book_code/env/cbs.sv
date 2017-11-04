typedef class Driver;

class Driver_cbs;
	virtual task post_tx(
			input Driver drv,
			input UNI_cell c
		);
	endtask:post_tx
	virtual task pre_tx(
			input Driver drv,
			input UNI_cell c,
			inout bit drop
		);
	endtask:pre_tx
endclass:Driver_cbs
//for coverage
typedef class Monitor;

class Monitor_cbs;
	virtual task post_rx(
			input Monitor mon,
			input NNI_cell c
		);
	endtask:post_rx

endclass:Monitor_cbs
