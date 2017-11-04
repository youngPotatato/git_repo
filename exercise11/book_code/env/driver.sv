//typedef class Driver_cbs
//yy version
class Driver;
	mailbox gen2drv;
	event drv2gen;
	vUtopiaRx Rx;//virtual interface
	Driver_cbs cbs_queue[$];
	int PortId;
	function new(
		input mailbox gen2drv,
		input event drv2gen,
		input vUtopiaRx Rx,
		int PortId
		);
		this.gen2drv = gen2drv;
		this.drv2gen = drv2gen;
		this.Rx = Rx;
		this.PortId = PortId;
	endfunction:new
	extern task run();
	extern task send(input UNI_cell c);

endclass:Driver

	task Driver::run();
		UNI_cell c;
		bit drop = 0;
		Rx.cbr.data <= 0;
		Rx.cbr.soc <= 0;
		Rx.cbr.clav<= 0;

		forever begin
			//block
			gen2drv.peek(c);
			begin:Tx
				//pre callbacks
				foreach(cbs_queue[i]) begin
					cbs_queue[i].pre_tx(this,c,drop);
					if(drop)
						disable Tx;
				end
				//pre callbacks end

				c.display($sformatf("@%0t: Drv%od: ",$time,PortId));
				send(c);
				//post callbacks
				foreach(cbs_queue[i]) begin
					$display("No.%0d drv post sending scb callback",i);
					cbs_queue[i].post_tx(this,c);
				end
			end:Tx
			//why not put get() in the place of peek();
			gen2drv.get(c);//remove
			
			-> drv2gen;
		end
	endtask:run

	task Driver::send(input UNI_cell c);
		ATMCellType Pkt;
		c.pack(Pkt);
		$write("Sending cell:");
		//foreach(Pkt.Mem[i])
		//	$write("%x ",Pkt.Mem[i]);
		//$display();
		c.display("");


		//timing : toggle bits // low level
		@(Rx.cbr);
		Rx.cbr.clav <= 1;
		for(int i =0;i<=52;i++) begin
			//note the difference between == and ===
			while(Rx.cbr.en ===1'b1) 
				@(Rx.cbr);
			//start of cell
			$display("en enable");
			Rx.cbr.soc <= (i==0);
			Rx.cbr.data<=Pkt.Mem[i];
			@(Rx.cbr);
		end
		Rx.cbr.soc <= 'z;
		Rx.cbr.data<= 8'bx;
		Rx.cbr.clav<= 0;
		$display("sending completed");

	endtask:send

