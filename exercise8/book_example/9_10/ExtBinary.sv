class ExtBinary extends Binary;
	function new(input bit [3:0]val1, val2);
		super.new(val1,val2);
		//checkRandom(this);
	endfunction
	function int multiply();
		return (val1*val2);
	endfunction
	virtual function Binary copy();
		ExtBinary copyExt;		
		copyExt = new(15,8);
		copyExt.val1 = val1;
		copyExt.val2 = val2;
		return copyExt;
	endfunction

endclass
