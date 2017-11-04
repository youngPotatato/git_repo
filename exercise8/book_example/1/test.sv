program automatic tt;
	
	ExtBinary ts;
	int kkk; 

	initial begin
		ts = new();
		//ts.checkRandom(ts);	
		$display("%d and %d",ts.val1, ts.val2);
		kkk = ts.multiply();
		$display("function multiply result is : %d",kkk);
	end
endprogram
