package yy;
	class Exercise1;
		rand bit[7:0] data;
		rand bit[3:0] address;
		constraint e1 {
			address inside {['d3:'d4]};
		}
		function void print;
			$write("data is %2h, addr is %2d\n",data,address);
			$display;
		endfunction
		//function new(logic [7:0]d_in= 'h0, logic [3:0]add_in = 'h0);
		//	data_in = d_in;
		//	address = add_in;
		//	last_add = add_in; //endfunction
		//function void print;
		//	$write("data in\n");
		//	foreach(data_in[i]) begin
		//		$write(data_in[i]);
		//	end
		//	$write("\n");
		//	$write("address\n");
		//	foreach(address[i]) begin
		//		$write(address[i]);
		//	end
		//	$write("\n");
		//	$display;
		//endfunction
		//static function void print_last_add;
		//	$write("last add is %x\n",last_add);
		//	$display;
		//endfunction
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
