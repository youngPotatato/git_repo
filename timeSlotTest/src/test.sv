program automatic test(arb_if.Test arb_if) ;

	initial begin
		$monitor("@%0t; grant=%h",$time, arb_if.cb.grant);
		#500 $display("test end");
	end


	initial begin
		$fsdbDumpfile("test.fsdb");
		$fsdbDumpvars("+all");
	end


endprogram
