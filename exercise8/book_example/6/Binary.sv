class Binary;
	rand bit [3:0] val1, val2;

	function new(input bit [3:0]val1, val2);
		this.val1 = val1;
		this.val2 = val2;
	endfunction

	virtual function void print_int(input int val);
		$display("val=0d%0d",val);
	endfunction
	virtual function Binary copy();
		copy = new(15,8);
		copy.val1 = val1;
		copy.val2 = val2;
	endfunction
endclass
