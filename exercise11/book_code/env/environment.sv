`include "generator.sv"
`include "cbs.sv"
`include "driver.sv"
`include "monitor.sv"
`include "config.sv"
`include "scoreboard.sv"
`include "coverage.sv"
//`include "cpu_ifc.sv"
`include "cpu_driver.sv"
//use call backs to connect driver and scoreboard
class Scb_Driver_cbs extends Driver_cbs;
	Scoreboard scb;
	function new(Scoreboard scb);
		this.scb = scb;
	endfunction:new

	virtual task post_tx(
		input Driver drv,
		input UNI_cell c
		);
		scb.save_expected(c);
	endtask:post_tx
endclass
//use call backs to connect monitor to scoreboard
class Scb_Monitor_cbs extends Monitor_cbs;
	Scoreboard scb;
	function new(Scoreboard scb);
		this.scb = scb;
	endfunction:new
	virtual task post_rx(
		input Monitor mon,
		input NNI_cell c
	);
		scb.check_actual(c,mon.PortId);
	endtask:post_rx
endclass
//connect the monitor to coverage class
//but why coverage is in monitor??
//should it be in scoreboard??
class Cov_Monitor_cbs extends Monitor_cbs;
	Coverage cov;

	function new(Coverage cov);
		this.cov = cov;
	endfunction:new

	virtual task post_rx(
		input Monitor mon,
		input NNI_cell c
		);
		CellCfgType CellCfg = $root.top.squat.lut.read(c.VPI);
		cov.sample(mon.PortId,CellCfg.FWD);
	endtask:post_rx
endclass:Cov_Monitor_cbs

class Environment;
	UNI_generator gen[];
	mailbox gen2drv[];
	event drv2gen[];
	Driver drv[];
	Monitor mon[];
	Config cfg;
	Scoreboard scb;
	Coverage cov;
	vUtopiaRx Rx[];
	vUtopiaTx Tx[];
	int numRx, numTx;
	vCPU_T mif;
	CPU_driver cpu;


	extern function new (
			input vUtopiaRx Rx[],
			input vUtopiaTx Tx[],
			input int numRx,numTx,
			input vCPU_T mif
		);
	extern virtual function checkRandom(Config m);
	extern virtual function void gen_cfg();
	extern virtual function void build();
	extern virtual task run();
	extern virtual function void wrap_up();


endclass : Environment
function Environment::new(
		input vUtopiaRx Rx[],
		input vUtopiaTx Tx[],
		input int numRx,numTx,
		input vCPU_T mif
	);
	this.Rx = new[Rx.size()];
	foreach(Rx[i]) this.Rx[i]= Rx[i];
	this.Tx = new[Tx.size()];
	foreach(Tx[i]) this.Tx[i]= Tx[i];
	this.numRx = numRx;
	this.numTx = numTx;
	this.mif   = mif;
	cfg = new(numRx,numTx);

	if($test$plusargs("ntb_random_seed")) begin
		int seed;
		$value$plusargs("ntb_random_seed=%d",seed);
		$display("simulation runs with seed = %d",seed);
	end
	else begin
		$display("simulation runs with random seed");
	end
endfunction:new
function Environment::checkRandom(Config m);
	do begin 
		if(!(m.randomize())) begin 
			$display("%s:%0d: Rand failed \" %s\"", `__FILE__,`__LINE__,`"m.randomize()`"); 
			$finish;  
		end 
	end while(0);
endfunction:checkRandom

function void Environment::gen_cfg();
	checkRandom(cfg);
	cfg.display();
endfunction:gen_cfg

function void Environment::build();
	cpu = new(mif,cfg);
	gen = new[numRx];
	drv = new[numRx];
	gen2drv = new[numRx];
	drv2gen = new[numRx];
	scb = new(cfg);
	cov = new();
	foreach(gen[i]) begin
		gen2drv[i] = new();
		gen[i] = new(gen2drv[i],drv2gen[i],cfg.cells_per_chan[i],i);
		drv[i] = new(gen2drv[i],drv2gen[i],Rx[i],i);
	end
	mon = new[numTx];
	foreach(mon[i]) begin
		mon[i] = new(Tx[i],i);
	end
	//plug and replace the "bluepring" of the pre-set hook of pre callback tasks
	begin
		Scb_Driver_cbs sdc = new(scb);
		Scb_Monitor_cbs smc= new(scb);
		foreach(drv[i]) drv[i].cbs_queue.push_back(sdc);
		foreach(mon[i]) mon[i].cbsq.push_back(smc);
	end
	//post callback
	begin
		Cov_Monitor_cbs smc = new(cov);
		foreach (mon[i])
			mon[i].cbsq.push_back(smc);
	end
endfunction:build
	

task Environment::run();
	static int num_gen_running;//should be in static version
	cpu.run();
	$display("cpu run");
	num_gen_running = numRx;
	//for each rx, start generator and driver
	foreach(gen[i]) begin
		int j = i;
		fork
			begin
				if(cfg.in_use_Rx[j]) begin
					$display("Rx %0d port in use, running gen for this port",j);
					gen[j].run();
				end
				num_gen_running--;
			end
			if(cfg.in_use_Rx[j]) drv[j].run();
		join_none
	end
	//for each rx, start monitor
	foreach(mon[i]) begin
		automatic int j=i;
		fork
			mon[j].run();
		join_none
	end
	//wait for all gens to finish, or time-out
	fork:time_out
		wait(num_gen_running == 0);
		begin
			repeat(1_000_000) @(Rx[0].cbr);
			$display("@%0t:%m ERROR: generator timeout",$time);
			cfg.nErrors++;
		end
	join_any
	disable time_out;

	repeat(1000)@(Rx[0].cbr);
endtask:run



function void Environment::wrap_up();
	$display("@%0t: End of sim, %od errors, %od warnings",$time,cfg.nErrors,cfg.nWarnings);
	scb.wrap_up();
endfunction:wrap_up


