program automatic tt;
	
	ExtBinary mc,mc2;

	initial begin
		mc = new(13,11);
		$cast(mc2,mc.copy());
	end
endprogram
