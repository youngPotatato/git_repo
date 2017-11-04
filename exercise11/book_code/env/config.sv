
class Config;
	int nErrors,nWarnings;
	bit [31:0] numRx, numTx;
	rand bit [31:0] nCells;//total cell number


	constraint c_nCells_valid{
		nCells > 0;
	}
	constraint c_nCells_reasonable{
		nCells < 100;
	}
	rand bit in_use_Rx[];
	constraint c_in_use_valid{
		in_use_Rx.sum() > 0;
	}
	rand bit[31:0] cells_per_chan[];
	constraint c_sum_ncells_sum{
		cells_per_chan.sum() == nCells;
	}

	//to increase solver efficiency
	constraint c_cross{
		foreach(in_use_Rx[i]){
			solve in_use_Rx[i] before cells_per_chan[i];
			if(in_use_Rx[i])
				cells_per_chan[i] inside {[1:nCells]};
			else
				cells_per_chan[i] == 0;
		}
	}
	extern function new(input bit [31:0] numRx, input bit [31:0] numTx);
	extern virtual function void display(input string prefix= "");
endclass:Config


	function Config::new(input bit [31:0] numRx, input bit [31:0] numTx);
		if(!(numRx inside {[1:16]})) begin
			$display("FATAL %m numRx %0d out of bounds 1..16",numRx);
			$finish;
		end
		this.numRx = numRx;
		in_use_Rx = new[numRx];

		if(!(numTx inside{[1:16]})) begin
			$display("FATAL %m numTx %0d out of boubds 1..16",numTx);
			$finish;
		end
		this.numTx = numTx;
		cells_per_chan = new[numRx];


	endfunction : new

	function void Config::display(input string prefix= "");
		$write("%sConfig: numRx=%0d, numTx=%0d, nCells=%0d(",prefix,numRx,numTx,nCells);
		foreach(cells_per_chan[i])
			$write("%0d ",cells_per_chan[i]);
		$write("),enable RX: ",prefix);
		foreach(in_use_Rx[i]) 
			if(in_use_Rx[i]) begin
				$write("%0d",i);
			end
		$display;
	endfunction:display




