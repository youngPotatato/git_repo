`timescale 1ns/1ns
package yy;
	class Trasaction;
		bit [1:0] addr;
		function Trasaction copy();
			Trasaction cc;
			cc = new();
			cc.addr = addr;
			return cc;
		endfunction
	endclass
endpackage
