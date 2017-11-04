class Trans;
	bit [31:0] addr,crc,data[8];
	static int count = 0;
	int id;

	function new();
		id = count ++;
	endfunction

	function void display();
		$write("tr: id = %d, addr = %x, crc = %x", id,addr,crc);
		$write("data is :\n");
		foreach(data[i]) $write("    %x\n",data[i]);
		$display;
	endfunction

	function void pack(ref byte bytes[40]);
		bytes = {>>{addr,crc,data}};
	endfunction

	function Trans unpack(ref byte bytes[40]);
		{>>{addr,crc,data}} = bytes;
	endfunction
endclass
