module top;
	bit clk;
	always #(cycle/2) clk = ~clk;
	itf itf_inst(clk);
	test testyy(itf_inst);

endmodule
