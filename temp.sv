class Transation;
	logic [31:0] addr,csm,data[8];
	function new (input logic [31:0] a=3, d = 5);
		addr = a;
		data = '{default:d};

	endfunction
endclass


initial begin
	Transaction r;
	r = new (.a(10));
end
