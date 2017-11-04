class ExtBinary extends Binary;
	function new();
		super.new(1,11);
		checkRandom(this);
	endfunction
	function int multiply();
		return (val1*val2);
	endfunction
	constraint exercise3 {
		val1 < 10;
		val1 < 10;
	}

endclass
