package yy;
	class MemTrans;
		logic [7:0] data_in;
		logic [3:0] address;
		static logic [3:0] last_add;
		function new(logic [7:0]d_in= 'h0, logic [3:0]add_in = 'h0);
			data_in = d_in;
			address = add_in;
			last_add = add_in;
		endfunction
		function void print;
			$write("data in\n");
			foreach(data_in[i]) begin
				$write(data_in[i]);
			end
			$write("\n");
			$write("address\n");
			foreach(address[i]) begin
				$write(address[i]);
			end
			$write("\n");
			$display;
		endfunction
		static function void print_last_add;
			$write("last add is %x\n",last_add);
			$display;
		endfunction
	endclass
endpackage