class config_db #(type T = int);
	static T db[string];
	static function void set(input string name, input T value);
		db[name] = value;
	endfunction


	static function void get(input string name, ref T kk);
		kk = db[name];
	endfunction

	static function void print();
		$display("\nConfiguration database %s", $typename(T));
		foreach(db[i])
			$display("db[%s] is %p",i,db[i]);
	endfunction
endclass
