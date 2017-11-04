module arb_dummy(arb_if.DUT arb_if);
	initial begin
		fork
			#70 arb_if.grant = 1;
			#170 arb_if.grant = 2;
			#250 arb_if.grant = 3;
		join
	end

endmodule
