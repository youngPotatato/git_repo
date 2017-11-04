//`include "definitions.sv"
class UNI_generator;
	UNI_cell blueprint;//in program block,we can replace this
	mailbox gen2drv;
	event drv2gen;
	int nCells;
	int PortId;
	function new(
		input mailbox gen2drv,
		input event drv2gen,
		input int nCells,PortId
		);
		this.gen2drv = gen2drv;
		this.drv2gen = drv2gen;
		this.nCells = nCells;
		this.PortId = PortId;
		blueprint = new();
	endfunction: new

	task run();
		UNI_cell c;
		repeat(nCells)begin
			checkRandom(blueprint);	
			//use copy, because there is only one handle to blueprint
			//blueprint.display($sformatf("@%0t Gen : blueprint",$time));
			$cast(c,blueprint.copy());
			c.display($sformatf("@%0t Gen :",$time));
			gen2drv.put(c);
			//block
			@drv2gen;
		end
	endtask:run
	function checkRandom(UNI_cell m);
		do begin 
			if(!(m.randomize())) begin 
				$display("%s:%0d: Rand failed \" %s\"", `__FILE__,`__LINE__,`"m.randomize()`"); 
				$finish;  
			end 
		end while(0);
	endfunction:checkRandom

endclass:UNI_generator

