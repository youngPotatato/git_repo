program automatic test;
	import yy::*;
	
	//`define SV_RAND_CKECK(r) do begin \
	//	if(!(m.randomize())) begin \
	//		$display("%s:%0d: Rand failed \" %s\"", `__FILE__,`__LINE__,`"r`"); \
	//		$finish; \ 
	//	end \
	//end while(0)


	initial begin
		MemTrans m = new();
		checkRandom(m);
		//do begin 
		//	if(!(m.randomize())) begin 
		//		$display("%s:%0d: Rand failed \" %s\"", `__FILE__,`__LINE__,`"m.randomize()`"); 
		//		$finish;  
		//	end 
		//end while(0);
	end
endprogram
