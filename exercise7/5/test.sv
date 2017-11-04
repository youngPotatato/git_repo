`timescale 1ns / 1ns
program automatic test;
	semaphore xx ;
	initial begin
		fork
			begin
				xx = new(1);
				xx.get(1);
				#45;
				xx.put(2);
			end
			wait10;
		join
	end
	task wait10;
		repeat(10) begin
			#10;
			if(xx.try_get(1)) begin
				$display("%0t, get key",$time);
				break;
			end
		end
	endtask
endprogram
