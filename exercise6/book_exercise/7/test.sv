program automatic test;
	import yy::*;
	Transaction e1[] = new[50];
	initial begin
		foreach(e1[i]) begin
			e1[i] = new();
			//e1[i].e1.constraint_mode(0);
			//e1[i].randomize() with {
			//	(!rw)-> {address inside {['d0:'d8]}};
			//				}
			//	;
			checkRandom(e1[i]);
			e1[i].print_all();
		end
	end
endprogram
