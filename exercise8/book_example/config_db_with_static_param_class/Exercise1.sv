package yy;
	class Exercise1;
		rand bit	rw	;
		rand bit[7:0] 	data_in	;
		rand bit[3:0] 	address	;
		static int countA8;
		constraint e1 {
			(!rw)  -> {
					address inside {
					['d0:'d2]
				};
			}
		}
		function void post_randomize();
			if((address > 'd2) && (rw == 'd0)) begin
				countA8++;
				print();
			end
		endfunction

		function void print;
			$write("%s package data is %2h, addr is %4d\n",(rw)?"write":"read",data_in,address);
			$display;
		endfunction
	endclass

	function checkRandom(Exercise1 m);
		do begin 
			if(!(m.randomize())) begin 
				$display("%s:%0d: Rand failed \" %s\"", `__FILE__,`__LINE__,`"m.randomize()`"); 
				$finish;  
			end 
		end while(0);
	endfunction
endpackage
