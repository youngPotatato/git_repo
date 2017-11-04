program automatic test;
	//import yy::*;
	//Transaction e1[] = new[50];
	initial begin
		for(int i = 0; i < 3; i++)
			fork
				$write(i);	
			join_none
		$display();
	end
endprogram
