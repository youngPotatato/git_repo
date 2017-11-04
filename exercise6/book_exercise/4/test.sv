program automatic test;
	import yy::*;
	Exercise1 e1[] = new[1000];
	initial begin
		foreach(e1[i]) begin
			e1[i] = new();
			checkRandom(e1[i]);
			//e1[i].print();
		end
		$display("addr0 ---- %4d times\naddr1 ---- %4d times\naddr2 ---- %4d times\n",Exercise1::addr_cnt[0],Exercise1::addr_cnt[1],Exercise1::addr_cnt[2],);
	end
endprogram
