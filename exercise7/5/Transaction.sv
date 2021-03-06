package yy;
	typedef enum {READ,WRITE} rw_e;
	class Transaction;
		static rw_e old_rw;
		rand rw_e rw;
		rand bit[31:0] addr,data;
		constraint rw_c {
			if (old_rw == WRITE)
				rw != WRITE;
			
		}
		function void post_randomize();
			old_rw = rw;
		endfunction

		function void print_all;
			$display("addr = %d, data = %d, rw = %s",addr,data,rw);
		endfunction
	endclass

	function checkRandom(Transaction m);
		do begin 
			if(!(m.randomize())) begin 
				$display("%s:%0d: Rand failed \" %s\"", `__FILE__,`__LINE__,`"m.randomize()`"); 
				$finish;  
			end 
		end while(0);
	endfunction
endpackage
