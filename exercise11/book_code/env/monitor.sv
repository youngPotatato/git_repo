//typedef class Monitor_cbs 

class Monitor;
	vUtopiaTx Tx;
	Monitor_cbs cbsq[$];
	int PortId;
	NNI_cell c;


	function new(
		input vUtopiaTx Tx,
		input int PortId
		);
		this.Tx = Tx;
		this.PortId = PortId;
	endfunction:new
	extern task run();
	extern task receive(output NNI_cell c);
endclass:Monitor


task Monitor::run();
	NNI_cell c;
	forever begin
		receive(c);
		foreach(cbsq[i])
			cbsq[i].post_rx(this,c);
	end
endtask:run




task Monitor::receive(output NNI_cell c);
	ATMCellType Pkt;
	Tx.cbt.clav <= 1;
	//toggle bits to receive: low level
	while(Tx.cbt.soc !== 1'b1 && Tx.cbt.en !== 1'b0)
		@(Tx.cbt);
	for (int i=0; i<52; i++) begin
		//if not enabled, loop
		while(Tx.cbt.en !== 1'b0);
			@(Tx.cbt);
		Pkt.Mem[i] = Tx.cbt.data;
		@(Tx.cbt);
	end


	Tx.cbt.clav <= 0;
	c = new();
	c.unpack(Pkt);
	c.display($sformatf("@%ot:Mon%0d ",$time, PortId));
endtask:receive
