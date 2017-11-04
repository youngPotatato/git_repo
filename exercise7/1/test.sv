`timescale 1ns / 1ns
program automatic test;
	initial begin
		$display("@%0t:start fork .. join example",$time);
		fork
			begin
				#20 $display("@%0t:sa after #20",$time);
				#20 $display("@%0t:sb after #20",$time);
			end
				$display("@%0t:parallel start",$time);
				#50 $display("@%0t:parallel after #50",$time);
			begin
				#30 $display("@%0t:s after 30",$time);
				#10 $display("@%0t:s after 10",$time);
			end
		join_none
		$display("@%0t:after join",$time);
		#80 $display("@%0t:finish after #80",$time);
	end
endprogram
