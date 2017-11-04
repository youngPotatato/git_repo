program automatic test;
	event aa;
	initial begin
		int i = 0;
		forever begin
			wait(aa.triggered);
			$display("%d",i++);
		end
	end
	initial begin
		#4ns;
		-> aa;
	end
endprogram
