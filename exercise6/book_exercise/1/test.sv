program automatic test;
	import yy::*;
	Exercise1 e1,e2;
	initial begin
		e1 = new();
		e2 = new();
		checkRandom(e1);
		checkRandom(e2);
		e1.print();
		e2.print();
	end
endprogram
