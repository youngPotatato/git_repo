program automatic test;
	import yy::*;
	Transaction e1[] = new[50];
	initial begin
		foreach(e1[i]) begin
			e1[i] = new();
			checkRandom(e1[i]);
			e1[i].print_all();
		end
	end
endprogram
