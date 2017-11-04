program automatic tt;
	
	ExtBinary mc,mc2;
	Binary b;

	initial begin
		//********a
		//mc = new(15,8);
		//b  = mc;
		//********b
		//b   = new(15,8);
		//mc  = b;
		//********c
		mc   = new(15,8);
		b  = mc;
		mc2 = b;
		//********d
		mc   = new(15,8);
		b  = mc;
		//mc2 = b;
		$cast(mc2,b);
			//$display("success");
		//else
		//	$display("Error");
	end
endprogram
