class Binary;
	rand bit [3:0] val1, val2;

	function new(input bit [3:0]val1, val2);
		this.val1 = val1;
		this.val2 = val2;
	endfunction

	virtual function void print_int(input int val);
		$display("val=0d%0d",val);
	endfunction
	function checkRandom(Binary m);
		do begin 
			if(!(m.randomize())) begin 
				$display("%s:%0d: Rand failed \" %s\"", `__FILE__,`__LINE__,`"m.randomize()`"); 
				$finish;  
			end 
		end while(0);
	endfunction
endclass
