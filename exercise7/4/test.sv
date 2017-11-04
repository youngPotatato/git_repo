`timescale 1ns / 1ns
program automatic test;
	semaphore xx ;
	initial begin
		xx = new(0);
		fork
			trigger;
			begin
				# 55;
				xx = new(1);
			end
		join
	end
	task trigger;
		repeat(10) begin
			#10;
			if(xx.try_get(1)) begin
				$display("%0t, get key",$time);
				break;
			end
		end
	endtask
endprogram
