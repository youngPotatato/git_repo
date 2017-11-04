`timescale 1ns/1ns
program automatic test; 
	import yy::*;
	initial begin
		Trasaction ss,dd;
		ss = new();
		#4;
		dd = new ss;

	end
endprogram
