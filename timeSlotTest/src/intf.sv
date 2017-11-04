interface arb_if(input bit clk) ;
	logic [1 :0]	grant,req	;
	bit 		rst		;

	clocking cb@(posedge clk);
		output 	req;
		input	grant;
	endclocking

	modport Test(
		clocking 	cb,
		output		rst	
	);

	modport DUT(
		input		rst,clk,req,
		output		grant
	);

endinterface
