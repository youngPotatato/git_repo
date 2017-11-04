`timescale 1ns/ 1ns
program automatic test;
	Trans t1,t2;
	byte tbytes[40];

	initial begin
		t1= new();
		t1.addr = 'h1a2a3a4a;
		t1.crc = '1;
		foreach(t1.data[i])
			t1.data[i] = i;
		t1.pack(tbytes);
		foreach(tbytes[i])
			$write("%h",tbytes[i]);
		$display;


	t2 = new();
	t2.unpack(tbytes);
	t2.display();

	end

endprogram
