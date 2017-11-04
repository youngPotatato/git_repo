package yy;
	class Exercise1;
		rand bit[7:0] data;
		rand bit[3:0] address;
		static int addr_cnt[3] = {0,0,0};
		constraint e1 {
			data == 'h5;
			address dist {
				'd0:=10,
				['d1:'d14]:=80,
				'd15:=10
			};
		}
		function void post_randomize();
			if(address == 'd0)
				addr_cnt[0]++;
			if((address <= 'd14) && (address >= 'd1))
				addr_cnt[1]++;
			if(address == 'd15)
				addr_cnt[0]++;
		endfunction

		function void print;
			$write("data is %2h, addr is %2d\n",data,address);
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
