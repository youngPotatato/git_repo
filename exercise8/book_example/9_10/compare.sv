class Compare#(type yy = bit[3:0]);
	static function bit cc(yy v1, yy v2);
		return (v1 == v2);
	endfunction
endclass
