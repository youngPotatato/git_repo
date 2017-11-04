class Expect_cells;
	NNI_cell q[$];
	int iexpect,iactual;
endclass:Expect_cells





class Scoreboard;
	Config cfg;
	Expect_cells expect_cells[];//for every tx port[i] of dut(), all cells from that port 
				    //are stored in expect_cells[i]
				    //each of the handle of array expect_cells
				    //points to an object of Expect_cells class
				    //in that object, we have a queue to store all cells from that port
	NNI_cell cell_q[$];
	int PortId;
	int iexpect,iactual;


	function new(
			Config cfg
		);
		this.cfg = cfg;
		expect_cells = new[NumTx];
		foreach (expect_cells[i])
			expect_cells[i] = new();
	endfunction:new
	
	extern virtual function void wrap_up();
	extern function void save_expected(UNI_cell ucell);
	extern function void check_actual(
			input NNI_cell c,
			input int portn);
	extern function void display(string prefix = "");
endclass:Scoreboard



function void Scoreboard::save_expected(UNI_cell ucell);
	NNI_cell ncell = ucell.to_NNI;
	CellCfgType CellCfg = $root.top.squat.lut.read(ncell.VPI);
	$display("@%0t: Scb save: VPI = %0x, Forward = %b",$time, ncell.VPI, CellCfg.FWD);
	ncell.display($sformatf("@%0t: Scb save:",$time));
	//this cell could be forwarded to multiple tx ports of dut, for every this kind of tx, ++
	for (int i = 0; i<NumTx; i++)
		if(CellCfg.FWD[i]) begin
			expect_cells[i].q.push_back(ncell);
			//for every tx port of dut, there is a independent iexp
			//and there is a total iexp for the only scoreboard
			expect_cells[i].iexpect++;
			iexpect++;
		end

endfunction:save_expected

function void Scoreboard::check_actual(
		input NNI_cell c,
		input int portn
	);
	NNI_cell match;
	int match_idx;

	c.display($sformatf("@%0t: Scb cheeck: ",$time));

	//for every received cell of monitor, it should have a match in expect_cell[tx port num]
	//so expect_cells[tx port num].q should at least > 0
	//or it is an error
	if(expect_cells[portn].q.size() == 0) begin
		$display("@%0t: ERROR: %m cell not found, SCB TX%d empty",$time, portn);
		c.display("Not Found: ");
		cfg.nErrors++;
		return;
	end


	expect_cells[portn].iactual++;
	iactual++;

	//????????????????????????????????
	//??dut reorder cells??
	//????????????????????????????????
	// 2nd kind of error
	//the corresponding que is not empty
	//but hasn't matching cell
	foreach (expect_cells[portn].q[i]) begin
		//find a match
		if(expect_cells[portn].q[i].compare(c)) begin
			$display("@%0t: Match found for cell",$time);
			expect_cells[portn].q.delete(i);//remove
			return;
		end
	end

	$display("@%0t: ERROR: %m cell not found",$time);
	c.display("Not Found: ");
	cfg.nErrors++;
endfunction:check_actual


function void Scoreboard::wrap_up();
	//ex , actual is total num
	$display("@%0t: %m %0d expected cells, %0d actual cells rcvd", $time, iexpect, iactual);
	//look for leftover cells
	//which is still in expect_cells[i]'s queue, but has no match in tx port of dut
	foreach(expect_cells[i]) begin
		if(expect_cells[i].q.size()) begin
			$display("@%0t: %m cells in SCB Tx[%0d] at end of test",$time,i);
			this.display("Unclaimed: ");
			cfg.nErrors++;
		end
	end
endfunction:wrap_up

function void Scoreboard::display(
		input string prefix
	);
	$display("@%0t: %m so far %0d expected cells, %0d actual rcvd",$time,iexpect,iactual);
	foreach(expect_cells[i]) begin
		$display("Tx[%0d]: exp=%0d, act=%0d",i, expect_cells[i].iexpect, expect_cells[i].iactual);
		foreach(expect_cells[i].q[j])
			expect_cells[i].q[j].display($sformatf("%sScoreboard: Tx%0d: ",prefix, i));
	end
endfunction:display
