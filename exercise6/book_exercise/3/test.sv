program automatic test;
	import yy::*;
	Exercise1 e1[] = new[20];
	initial begin
		foreach(e1[i]) begin
			e1[i] = new();
			checkRandom(e1[i]);
			e1[i].print();
			//$display("1");
		end
	end
endprogram
