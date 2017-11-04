`timescale 1ns/1ns
package yy;
	class Trasaction;
		bit [1:0] addr;
		function new();
			$display("In %m");
		endfunction
	endclass
endpackage
