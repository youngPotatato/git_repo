`timescale 1ns/1ns
module top;
	bit clk;
	always #50 clk = ~clk;
	arb_if		arb_if(clk);
	test		test(arb_if.Test);
	arb_dummy	arb_dummy(arb_if.DUT);



endmodule
